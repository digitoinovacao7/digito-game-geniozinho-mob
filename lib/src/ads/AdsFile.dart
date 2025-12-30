import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'AdsInfo.dart';
import 'ads_interface.dart';

class AdsFile implements AdsInterfaces {
  BuildContext? context;
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;

  int _numInterstitialLoadAttempts = 0;
  int _numRewardedLoadAttempts = 0;
  static const int _maxFailedLoadAttempts = 3;

  AdsFile(this.context) {
    setDefaultData();
  }

  setDefaultData() async {
    // isAppPurchased = await PrefData.getIsAppPurchased();
    // isAdsPermission = await PrefData.getIsAppAdsPermission();
  }

  BannerAd? _anchoredBanner;

  @override
  void onAdLoad(InterstitialAd interstitialAds) {
   debugPrint("AdsInterfaces: Interstitial Ad Loaded: ${interstitialAds.adUnitId}");
  }

  @override
  void onAdClose() {
   debugPrint("AdsInterfaces: Interstitial Ad Closed.");
  }

  Future<void> createAnchoredBanner(BuildContext context,
      {VoidCallback? onBannerAdLoaded}) async {
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) {
     debugPrint('Unable to get height of anchored banner.');
      return;
    }
   debugPrint('Banner Ad Unit ID: ${getBannerAdUnitId()}');
   debugPrint('Banner size acquired: ${size.width}x${size.height}');

    final BannerAd banner = BannerAd(
      size: size,
      request: request,
      adUnitId: getBannerAdUnitId(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
         debugPrint('$BannerAd loaded.');
          _anchoredBanner = ad as BannerAd?;
          if (onBannerAdLoaded != null) {
            onBannerAdLoaded();
          }
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
         debugPrint('$BannerAd failedToLoad: $error');
         debugPrint('Banner Error Details - Code: ${error.code}, Domain: ${error.domain}, Message: ${error.message}');
          
          // Error code 3 = NO_FILL (no ads available) - this is common and expected
          // HTTP 403 errors may indicate app/ad unit configuration issues in AdMob
          if (error.code == 3) {
            debugPrint('Banner NO_FILL: No ads available at this time (normal)');
          } else if (error.message.contains('403') || error.message.contains('Forbidden')) {
            debugPrint('⚠️ HTTP 403 ERROR - Possible causes:');
            debugPrint('  1. App not yet approved in AdMob console');
            debugPrint('  2. Package name mismatch (should be: br.com.digitoinovacao.geniozinho)');
            debugPrint('  3. Ad unit not properly linked to app in AdMob');
            debugPrint('  4. App needs to be published or added as test app');
            debugPrint('  5. AdMob account has payment/policy issues');
            debugPrint('  → Check AdMob console: https://apps.admob.com/');
          } else {
            debugPrint('Unexpected BannerAd error: ${error.code} - ${error.message}');
          }
          ad.dispose();
        },
        onAdOpened: (Ad ad) =>debugPrint('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) =>debugPrint('$BannerAd onAdClosed.'),
      ),
    );
    return banner.load();
  }

  void disposeInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.dispose();
    }
  }

  void disposeRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.dispose();
    }
  }

  void disposeBannerAd() {
    if (_anchoredBanner != null) {
      _anchoredBanner!.dispose();
    }
  }

  void showInterstitialAd(Function function) {
    if (_interstitialAd == null) {
     debugPrint('Warning: attempt to show interstitial before loaded.');
      function();
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
         debugPrint('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
       debugPrint('$ad onAdDismissedFullScreenContent.');
        onAdClose();
        ad.dispose();
        _interstitialAd = null;
        createInterstitialAd();
        function();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
       debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _interstitialAd = null;
        createInterstitialAd();
        function();
      },
    );
    _interstitialAd!.show();
  }


  void showRewardedAd(Function function, Function function1) async {
    bool _isRewarded = false;
    if (_rewardedAd == null) {
      function1();
     debugPrint('Warning: attempt to show rewarded before loaded.');
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
         debugPrint('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
       debugPrint('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _rewardedAd = null;
        createRewardedAd();
        if (_isRewarded) {
          function();
        } else {
          function1();
        }
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
       debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _rewardedAd = null;
        createRewardedAd();
      },
    );

    _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
     debugPrint('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
      _isRewarded = true;
    });
  }

  void createRewardedAd() {
    if (_rewardedAd != null) return;

    RewardedAd.load(
        adUnitId: getRewardBasedVideoAdUnitId(),
        request: request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
           debugPrint('reward====$ad loaded.');
            _rewardedAd = ad;
            _numRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
            print('Rewarded Error Details - Code: ${error.code}, Domain: ${error.domain}, Message: ${error.message}');
            
            // Error code 3 = NO_FILL (no ads available) - this is common and expected
            if (error.code == 3) {
              debugPrint('Rewarded NO_FILL: No ads available at this time (normal)');
            } else if (error.message.contains('403') || error.message.contains('Forbidden')) {
              debugPrint('⚠️ HTTP 403 ERROR on Rewarded - Check AdMob configuration');
            } else {
              debugPrint('Unexpected RewardedAd error: ${error.code} - ${error.message}');
            }
            
            _rewardedAd = null;
            _numRewardedLoadAttempts += 1;
            if (_numRewardedLoadAttempts <= _maxFailedLoadAttempts) {
              int retryDelay =
                  Duration(seconds: 2 * _numRewardedLoadAttempts).inSeconds;
              print(
                  'Retrying RewardedAd in $retryDelay seconds (attempt $_numRewardedLoadAttempts)');
              Future.delayed(Duration(seconds: retryDelay), () {
                createRewardedAd();
              });
            } else {
              print('Max RewardedAd load attempts reached.');
            }
          },
        ));
  }

  void createInterstitialAd() {
    if (_interstitialAd != null) return;

    InterstitialAd.load(
        adUnitId: getInterstitialAdUnitId(),
        request: request,
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            onAdLoad(ad);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            print('Interstitial Error Details - Code: ${error.code}, Domain: ${error.domain}, Message: ${error.message}');
            
            // Error code 3 = NO_FILL (no ads available) - this is common and expected
            if (error.code == 3) {
              debugPrint('Interstitial NO_FILL: No ads available at this time (normal)');
            } else if (error.message.contains('403') || error.message.contains('Forbidden')) {
              debugPrint('⚠️ HTTP 403 ERROR on Interstitial - Check AdMob configuration');
            } else {
              debugPrint('Unexpected InterstitialAd error: ${error.code} - ${error.message}');
            }
            
            _interstitialAd = null;
            _numInterstitialLoadAttempts += 1;
            if (_numInterstitialLoadAttempts <= _maxFailedLoadAttempts) {
              int retryDelay =
                  Duration(seconds: 2 * _numInterstitialLoadAttempts).inSeconds;
              print(
                  'Retrying InterstitialAd in $retryDelay seconds (attempt $_numInterstitialLoadAttempts)');
              Future.delayed(Duration(seconds: retryDelay), () {
                createInterstitialAd();
              });
            } else {
              print('Max InterstitialAd load attempts reached.');
            }
          },
        ));
  }
}

getBanner(BuildContext context, AdsFile? adsFile) {
  if (adsFile == null) {
    return Container();
  } else {
    return showBanner(context, adsFile);
  }
}

showRewardedAd(AdsFile? adsFile, Function function, {Function? function1}) {
  if (adsFile != null) {
    adsFile.showRewardedAd(() {
      function();
    }, () {
      if (function1 != null) {
        function1();
      }
    });
  } else {
    if (function1 != null) {
      function1();
    }
  }
}

showInterstitialAd(AdsFile? adsFile, Function function) {
  if (adsFile != null) {
    adsFile.showInterstitialAd(() {
      function();
    });
  } else {
    function();
  }
}

disposeRewardedAd(AdsFile? adsFile) {
  if (adsFile != null) {
    adsFile.disposeRewardedAd();
  }
}

disposeInterstitialAd(AdsFile? adsFile) {
  if (adsFile != null) {
    adsFile.disposeInterstitialAd();
  }
}

disposeBannerAd(AdsFile? adsFile) {
  if (adsFile != null) {
    adsFile.disposeBannerAd();
  }
}

Widget showBanner(BuildContext context, AdsFile adsFile) {
  final banner = getBannerAd(adsFile);
  if (banner != null) {
    print(
        'AdsFile - showBanner: Banner is not null. Height: ${banner.size.height}');
    return Container(
      color: Colors.yellow, // MANTENHA PARA TESTE VISUAL
      alignment: Alignment.center,
      height: banner.size.height.toDouble(),
      child: AdWidget(ad: banner),
    );
  } else {
    print('AdsFile - showBanner: Banner is NULL.');
  }
  return SizedBox.shrink();
}

BannerAd? getBannerAd(AdsFile? adsFile) {
  if (adsFile != null && adsFile._anchoredBanner != null) {
    return adsFile._anchoredBanner;
  }
  return null;
}
