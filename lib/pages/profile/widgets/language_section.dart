import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:codehatch/pages/profile/widgets/profile_action_button.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:codehatch/providers/language_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:codehatch/utils/validators.dart';
import 'package:codehatch/widgets/app_textform_field.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class LanguageSection extends StatefulWidget {
  const LanguageSection({super.key});

  @override
  State<LanguageSection> createState() => _LanguageSectionState();
}

class _LanguageSectionState extends State<LanguageSection> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LanguageProvider>().loadLanguages();
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return SliverToBoxAdapter(
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) => Column(
          children: [
            ProfileHeader(text: local.languages),
            if (languageProvider.isLoading)
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                ),
              )
            else if (languageProvider.languages.isEmpty)
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      local.no_language_added,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: JobsyColors.greyColor,
                      ),
                    ),
                  ),
                ),
              )
            else
              Card(
                child: Column(
                  children: List.generate(
                    languageProvider.languages.length * 2 - 1,
                    (index) {
                      if (index.isOdd) {
                        return Divider(
                          color: JobsyColors.greyColor.withValues(alpha: 0.3),
                          thickness: 1,
                        );
                      }

                      final language = languageProvider.languages[index ~/ 2];
                      return Dismissible(
                        key: Key(language.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: JobsyColors.errorColor,
                          ),
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 16.0),
                          child: const Icon(
                            Icons.delete,
                            color: JobsyColors.whiteColor,
                          ),
                        ),
                        onDismissed: (direction) =>
                            languageProvider.deleteLanguage(language.id),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    language.flagEmoji.isNotEmpty
                                        ? language.flagEmoji
                                        : language.flagCode,
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    language.name,
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                language.level,
                                style: theme.textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            if (languageProvider.error != null)
              Card(
                color: Colors.red.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    languageProvider.error!,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ProfileAddBtn(
              title: local.add_language,
              onPressed: () {
                WoltModalSheet.show(
                  context: context,
                  pageListBuilder: (bottomSheetContext) => [
                    SliverWoltModalSheetPage(
                      trailingNavBarWidget: IconButton(
                        padding: const EdgeInsets.all(16),
                        icon: const Icon(Icons.close),
                        onPressed: Navigator.of(bottomSheetContext).pop,
                      ),
                      backgroundColor: JobsyColors.scaffoldColor,
                      mainContentSliversBuilder: (context) => [
                        const LanguageForm(),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageForm extends StatefulWidget {
  const LanguageForm({super.key});

  @override
  State<LanguageForm> createState() => _LanguageFormState();
}

class _LanguageFormState extends State<LanguageForm> {
  final TextEditingController _languageController = TextEditingController();
  final TextEditingController _proficiencyController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Country? _selectedCountry;

  @override
  void dispose() {
    _languageController.dispose();
    _proficiencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._buildEditFields(theme, local, context),
              const SizedBox(height: 16),
              Row(
                children: [
                  ProfileActionButton(
                    text: local.cancel,
                    color: JobsyColors.greyColor.withValues(alpha: 0.2),
                    onPressed: () => context.pop(),
                  ),
                  const SizedBox(width: 16),
                  ProfileActionButton(
                    text: local.save,
                    color: JobsyColors.primaryColor,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _saveLanguage(context, local);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveLanguage(
    BuildContext context,
    AppLocalizations local,
  ) async {
    final languageProvider = context.read<LanguageProvider>();

    try {
      final newLanguage = LanguageModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _languageController.text.trim(),
        level: _proficiencyController.text.trim(),
        flagCode: _selectedCountry!.countryCode,
        flagEmoji: _selectedCountry!.flagEmoji,
      );
      await languageProvider.addLanguage(newLanguage);
      if (context.mounted) {
        context.pop();
        context.showToast(
          title: local.language_succesfully_added,
          type: ToastType.success,
          textColor: JobsyColors.whiteColor,
          duration: const Duration(seconds: 5),
        );
      }
    } catch (e) {
      if (context.mounted) {
        context.showToast(
          title: '${local.language_add_failed}: $e',
          type: ToastType.error,
        );
      }
    }
  }

  final CountryListThemeData _countryListTheme = CountryListThemeData(
    flagSize: 32,
    backgroundColor: JobsyColors.scaffoldColor,
    textStyle: const TextStyle(fontSize: 16, color: JobsyColors.whiteColor),
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(12.0),
      topRight: Radius.circular(12.0),
    ),
    inputDecoration: InputDecoration(
      filled: true,
      fillColor: JobsyColors.cardColor,
      hintText: 'local.search',
      hintStyle: TextStyle(
        color: JobsyColors.greyColor.withValues(alpha: 0.6),
        fontSize: 16,
      ),
      prefixIcon: const Icon(Icons.search, color: JobsyColors.primaryColor),
      contentPadding: const EdgeInsets.symmetric(vertical: 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(34),
        borderSide: BorderSide.none,
      ),
    ),
  );

  List<Widget> _buildEditFields(
    ThemeData theme,
    AppLocalizations local,
    BuildContext context,
  ) {
    return [
      GestureDetector(
        onTap: () {
          showCountryPicker(
            context: context,
            countryListTheme: _countryListTheme,
            onSelect: (Country country) {
              setState(() {
                _selectedCountry = country;
                _languageController.text = country.name;
              });
            },
          );
        },
        child: AbsorbPointer(
          child: AppTextFormField(
            controller: _languageController,
            textInputAction: TextInputAction.done,
            hintText: _selectedCountry != null
                ? _selectedCountry!.name
                : local.which_language_do_you_speak,
            labelText: local.which_language_do_you_speak,
            suffix: const Icon(Icons.keyboard_arrow_right),
            readOnly: true,
            prefixIcon: _selectedCountry != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                    child: Text(
                      _selectedCountry!.flagEmoji,
                      style: const TextStyle(fontSize: 20),
                    ),
                  )
                : const Icon(Icons.language),
            validator: (value) => value?.languageError,
          ),
        ),
      ),
      const SizedBox(height: 16),
      GestureDetector(
        onTap: () {
          WoltModalSheet.show(
            context: context,
            pageListBuilder: (bottomSheetContext) => [
              SliverWoltModalSheetPage(
                trailingNavBarWidget: IconButton(
                  padding: const EdgeInsets.all(16),
                  icon: const Icon(Icons.close),
                  onPressed: Navigator.of(bottomSheetContext).pop,
                ),
                backgroundColor: JobsyColors.scaffoldColor,
                mainContentSliversBuilder: (context) => [
                  SliverList.separated(
                    itemCount: LanguageProficiency.values.length,
                    separatorBuilder: (context, index) => Divider(
                      indent: 16,
                      endIndent: 16,
                      color: JobsyColors.greyColor.withValues(alpha: 0.3),
                    ),

                    itemBuilder: (context, index) {
                      final proficiency = LanguageProficiency.values[index];
                      return ListTile(
                        visualDensity: const VisualDensity(
                          horizontal: 0,
                          vertical: -4,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        onTap: () {
                          setState(() {
                            _proficiencyController.text = proficiency.label;
                          });
                          context.pop();
                        },
                        title: Text(
                          proficiency.label,
                          style: theme.textTheme.bodyLarge,
                        ),
                      );
                    },
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                ],
              ),
            ],
          );
        },
        child: AbsorbPointer(
          child: AppTextFormField(
            controller: _proficiencyController,
            labelText: local.how_well_do_you_speak_it,
            suffix: const Icon(Icons.keyboard_arrow_right),
            readOnly: true,
            //TODO - Find appropriate icon
            prefixIcon: const Icon(Icons.info),
            validator: (value) => value?.languageError,
          ),
        ),
      ),
    ];
  }
}
