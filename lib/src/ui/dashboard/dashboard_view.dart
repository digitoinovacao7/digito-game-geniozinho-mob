import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geniozinho/src/data/models/dashboard.dart';
import 'package:geniozinho/src/ui/dashboard/dashboard_button_view.dart';
import 'package:geniozinho/src/core/app_constant.dart';
import 'package:geniozinho/src/utility/constants.dart';
import 'package:geniozinho/src/ui/resizer/fetch_pixels.dart';
import 'package:tuple/tuple.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:geniozinho/src/ui/app/coin_provider.dart';
import 'package:geniozinho/src/ui/common/daily_reward_dialog.dart';
import 'package:geniozinho/src/ui/common/daily_reward_dialog.dart';
import 'package:geniozinho/src/ui/dashboard/dashboard_provider.dart';
import 'package:geniozinho/src/ui/settings/nickname_dialog.dart';
import 'dart:ui' as ui;

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  int _streak = 0;
  late Animation<Offset> _positionAnimation1;
  late Animation<Offset> _positionAnimation2;
  late Animation<Offset> _positionAnimation3;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _positionAnimation1 = Tween<Offset>(
      begin: const Offset(0.0, 2.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
    ));

    _positionAnimation2 = Tween<Offset>(
      begin: const Offset(0.0, 2.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 0.9, curve: Curves.easeOut),
    ));

    _positionAnimation3 = Tween<Offset>(
      begin: const Offset(0.0, 2.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
    ));

    _animationController.forward();
    _checkStreak();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _playClickSound() async {
    try {
      await _audioPlayer.play(AssetSource('tick.mp3'));
    } catch (e) {
     debugPrint("Erro ao tocar música: $e");
    }
  }

  void exitApp() {
    if (Platform.isIOS) {
      exit(0);
    } else {
      SystemNavigator.pop();
    }
  }

  Future<void> _checkStreak() async {
    final prefs = await SharedPreferences.getInstance();
    final lastLoginStr = prefs.getString('last_login_date');
    int currentStreak = prefs.getInt('streak_count') ?? 0;
    
    final now = DateTime.now();
    final todayStr = "${now.year}-${now.month}-${now.day}";
    bool earnedReward = false;
    int coinsToEarn = 0;
    
    if (lastLoginStr == null) {
      currentStreak = 1;
      earnedReward = true;
    } else {
      try {
        final lastLogin = DateTime.parse(lastLoginStr);
        final lastLoginDate = DateTime(lastLogin.year, lastLogin.month, lastLogin.day);
        final todayDate = DateTime(now.year, now.month, now.day);
        final difference = todayDate.difference(lastLoginDate).inDays;
        
        if (difference == 1) {
          currentStreak += 1;
          earnedReward = true;
        } else if (difference > 1) {
          currentStreak = 1;
        }
      } catch (e) {
        currentStreak = 1;
      }
    }

    if (earnedReward) {
        coinsToEarn = currentStreak * 10;
        if (coinsToEarn > 100) coinsToEarn = 100;
    }
    
    final nickname = prefs.getString('player_nickname');
    
    await prefs.setString('last_login_date', todayStr);
    await prefs.setInt('streak_count', currentStreak);
    
    if (mounted) {
      setState(() {
        _streak = currentStreak;
      });
      
      if (nickname == null || nickname.isEmpty) {
        Future.delayed(const Duration(milliseconds: 800), () {
           showDialog(
             context: context,
             barrierDismissible: false,
             builder: (context) => NicknameDialog(
               onNicknameSet: () {
                 if (earnedReward) {
                   _showRewardDialog(currentStreak, coinsToEarn);
                 } else {
                    // Sync initial score if nickname just set
                    final provider = Provider.of<DashboardProvider>(context, listen: false);
                    final score = provider.getOverallScore();
                    if (score > 0) {
                      // It will automatically sync next time they score, but we can do it now too if needed.
                    }
                 }
               }
             )
           );
        });
      } else if (earnedReward) {
        Future.delayed(const Duration(milliseconds: 800), () {
          _showRewardDialog(currentStreak, coinsToEarn);
        });
      }
    }
  }

  void _showRewardDialog(int streak, int coins) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => DailyRewardDialog(
        streak: streak,
        coinsEarned: coins,
        onClaim: () {
          Provider.of<CoinProvider>(context, listen: false).addCoins(coins);
        }
      )
    );
  }

  Widget _buildStreakWidget(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.local_fire_department,
          color: Colors.orange,
          size: FetchPixels.getPixelHeight(55),
        ),
        SizedBox(width: FetchPixels.getPixelHeight(10)),
        getTextWidget(
          Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.orange,
              ),
          '$_streak dias',
          TextAlign.start,
          FetchPixels.getPixelHeight(45),
        ),
      ],
    );
  }

  Dashboard getThemedItem(int i, BuildContext context) {
    var originalItem = KeyUtil.dashboardItems[i];
    Color bgColor;

    if (Theme.of(context).brightness == Brightness.dark) {
      bgColor = "#383838".toColor();
    } else {
      bgColor = KeyUtil.bgColorList[i];
    }

    return originalItem.copyWith(
      bgColor: bgColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Theme.of(context).scaffoldBackgroundColor);

    return WillPopScope(
      onWillPop: () async {
        exitApp();
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: Theme.of(context).brightness == Brightness.dark
                      ? [const Color(0xFF15141F), const Color(0xFF1F1D2B)]
                      : [const Color(0xFFF8F9FA), const Color(0xFFE9ECEF)],
                ),
              ),
            ),
            Positioned(
              top: -100,
              left: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent.withOpacity(Theme.of(context).brightness == Brightness.dark ? 0.3 : 0.15),
                ),
              ),
            ),
            Positioned(
              bottom: -50,
              right: -100,
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orangeAccent.withOpacity(Theme.of(context).brightness == Brightness.dark ? 0.25 : 0.15),
                ),
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned.fill(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: getHorizontalSpace(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: getVerticalSpace(context)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: getScoreWidget(context),
                          ),
                          _buildStreakWidget(context),
                          const SizedBox(width: 16),
                          getInstagramWidget(context),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              _playClickSound();
                              Navigator.pushNamed(context, '/store');
                            },
                            child: CircleAvatar(
                              radius: FetchPixels.getPixelHeight(20),
                              backgroundColor: Colors.amber.withOpacity(0.2),
                              child: Icon(Icons.store, color: Colors.amber, size: FetchPixels.getPixelHeight(24)),
                            ),
                          ),
                          const SizedBox(width: 8),
                          getSettingWidget(context),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Olá, Gênio! 🧠',
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Poppins',
                                    letterSpacing: -0.5,
                                  ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Pronto para desafiar sua mente hoje?',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white70
                                        : Colors.black54,
                                    fontFamily: 'Poppins',
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            DashboardButtonView(
                              position: _positionAnimation1,
                              dashboard: KeyUtil.dashboardItems[0],
                              margin: getScreenPercentSize(context, 3),
                              onTab: () {
                                _playClickSound();
                                Navigator.pushNamed(
                                  context,
                                  KeyUtil.home,
                                  arguments: Tuple2(
                                    getThemedItem(0, context),
                                    MediaQuery.of(context).padding.top,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            DashboardButtonView(
                              position: _positionAnimation2,
                              dashboard: KeyUtil.dashboardItems[1],
                              margin: getScreenPercentSize(context, 3),
                              onTab: () {
                                _playClickSound();
                                Navigator.pushNamed(
                                  context,
                                  KeyUtil.home,
                                  arguments: Tuple2(
                                    getThemedItem(1, context),
                                    MediaQuery.of(context).padding.top,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            DashboardButtonView(
                              position: _positionAnimation3,
                              dashboard: KeyUtil.dashboardItems[2],
                              margin: getScreenPercentSize(context, 3),
                              onTab: () {
                                _playClickSound();
                                Navigator.pushNamed(
                                  context,
                                  KeyUtil.home,
                                  arguments: Tuple2(
                                    getThemedItem(2, context),
                                    MediaQuery.of(context).padding.top,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      getFooterWidget(
                        context,
                        '© ${DateTime.now().year} Geniozinho. Todos os direitos reservados.',
                        "https://geniozinho.com.br/politica-privacidade",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
