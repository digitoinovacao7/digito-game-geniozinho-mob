import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:geniozinho/src/data/RandomFindMissingData.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:geniozinho/src/ui/app/app.dart';
import 'package:geniozinho/src/ui/app/coin_provider.dart';
import 'package:geniozinho/src/ui/app/theme_provider.dart';
import 'package:geniozinho/src/ui/dashboard/dashboard_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  MobileAds.instance.initialize();
  final sharedPreferences = await SharedPreferences.getInstance();

  print("va===${getFormattedString(19.2)}");

  setupServiceLocator(sharedPreferences);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              ThemeProvider(sharedPreferences: sharedPreferences),
        ),
        ChangeNotifierProvider<DashboardProvider>(
          create: (context) => GetIt.I.get<DashboardProvider>(),
        ),
        ChangeNotifierProvider<CoinProvider>(
          create: (context) => GetIt.I.get<CoinProvider>(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

setupServiceLocator(SharedPreferences sharedPreferences) {
  GetIt.I.registerSingleton<DashboardProvider>(
      DashboardProvider(preferences: sharedPreferences));
}
