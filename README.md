# Jobsy

## 📱 About Jobsy

**Jobsy** is a comprehensive job search and career management mobile application built with Flutter. It connects job seekers with employment opportunities while providing powerful tools for managing their professional profile and career development. 
<br/>(Full Stack Clone of **Alfred App** here in Iceland - www.alfred.is)

### 🎯 **Core Functionalities**

#### **Job Search & Discovery**
- **Browse Job Listings**: View all available job opportunities with detailed descriptions
- **Smart Filtering**: Filter jobs by type (Full-time, Part-time, Internship, Freelance, Temporary) (Work in progress)
- **Location-Based Search**: Find jobs by location with integrated Google Maps
- **Remote Work Support**: Special handling for remote job opportunities
- **Job Categories**: Browse jobs by profession and industry (Work in progress)

#### **Company & Workplace Information**
- **Company Profiles**: Detailed information about employers and workplaces
- **Work Environment Details**: Learn about company culture and work environment
- **Employee Count**: Company size and scale information
- **Company Logos**: Visual company branding and recognition

#### **Career Profile Management**
- **Professional Profile**: Create and maintain a comprehensive professional profile
- **Skills Management**: Add, edit, and showcase your professional skills
- **Work Experience**: Document and display your job history and achievements
- **Education History**: Track your educational background and qualifications
- **Language Skills**: Highlight your language proficiencies and levels
- **References & Recommendations**: Manage professional references and endorsements
- **Portfolio Links**: Share your work samples and online presence (Work in progress)

#### **Application Management**
- **Job Applications**: Track all your job applications in one place
- **Application Status**: Monitor the progress of your applications
- **Favorites System**: Save interesting jobs for later review
- **Application History**: Complete record of your job search activities

#### **Professional Development**
- **Course Discovery**: Browse available training and certification courses
- **Course Categories**: Find courses by type (Remote, Onsite, Open courses)
- **Professional Growth**: Track your learning and development journey (Work in progress)

### 🌟 **Key Features**

- **Multi-Language Support**: Available in English and Icelandic
- **Dark/Light Theme**: Customizable app appearance (Work in progress)
- **Push Notifications**: Stay updated on new opportunities and application status (Work in progress)
- **Cross-Platform**: Works seamlessly on iOS and Android
- **Modern UI/UX**: Beautiful, intuitive interface following Material Design principles
- **Responsive Design**: Optimized for all device sizes and orientations

### 🎨 **User Experience**

- **Intuitive Navigation**: Easy-to-use interface with clear navigation paths
- **Search & Discovery**: Powerful search capabilities with smart filtering (Work in progress)
- **Profile Customization**: Flexible profile building with drag-and-drop sections
- **Real-time Updates**: Live updates for job listings and application status
- **Personalization**: Tailored experience based on user preferences and history (Work in progress)

### 🚀 **Target Users**

- **Job Seekers**: Individuals looking for new employment opportunities
- **Career Changers**: Professionals seeking to transition to new fields
- **Recent Graduates**: New entrants to the job market
- **Remote Workers**: Professionals seeking location-independent opportunities
- **Career Developers**: Individuals focused on professional growth and learning

## :package: Packages
- GoogleFonts - https://pub.dev/packages/google_fonts
- GoRouter - https://pub.dev/packages/go_router
- Intl - https://pub.dev/packages/intl
- CachedNetworkImage - https://pub.dev/packages/cached_network_image
- Provider - https://pub.dev/packages/provider
- WoltModalSheet - https://pub.dev/packages/wolt_modal_sheet
- FirebaseAuth - https://pub.dev/packages/firebase_auth
- FirebaseCore - https://pub.dev/packages/firebase_core
- CloudFirestore - https://pub.dev/packages/cloud_firestore
- Collection - https://pub.dev/packages/collection
- SharedPrefs - https://pub.dev/packages/shared_preferences
- Toastification - https://pub.dev/packages/toastification
- FlutterSvg - https://pub.dev/packages/flutter_svg
- CountryPicker - https://pub.dev/packages/country_picker
- Shimmer - https://pub.dev/packages/shimmer
- FlutterAnimate - https://pub.dev/packages/flutter_animate
- SharePlus - https://pub.dev/packages/share_plus
- EasyLocalization - https://pub.dev/packages/easy_localization
- GoogleMaps - https://pub.dev/packages/google_maps_flutter

## Screenshot
![White   Green Mobile Mockup Photo Collage Beauty Facebook Post](https://github.com/user-attachments/assets/2e9d8917-cf18-4dc1-9b8f-ae97e7ce85b0)

## Environment Setup

This project uses secure configuration for Google Maps API keys. The implementation follows security best practices to prevent API keys from being committed to version control.

### Google Maps API Key Setup

#### Prerequisites
1. **Google Cloud Console**: Create a project and enable the Maps SDK for iOS and Android
2. **API Key**: Generate an API key with appropriate restrictions
3. **Billing**: Ensure billing is enabled for your Google Cloud project

#### iOS Configuration

1. **Update Debug Configuration** (for local development):
   ```bash
   # Edit ios/Flutter/Debug.xcconfig
   # Replace YOUR_API_KEY_HERE with your actual Google Maps API key
   GOOGLE_MAPS_API_KEY=YOUR_ACTUAL_API_KEY_HERE
   ```

2. **Update Release Configuration** (for production builds):
   ```bash
   # Edit ios/Flutter/Release.xcconfig
   # This references an environment variable for CI/CD
   GOOGLE_MAPS_API_KEY=$(GOOGLE_MAPS_API_KEY_ENVIRONMENT_VARIABLE)
   ```

3. **Verify Configuration**:
   - The `ios/Runner/Info.plist` already contains the necessary configuration
   - The `ios/Runner/AppDelegate.swift` reads the key from configuration
   - The `ios/.gitignore` prevents the Debug.xcconfig from being committed

#### Android Configuration

1. **Create/Update local.properties**:
   ```bash
   # Create android/local.properties (if it doesn't exist)
   # Add your Google Maps API key
   googleMapsApiKey=YOUR_ACTUAL_API_KEY_HERE
   ```

2. **Verify build.gradle.kts**:
   - The `android/app/build.gradle.kts` should reference the API key from local.properties
   - The `android/.gitignore` should exclude local.properties

#### Environment Variables for CI/CD

For production builds and CI/CD pipelines, set these environment variables:

```bash
# iOS
export GOOGLE_MAPS_API_KEY_ENVIRONMENT_VARIABLE="your_api_key_here"

# Android
export GOOGLE_MAPS_API_KEY="your_api_key_here"
```

#### Security Features

✅ **No Hardcoded Keys**: API keys are never committed to version control  
✅ **Graceful Fallback**: App handles missing API keys gracefully  
✅ **Environment Separation**: Different keys for debug vs release builds  
✅ **CI/CD Ready**: Environment variables for automated builds  

#### Troubleshooting

**App shows "Maps Unavailable" message?**
- Check that your API key is correctly set in the configuration files
- Verify the API key has Maps SDK enabled in Google Cloud Console
- Ensure billing is enabled for your Google Cloud project

**Build fails with API key errors?**
- Verify the configuration files are properly formatted
- Check that environment variables are set for CI/CD builds
- Ensure the API key is not wrapped in quotes in configuration files

#### File Structure

```
ios/
├── Flutter/
│   ├── Debug.xcconfig          # Contains your API key (gitignored)
│   ├── Debug.xcconfig.template # Template file (committed)
│   └── Release.xcconfig        # References environment variable
├── Runner/
│   ├── AppDelegate.swift       # Reads key from configuration
│   └── Info.plist             # Contains key configuration
└── .gitignore                 # Excludes Debug.xcconfig

android/
├── local.properties           # Contains your API key (gitignored)
├── app/build.gradle.kts      # References the API key
└── .gitignore                # Excludes local.properties
```

**Note**: The `Debug.xcconfig` and `local.properties` files are intentionally excluded from version control to protect your API keys.
