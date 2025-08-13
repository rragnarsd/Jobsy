# Jobsy

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

This project uses environment variables for sensitive configuration. To set up the project:

1. **Create a `.env` file** in the project root with your API keys:
   ```
   GOOGLE_MAP_KEY=your_google_maps_api_key_here
   ```

2. **Copy the environment template**:
   ```bash
   cp lib/env.template.dart lib/env.dart
   ```

3. **Generate the environment file**:
   ```bash
   dart run build_runner build
   ```

4. **For Android builds**, set the environment variable:
   ```bash
   export GOOGLE_MAP_KEY="your_google_maps_api_key"
   flutter build apk --debug
   ```

**Note**: The `lib/env.dart` and `lib/env.g.dart` files are ignored by Git to protect sensitive information.
