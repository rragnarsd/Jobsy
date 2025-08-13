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

This project uses Google Maps for location features. To get it working locally:

### Quick Setup

1. **Get a Google Maps API Key**:
   - Go to [Google Cloud Console](https://console.cloud.google.com/)
   - Create a project and enable Maps SDK for iOS and Android
   - Generate an API key

2. **iOS Setup**:
   ```bash
   # Edit ios/Flutter/Debug.xcconfig
   # Replace YOUR_API_KEY_HERE with your actual key
   GOOGLE_MAPS_API_KEY=YOUR_API_KEY_HERE
   ```

3. **Android Setup**:
   ```bash
   # Create android/local.properties (if it doesn't exist)
   # Add your Google Maps API key
   googleMapsApiKey=YOUR_API_KEY_HERE
   ```

4. **Set Environment Variable** (optional, for advanced users):
   ```bash
   export GOOGLE_MAPS_API_KEY_ENVIRONMENT_VARIABLE="your_api_key_here"
   ```

5. **Run the app**:
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

**Note**: The configuration files are already set up to read your API key. Just add your key and you're good to go!

**Security**: Your API keys are automatically excluded from version control to keep them safe.
