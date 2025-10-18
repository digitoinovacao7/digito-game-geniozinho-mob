import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

AdRequest request = AdRequest(
  keywords: <String>['jogos', 'quebra-cabeça', 'crianças', 'educação'],
  contentUrl: 'https://geniozinho.com.br',
  nonPersonalizedAds: true,
);

// ANDROID
const String _androidProductionInterstitialId = "ca-app-pub-9124633416063149/6643124577";
const String _androidProductionBannerId = "ca-app-pub-9124633416063149/8913865007";
const String _androidProductionRewardedId = "ca-app-pub-9124633416063149/4629586741";

// IOS (Preencha com seus IDs de produção do AdMob para iOS se for lançar para iOS)
const String _iosProductionInterstitialId = "ca-app-pub-YOUR_IOS_PRODUCTION_INTERSTITIAL_ID";
const String _iosProductionBannerId = "ca-app-pub-YOUR_IOS_PRODUCTION_BANNER_ID";
const String _iosProductionRewardedId = "ca-app-pub-YOUR_IOS_PRODUCTION_REWARDED_ID";

// --- IDs de Teste (Fornecidos pelo AdMob) ---
// Estes são os IDs de teste universais do AdMob.
const String _androidTestInterstitialId = "ca-app-pub-3940256099942544/1033173712";
const String _androidTestBannerId = "ca-app-pub-3940256099942544/6300978111";
const String _androidTestRewardedId = "ca-app-pub-3940256099942544/5224354917";

const String _iosTestInterstitialId = "ca-app-pub-3940256099942544/4411468910";
const String _iosTestBannerId = "ca-app-pub-3940256099942544/2934735716";
const String _iosTestRewardedId = "ca-app-pub-3940256099942544/1712485313";

// NOTE: This project will be released ONLY for Android. The functions below
// prioritize Android ad unit IDs in release and debug. If you later enable
// iOS releases, set the iOS production IDs above and remove or adapt the
// checks below.

String getInterstitialAdUnitId() {
  // Prefer Android (target platform)
  if (Platform.isAndroid) {
    return kReleaseMode ? _androidProductionInterstitialId : _androidTestInterstitialId;
  }
  // For iOS during development return test id; for release on non-Android return empty and warn
  if (Platform.isIOS) {
    if (!kReleaseMode) return _iosTestInterstitialId;
    debugPrint('WARNING: Release target is Android; no iOS production interstitial ID configured.');
    return "";
  }
  debugPrint('WARNING: Platform not supported for ads in this build (only Android targeted).');
  return "";
}

String getBannerAdUnitId() {
  if (Platform.isAndroid) {
    return kReleaseMode ? _androidProductionBannerId : _androidTestBannerId;
  }
  if (Platform.isIOS) {
    if (!kReleaseMode) return _iosTestBannerId;
    debugPrint('WARNING: Release target is Android; no iOS production banner ID configured.');
    return "";
  }
  debugPrint('WARNING: Platform not supported for ads in this build (only Android targeted).');
  return "";
}

String getRewardBasedVideoAdUnitId() {
  if (Platform.isAndroid) {
    return kReleaseMode ? _androidProductionRewardedId : _androidTestRewardedId;
  }
  if (Platform.isIOS) {
    if (!kReleaseMode) return _iosTestRewardedId;
    debugPrint('WARNING: Release target is Android; no iOS production rewarded ID configured.');
    return "";
  }
  debugPrint('WARNING: Platform not supported for ads in this build (only Android targeted).');
  return "";
}
