import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geniozinho/src/data/models/dashboard.dart';
import 'package:geniozinho/src/ui/dashboard/dashboard_button_view.dart';
import 'package:geniozinho/src/core/app_constant.dart';
import 'package:geniozinho/src/utility/constants.dart';
import 'package:tuple/tuple.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
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
        body: SafeArea(
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
                      child: getScoreWidget(context),
                      flex: 1,
                    ),
                    getSettingWidget(context),
                  ],
                ),
                SizedBox(height: getVerticalSpace(context)),
                getHeaderWidget(context, 'Gêniozinho',
                    'Treine seu cérebro, melhore sua habilidade matemática'),
                SizedBox(
                  height: getScreenPercentSize(context, 5),
                ),
                Expanded(
                  child: Column(
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
                    "https://geniozinho.com.br/")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
