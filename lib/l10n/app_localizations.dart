import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_is.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('is'),
  ];

  /// No description provided for @vacancies.
  ///
  /// In en, this message translates to:
  /// **'All jobs'**
  String get vacancies;

  /// No description provided for @new_today.
  ///
  /// In en, this message translates to:
  /// **'New today'**
  String get new_today;

  /// No description provided for @full_time.
  ///
  /// In en, this message translates to:
  /// **'Full time'**
  String get full_time;

  /// No description provided for @part_time.
  ///
  /// In en, this message translates to:
  /// **'Part time'**
  String get part_time;

  /// No description provided for @internship.
  ///
  /// In en, this message translates to:
  /// **'Internship'**
  String get internship;

  /// No description provided for @freelance.
  ///
  /// In en, this message translates to:
  /// **'Freelance'**
  String get freelance;

  /// No description provided for @temporary.
  ///
  /// In en, this message translates to:
  /// **'Temporary'**
  String get temporary;

  /// No description provided for @download_profile.
  ///
  /// In en, this message translates to:
  /// **'Download profile'**
  String get download_profile;

  /// No description provided for @attachments.
  ///
  /// In en, this message translates to:
  /// **'Attachments'**
  String get attachments;

  /// No description provided for @about_you.
  ///
  /// In en, this message translates to:
  /// **'About You'**
  String get about_you;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Electronic verification'**
  String get verification;

  /// No description provided for @job_experience.
  ///
  /// In en, this message translates to:
  /// **'Job Experience'**
  String get job_experience;

  /// No description provided for @add_job.
  ///
  /// In en, this message translates to:
  /// **'Add new experience'**
  String get add_job;

  /// No description provided for @education.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get education;

  /// No description provided for @add_education.
  ///
  /// In en, this message translates to:
  /// **'Add new education'**
  String get add_education;

  /// No description provided for @skills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skills;

  /// No description provided for @add_skills.
  ///
  /// In en, this message translates to:
  /// **'Add skills'**
  String get add_skills;

  /// No description provided for @languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languages;

  /// No description provided for @icelandic.
  ///
  /// In en, this message translates to:
  /// **'Icelandic'**
  String get icelandic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @add_language.
  ///
  /// In en, this message translates to:
  /// **'Add a language'**
  String get add_language;

  /// No description provided for @references.
  ///
  /// In en, this message translates to:
  /// **'References'**
  String get references;

  /// No description provided for @add_reference.
  ///
  /// In en, this message translates to:
  /// **'Add recommendation'**
  String get add_reference;

  /// No description provided for @links.
  ///
  /// In en, this message translates to:
  /// **'Links'**
  String get links;

  /// No description provided for @add_link.
  ///
  /// In en, this message translates to:
  /// **'Add new link'**
  String get add_link;

  /// No description provided for @job_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get job_description;

  /// No description provided for @about_workplace.
  ///
  /// In en, this message translates to:
  /// **'About the company'**
  String get about_workplace;

  /// No description provided for @responsibilities.
  ///
  /// In en, this message translates to:
  /// **'Responsibilities'**
  String get responsibilities;

  /// No description provided for @education_requirements.
  ///
  /// In en, this message translates to:
  /// **'Education and general requirements'**
  String get education_requirements;

  /// No description provided for @job_rate.
  ///
  /// In en, this message translates to:
  /// **'Occupation rate'**
  String get job_rate;

  /// No description provided for @ad_published.
  ///
  /// In en, this message translates to:
  /// **'Ad published'**
  String get ad_published;

  /// No description provided for @application_deadline.
  ///
  /// In en, this message translates to:
  /// **'Application deadline'**
  String get application_deadline;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @language_skills.
  ///
  /// In en, this message translates to:
  /// **'Language skills'**
  String get language_skills;

  /// No description provided for @job_location.
  ///
  /// In en, this message translates to:
  /// **'Job location'**
  String get job_location;

  /// No description provided for @job_type.
  ///
  /// In en, this message translates to:
  /// **'Job Type'**
  String get job_type;

  /// No description provided for @job_tags.
  ///
  /// In en, this message translates to:
  /// **'Job Tags'**
  String get job_tags;

  /// No description provided for @more_jobs.
  ///
  /// In en, this message translates to:
  /// **'More jobs'**
  String get more_jobs;

  /// No description provided for @about_company.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about_company;

  /// No description provided for @employees.
  ///
  /// In en, this message translates to:
  /// **'Employees'**
  String get employees;

  /// No description provided for @work_environment.
  ///
  /// In en, this message translates to:
  /// **'Work environment'**
  String get work_environment;

  /// No description provided for @latest_jobs.
  ///
  /// In en, this message translates to:
  /// **'Latest jobs'**
  String get latest_jobs;

  /// No description provided for @in_progress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get in_progress;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @ended.
  ///
  /// In en, this message translates to:
  /// **'Ended'**
  String get ended;

  /// No description provided for @course_type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get course_type;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @about_course.
  ///
  /// In en, this message translates to:
  /// **'About the course'**
  String get about_course;

  /// No description provided for @course_category.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get course_category;

  /// No description provided for @more_from.
  ///
  /// In en, this message translates to:
  /// **'More from'**
  String get more_from;

  /// No description provided for @open_map.
  ///
  /// In en, this message translates to:
  /// **'Open map'**
  String get open_map;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @newest_jobs.
  ///
  /// In en, this message translates to:
  /// **'Newest jobs'**
  String get newest_jobs;

  /// No description provided for @all_jobs.
  ///
  /// In en, this message translates to:
  /// **'All jobs'**
  String get all_jobs;

  /// No description provided for @workplaces.
  ///
  /// In en, this message translates to:
  /// **'The Workplaces'**
  String get workplaces;

  /// No description provided for @the_workplace.
  ///
  /// In en, this message translates to:
  /// **'The workplace'**
  String get the_workplace;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @requirement.
  ///
  /// In en, this message translates to:
  /// **'Requirement'**
  String get requirement;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @sort_search.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort_search;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'is'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'is':
      return AppLocalizationsIs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
