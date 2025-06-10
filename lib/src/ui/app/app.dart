import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geniozinho/src/core/app_constant.dart';
import 'package:geniozinho/src/core/app_theme.dart';
import 'package:geniozinho/src/core/app_routes.dart';
import 'package:geniozinho/src/ui/app/theme_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  final String fontFamily = "Montserrat";
  static FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: firebaseAnalytics);

  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Consumer<ThemeProvider>(
        builder: (context, ThemeProvider provider, child) {
      return MaterialApp(
        title: 'Gêniozinho',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeMode,
        initialRoute: KeyUtil.splash,
        routes: appRoutes,
        navigatorObservers: [observer],
      );
    });
  }
}
