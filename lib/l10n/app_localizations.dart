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

  /// No description provided for @older_jobs.
  ///
  /// In en, this message translates to:
  /// **'Older'**
  String get older_jobs;

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

  /// No description provided for @about_you_empty.
  ///
  /// In en, this message translates to:
  /// **'No information about you added yet'**
  String get about_you_empty;

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

  /// No description provided for @no_skills.
  ///
  /// In en, this message translates to:
  /// **'No skills added yet'**
  String get no_skills;

  /// No description provided for @my_skills.
  ///
  /// In en, this message translates to:
  /// **'My skills'**
  String get my_skills;

  /// No description provided for @skills_display.
  ///
  /// In en, this message translates to:
  /// **'Your skills will appear here'**
  String get skills_display;

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

  /// No description provided for @no_language_added.
  ///
  /// In en, this message translates to:
  /// **'No languages added yet'**
  String get no_language_added;

  /// No description provided for @language_succesfully_added.
  ///
  /// In en, this message translates to:
  /// **'Language successfully added'**
  String get language_succesfully_added;

  /// No description provided for @language_add_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to add language'**
  String get language_add_failed;

  /// No description provided for @which_language_do_you_speak.
  ///
  /// In en, this message translates to:
  /// **'Which language do you speak?'**
  String get which_language_do_you_speak;

  /// No description provided for @how_well_do_you_speak_it.
  ///
  /// In en, this message translates to:
  /// **'How well do you speak it?'**
  String get how_well_do_you_speak_it;

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
  /// **'In progress'**
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
  /// **'Latest jobs'**
  String get newest_jobs;

  /// No description provided for @all_jobs.
  ///
  /// In en, this message translates to:
  /// **'All jobs'**
  String get all_jobs;

  /// No description provided for @workplaces.
  ///
  /// In en, this message translates to:
  /// **'Workplaces'**
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

  /// No description provided for @unsave.
  ///
  /// In en, this message translates to:
  /// **'Unsave'**
  String get unsave;

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

  /// No description provided for @saved_jobs.
  ///
  /// In en, this message translates to:
  /// **'Saved Jobs'**
  String get saved_jobs;

  /// No description provided for @no_saved_jobs.
  ///
  /// In en, this message translates to:
  /// **'No saved jobs yet'**
  String get no_saved_jobs;

  /// No description provided for @jobs_displayed.
  ///
  /// In en, this message translates to:
  /// **'Jobs you save will appear here'**
  String get jobs_displayed;

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

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @remote_course.
  ///
  /// In en, this message translates to:
  /// **'Remote'**
  String get remote_course;

  /// No description provided for @onsite_course.
  ///
  /// In en, this message translates to:
  /// **'Onsite'**
  String get onsite_course;

  /// No description provided for @open_course.
  ///
  /// In en, this message translates to:
  /// **'Open course'**
  String get open_course;

  /// No description provided for @courses.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get courses;

  /// No description provided for @inbox.
  ///
  /// In en, this message translates to:
  /// **'Inbox'**
  String get inbox;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Starts'**
  String get startDate;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Timespan'**
  String get duration;

  /// No description provided for @job_not_found.
  ///
  /// In en, this message translates to:
  /// **'Job not found'**
  String get job_not_found;

  /// No description provided for @date_of_birth.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get date_of_birth;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @phone_nr.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone_nr;

  /// No description provided for @take_photo.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get take_photo;

  /// No description provided for @select_from_gallery.
  ///
  /// In en, this message translates to:
  /// **'Select from gallery'**
  String get select_from_gallery;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @which_company.
  ///
  /// In en, this message translates to:
  /// **'Which company'**
  String get which_company;

  /// No description provided for @which_position.
  ///
  /// In en, this message translates to:
  /// **'What was your position'**
  String get which_position;

  /// No description provided for @start_date.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get start_date;

  /// No description provided for @end_date.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get end_date;

  /// No description provided for @describe_position.
  ///
  /// In en, this message translates to:
  /// **'What were your responsibilities, the projects you were working on and more...'**
  String get describe_position;

  /// No description provided for @describe_label.
  ///
  /// In en, this message translates to:
  /// **'Describe your job and responsibilities'**
  String get describe_label;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @about_yourself.
  ///
  /// In en, this message translates to:
  /// **'Tell us about yourself'**
  String get about_yourself;

  /// No description provided for @describe_experience.
  ///
  /// In en, this message translates to:
  /// **'Describe your experience, skills, and what makes you unique...'**
  String get describe_experience;

  /// No description provided for @no_job_added.
  ///
  /// In en, this message translates to:
  /// **'No job experience added yet'**
  String get no_job_added;

  /// No description provided for @end_date_error.
  ///
  /// In en, this message translates to:
  /// **'End date cannot be before start date'**
  String get end_date_error;

  /// No description provided for @job_successfully_added.
  ///
  /// In en, this message translates to:
  /// **'Job experience saved successfully!'**
  String get job_successfully_added;

  /// No description provided for @job_add_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save job experience'**
  String get job_add_failed;

  /// No description provided for @school.
  ///
  /// In en, this message translates to:
  /// **'School'**
  String get school;

  /// No description provided for @field.
  ///
  /// In en, this message translates to:
  /// **'Field of study'**
  String get field;

  /// No description provided for @degree.
  ///
  /// In en, this message translates to:
  /// **'Select a degree'**
  String get degree;

  /// No description provided for @education_successfully_added.
  ///
  /// In en, this message translates to:
  /// **'Education successfully added'**
  String get education_successfully_added;

  /// No description provided for @education_add_failed.
  ///
  /// In en, this message translates to:
  /// **'Education add failed'**
  String get education_add_failed;

  /// No description provided for @no_education_added.
  ///
  /// In en, this message translates to:
  /// **'No education added yet'**
  String get no_education_added;

  /// No description provided for @job_title.
  ///
  /// In en, this message translates to:
  /// **'Job title'**
  String get job_title;

  /// No description provided for @no_reference_added.
  ///
  /// In en, this message translates to:
  /// **'No references added yet'**
  String get no_reference_added;

  /// No description provided for @reference_successfully_added.
  ///
  /// In en, this message translates to:
  /// **'Reference successfully added'**
  String get reference_successfully_added;

  /// No description provided for @reference_add_failed.
  ///
  /// In en, this message translates to:
  /// **'Refence add failed'**
  String get reference_add_failed;

  /// No description provided for @no_link_added.
  ///
  /// In en, this message translates to:
  /// **'No link added yet'**
  String get no_link_added;

  /// No description provided for @link_succesfully_added.
  ///
  /// In en, this message translates to:
  /// **'Link successfully added'**
  String get link_succesfully_added;

  /// No description provided for @link_add_failed.
  ///
  /// In en, this message translates to:
  /// **'Link add failed'**
  String get link_add_failed;

  /// No description provided for @link_site.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get link_site;

  /// No description provided for @link_media.
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get link_media;

  /// No description provided for @log_out.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get log_out;

  /// No description provided for @sure_to_logout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get sure_to_logout;

  /// No description provided for @have_been_logged_out.
  ///
  /// In en, this message translates to:
  /// **'You have been signed out'**
  String get have_been_logged_out;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// No description provided for @welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcome_back;

  /// No description provided for @signup_start.
  ///
  /// In en, this message translates to:
  /// **'Sign up to get started with Jobsy'**
  String get signup_start;

  /// No description provided for @signin_start.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue with Jobsy'**
  String get signin_start;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get sign_in;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_account;

  /// No description provided for @dont_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dont_have_account;

  /// No description provided for @reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get reset_password;

  /// No description provided for @just_now.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get just_now;

  /// No description provided for @remote.
  ///
  /// In en, this message translates to:
  /// **'Remote'**
  String get remote;

  /// No description provided for @workplace_not_found.
  ///
  /// In en, this message translates to:
  /// **'Workplace not found'**
  String get workplace_not_found;

  /// No description provided for @beginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get beginner;

  /// No description provided for @basic_skills.
  ///
  /// In en, this message translates to:
  /// **'Basic Skills'**
  String get basic_skills;

  /// No description provided for @intermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get intermediate;

  /// No description provided for @advanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get advanced;

  /// No description provided for @expert.
  ///
  /// In en, this message translates to:
  /// **'Expert'**
  String get expert;

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @send_email.
  ///
  /// In en, this message translates to:
  /// **'Send us an Email'**
  String get send_email;

  /// No description provided for @help_centre.
  ///
  /// In en, this message translates to:
  /// **'Help Centre'**
  String get help_centre;

  /// No description provided for @help_support.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get help_support;

  /// No description provided for @application_updates.
  ///
  /// In en, this message translates to:
  /// **'Application Updates'**
  String get application_updates;

  /// No description provided for @push_emails_sms.
  ///
  /// In en, this message translates to:
  /// **'Push, emails, SMS'**
  String get push_emails_sms;

  /// No description provided for @push_sms.
  ///
  /// In en, this message translates to:
  /// **'Push, SMS'**
  String get push_sms;

  /// No description provided for @new_job.
  ///
  /// In en, this message translates to:
  /// **'New Job Matches'**
  String get new_job;

  /// No description provided for @notification_settings.
  ///
  /// In en, this message translates to:
  /// **'Notification Settings'**
  String get notification_settings;

  /// No description provided for @dark_theme.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get dark_theme;

  /// No description provided for @light_theme.
  ///
  /// In en, this message translates to:
  /// **'Light Theme'**
  String get light_theme;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @automatic_translation.
  ///
  /// In en, this message translates to:
  /// **'Automatically translate all job information to english'**
  String get automatic_translation;

  /// No description provided for @machine_translation.
  ///
  /// In en, this message translates to:
  /// **'Machine Translation'**
  String get machine_translation;

  /// No description provided for @change_language.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get change_language;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @delete_jobs.
  ///
  /// In en, this message translates to:
  /// **'Delete jobs?'**
  String get delete_jobs;

  /// No description provided for @confirm_delete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all jobs?'**
  String get confirm_delete;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;
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
