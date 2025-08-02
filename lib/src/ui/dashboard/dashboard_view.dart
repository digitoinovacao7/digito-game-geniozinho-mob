import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geniozinho/src/data/models/dashboard.dart';
import 'package:geniozinho/src/ui/dashboard/dashboard_button_view.dart';
import 'package:geniozinho/src/core/app_constant.dart';
import 'package:geniozinho/src/utility/constants.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../app/theme_provider.dart'; // Ensure this path is correct
import '../resizer/fetch_pixels.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetLeftEnter;
  late Animation<Offset> _offsetRightEnter;
  late bool isHomePageOpen;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    isHomePageOpen = false;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _offsetLeftEnter = Tween<Offset>(
      begin: const Offset(2, 0),
      end: Offset.zero,
    ).animate(_controller);

    _offsetRightEnter = Tween<Offset>(
      begin: const Offset(-2.0, 0.0),
      end: Offset.zero,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playClickSound() async {
    try {
      await _audioPlayer.play(AssetSource('tick.mp3'));
     debugPrint("Música tocada com sucesso");
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

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    double margin = getHorizontalSpace(context);
    double verticalSpace = getScreenPercentSize(context, 3);
    // ThemeProvider is fetched but not directly used in getItem's corrected logic
    // It might be used elsewhere or by child widgets implicitly.
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    setStatusBarColor(Theme.of(context).scaffoldBackgroundColor);

    return WillPopScope(
      onWillPop: () async {
        exitApp();
        return false;
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          systemNavigationBarIconBrightness: Theme.of(context).brightness,
        ),
        child: Scaffold(
          appBar: getNoneAppBar(context),
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                'assets/images/background_dashboard.png',
                fit: BoxFit.cover,
              ),
              SafeArea(
                bottom: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: margin),
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
                        child: NotificationListener<
                            OverscrollIndicatorNotification>(
                          onNotification:
                              (OverscrollIndicatorNotification overscroll) {
                            overscroll.disallowIndicator();
                            return true;
                          },
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                DashboardButtonView(
                                  dashboard: KeyUtil.dashboardItems[0],
                                  position: _offsetLeftEnter,
                                  margin: margin,
                                  onTab: () {
                                    _playClickSound();
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      KeyUtil.home,
                                      ModalRoute.withName(KeyUtil.dashboard),
                                      arguments: Tuple2(
                                          // Pass context instead of themeProvider if getItem now uses Theme.of(context)
                                          getItem(0, context),
                                          MediaQuery.of(context).padding.top),
                                    );
                                  },
                                ),
                                SizedBox(height: verticalSpace),
                                DashboardButtonView(
                                  dashboard: KeyUtil.dashboardItems[1],
                                  position: _offsetRightEnter,
                                  margin: margin,
                                  onTab: () {
                                    _playClickSound();
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      KeyUtil.home,
                                      ModalRoute.withName(KeyUtil.dashboard),
                                      arguments: Tuple2(
                                          // Pass context
                                          getItem(1, context),
                                          MediaQuery.of(context).padding.top),
                                    );
                                  },
                                ),
                                SizedBox(height: verticalSpace),
                                DashboardButtonView(
                                  dashboard: KeyUtil.dashboardItems[2],
                                  position: _offsetLeftEnter,
                                  margin: margin,
                                  onTab: () {
                                    _playClickSound();
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      KeyUtil.home,
                                      ModalRoute.withName(KeyUtil.dashboard),
                                      arguments: Tuple2(
                                          // Pass context
                                          getItem(2, context),
                                          MediaQuery.of(context).padding.top),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
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
            ],
          ),
        ),
      ),
    );
  }

  // Changed ThemeProvider to BuildContext as we'll use Theme.of(context)
  Dashboard getItem(int i, BuildContext context) {
    var model = KeyUtil.dashboardItems[i];

    // Check the brightness of the current theme
    if (Theme.of(context).brightness == Brightness.dark) {
      model.bgColor = "#383838".toColor();
    } else {
      model.bgColor = KeyUtil.bgColorList[i];
    }

    return model;
  }
}
