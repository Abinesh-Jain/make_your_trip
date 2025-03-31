import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/flight_booking_provider.dart';
import 'app_screens.dart';
import 'app_themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FlightBookingProvider(),
        ),
      ],
      child: MaterialApp(
        routes: AppScreens.routes,
        theme: AppThemes.light,
      ),
    );
  }
}
