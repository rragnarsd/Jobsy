# Jobsy

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

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
