import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../utils/env_keys.dart';

class EnvService {
  static Future<void> loadEnv() async {
    await dotenv.load();
  }

  static String get(String key, {String defaultValue = ''}) {
    return dotenv.env[key] ?? defaultValue;
  }

  static String get stripePublishableKey => get(EnvKeys.stripePublishableKey);
  static String get stripeSecretKey => get(EnvKeys.stripeSecretKey);
}
