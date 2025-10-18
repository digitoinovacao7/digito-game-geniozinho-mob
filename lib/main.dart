import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:geniozinho/src/data/RandomFindMissingData.dart'; // Unused import?
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:geniozinho/src/ui/app/app.dart';
import 'package:geniozinho/src/ui/app/coin_provider.dart';
import 'package:geniozinho/src/ui/app/theme_provider.dart';
import 'package:geniozinho/src/ui/dashboard/dashboard_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Configure AdMob test device IDs in debug mode to avoid serving real ads
  if (!kReleaseMode) {
    // 'EMULATOR' is a special value recognized by the plugin for the Android emulator.
    await MobileAds.instance.updateRequestConfiguration(
      RequestConfiguration(testDeviceIds: <String>['EMULATOR']),
    );
    debugPrint('AdMob: test device IDs configured (debug mode)');
  }
  await MobileAds.instance.initialize();
  final sharedPreferences = await SharedPreferences.getInstance();

  debugPrint("va===${getFormattedString(19.2)}");

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
      child: MyApp(), // Can MyApp be const?
    ),
  );
}

setupServiceLocator(SharedPreferences sharedPreferences) {
  GetIt.I.registerSingleton<DashboardProvider>(
      DashboardProvider(preferences: sharedPreferences));
}
