import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'core/app.dart';
import 'features/environment/env_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvService.loadEnv();
  Stripe.publishableKey = EnvService.stripePublishableKey;
  runApp(const App());
}
