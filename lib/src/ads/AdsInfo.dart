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
const String _androidProductionRewardedId = "ca-app-pub-YOUR_ANDROID_PRODUCTION_REWARDED_ID";

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


String getInterstitialAdUnitId() {
  if (kReleaseMode) {
    if (Platform.isIOS) {
      return _iosProductionInterstitialId;
    } else if (Platform.isAndroid) {
      return _androidProductionInterstitialId;
    }
  } else { // MODO DEBUG
    if (Platform.isIOS) {
      return _iosTestInterstitialId;
    } else if (Platform.isAndroid) {
      return _androidTestInterstitialId;
    }
  }
  return "";
}

String getBannerAdUnitId() {
  if (kReleaseMode) {
    if (Platform.isIOS) {
      return _iosProductionBannerId;
    } else if (Platform.isAndroid) {
      return _androidProductionBannerId;
    }
  } else {
    if (Platform.isIOS) {
      return _iosTestBannerId;
    } else if (Platform.isAndroid) {
      return _androidTestBannerId;
    }
  }
  return "";
}

String getRewardBasedVideoAdUnitId() {
  // O ID de Recompensado de PRODUÇÃO para Android que você tinha era um ID de TESTE!
  // 'ca-app-pub-3940256099942544/8691691433' é um ID de teste do AdMob.
  // VOCÊ PRECISA SUBSTITUIR _androidProductionRewardedId ACIMA PELO SEU ID DE PRODUÇÃO REAL.
  if (kReleaseMode) {
    if (Platform.isIOS) {
      return _iosProductionRewardedId; // Use seu ID de produção iOS
    } else if (Platform.isAndroid) {
      // CERTIFIQUE-SE QUE ESTE É O SEU ID DE PRODUÇÃO REAL DO ADMOB
      if (_androidProductionRewardedId == "ca-app-pub-YOUR_ANDROID_PRODUCTION_REWARDED_ID") {
        print("ALERTA: ID de Recompensado de Produção para Android não configurado em AdsInfo.dart!");
        return _androidTestRewardedId; // Fallback para teste para evitar crash, mas não ideal
      }
      return _androidProductionRewardedId;
    }
  } else {
    if (Platform.isIOS) {
      return _iosTestRewardedId;
    } else if (Platform.isAndroid) {
      return _androidTestRewardedId;
    }
  }
  return "";
}
