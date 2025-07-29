// Template for env.dart - Copy this to lib/env.dart and add your actual .env file
import 'package:envied/envied.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'GOOGLE_MAP_KEY', obfuscate: true)
  // Replace with _Env.googleMapKey after running build_runner
  static const String googleMapKey = 'YOUR_API_KEY_HERE';
}
