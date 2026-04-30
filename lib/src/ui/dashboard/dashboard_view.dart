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
    
    if (lastLoginStr == null) {
      currentStreak = 1;
    } else {
      try {
        final lastLogin = DateTime.parse(lastLoginStr);
        final lastLoginDate = DateTime(lastLogin.year, lastLogin.month, lastLogin.day);
        final todayDate = DateTime(now.year, now.month, now.day);
        final difference = todayDate.difference(lastLoginDate).inDays;
        
        if (difference == 1) {
          currentStreak += 1;
        } else if (difference > 1) {
          currentStreak = 1;
        }
      } catch (e) {
        currentStreak = 1;
      }
    }
    
    await prefs.setString('last_login_date', todayStr);
    await prefs.setInt('streak_count', currentStreak);
    
    if (mounted) {
      setState(() {
        _streak = currentStreak;
      });
    }
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
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: Theme.of(context).brightness == Brightness.dark
                  ? [const Color(0xFF1F1D2B), const Color(0xFF252836)]
                  : [const Color(0xFFF8F9FA), const Color(0xFFE9ECEF)],
            ),
          ),
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
                      const SizedBox(width: 12),
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
      ),
    );
  }
}
