import 'package:cached_network_image/cached_network_image.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:codehatch/models/workplace_model.dart';
import 'package:codehatch/providers/application_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ApplicationProvider>().loadApplications();
    });
  }

  //TODO - Option to remove / undo application
  @override
  Widget build(BuildContext context) {
    final applicationProvider = context.watch<ApplicationProvider>();
    final applications = applicationProvider.applications;

    return Scaffold(
      appBar: AppBar(
        title: Text('${'inbox'.tr()} (${applications.length})'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list, color: JobsyColors.whiteColor),
          ),
        ],
      ),
      body: applicationProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : applications.isEmpty
          ? const ApplicationEmptyState()
          : CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        ApplicationCard(application: applications[index]),
                    childCount: applications.length,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
              ],
            ),
    );
  }
}

class ApplicationEmptyState extends StatelessWidget {
  const ApplicationEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.inbox_outlined,
            size: 80,
            color: JobsyColors.greyColor,
          ),
          const SizedBox(height: 16),
          Text(
            'no_applications'.tr(),
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: JobsyColors.greyColor),
          ),
          const SizedBox(height: 8),
          Text(
            'applications_will_appear_here'.tr(),
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: JobsyColors.greyColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ApplicationCard extends StatelessWidget {
  const ApplicationCard({super.key, required this.application});

  final ApplicationModel application;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final applicationProvider = context.watch<ApplicationProvider>();
    final workplace = applicationProvider.getWorkplaceForApplication(
      application.id,
    );

    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 8,
              left: 16,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'applied'.tr().toUpperCase(),
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: JobsyColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  application.appliedDate.toShortFormattedDate(),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: JobsyColors.greyColor,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: JobsyColors.greyColor.withValues(alpha: 0.3)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              spacing: 16,
              children: [
                workplace?.logoUrl != null
                    ? LogoEmptyState(workplace: workplace)
                    : Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: JobsyColors.greyColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.business,
                          color: JobsyColors.greyColor,
                          size: 30,
                        ),
                      ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        application.jobTitle,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        application.companyName,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: JobsyColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LogoEmptyState extends StatelessWidget {
  const LogoEmptyState({super.key, required this.workplace});

  final WorkplaceModel? workplace;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: workplace!.logoUrl!,
      width: 60,
      height: 60,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: JobsyColors.greyColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.business,
          color: JobsyColors.greyColor,
          size: 30,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: JobsyColors.greyColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.business,
          color: JobsyColors.greyColor,
          size: 30,
        ),
      ),
    );
  }
}
