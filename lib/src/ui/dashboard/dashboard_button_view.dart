import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geniozinho/src/core/app_assets.dart';
import 'package:geniozinho/src/data/models/dashboard.dart';
import 'package:geniozinho/src/ui/app/theme_provider.dart';
import 'package:geniozinho/src/ui/common/common_tab_animation_view.dart';
import 'package:geniozinho/src/utility/constants.dart';
import 'package:provider/provider.dart';

class DashboardButtonView extends StatefulWidget {
  final Function onTab;
  final Animation<Offset> position;
  final Dashboard dashboard;
  final double margin;

  const DashboardButtonView({
    Key? key,
    required this.position,
    required this.onTab,
    required this.dashboard,
    required this.margin,
  }) : super(key: key);

  @override
  State<DashboardButtonView> createState() => _DashboardButtonViewState();
}

class _DashboardButtonViewState extends State<DashboardButtonView>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _scaleController.forward();
    setState(() => _isPressed = true);
  }

  void _handleTapUp(TapUpDetails details) {
    _scaleController.reverse();
    setState(() => _isPressed = false);
    widget.onTab();
  }

  void _handleTapCancel() {
    _scaleController.reverse();
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    double height = getWidthPercentSize(context, 42);
    double circle = getPercentSize(height, 42);
    double iconSize = getPercentSize(circle, 62);

    final String backgroundSvgPath =
        '${getFolderName(context, widget.dashboard.folder)}${AppAssets.homeCellBg}';
    final String iconSvgPath =
        AppAssets.assetFolderPath + widget.dashboard.folder + AppAssets.homeIcon;

    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return CommonTabAnimationView(
          onTab: widget.onTab,
          isDelayed: true,
          child: SlideTransition(
            position: widget.position,
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: GestureDetector(
                    onTapDown: _handleTapDown,
                    onTapUp: _handleTapUp,
                    onTapCancel: _handleTapCancel,
                    child: Container(
                      height: height,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              child: SvgPicture.asset(
                                backgroundSvgPath,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0.0, 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: getWidthPercentSize(context, 6),
                                ),
                                TweenAnimationBuilder<double>(
                                  duration: const Duration(milliseconds: 200),
                                  tween: Tween<double>(
                                    begin: 1.0,
                                    end: _isPressed ? 0.9 : 1.0,
                                  ),
                                  builder: (context, value, child) {
                                    return Transform.scale(
                                      scale: value,
                                      child: Container(
                                        height: circle,
                                        width: circle,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(getPercentSize(circle, 24)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withAlpha(26),
                                              blurRadius: 10,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            iconSvgPath,
                                            width: iconSize,
                                            height: iconSize,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(width: getWidthPercentSize(context, 4.5)),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AnimatedDefaultTextStyle(
                                        duration: const Duration(milliseconds: 200),
                                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: _isPressed ? Colors.black87 : Colors.black,
                                          fontSize: getPercentSize(height, 14),
                                          fontFamily: 'Latinotype',
                                          letterSpacing: 0.5,
                                        ),
                                        child: Text(
                                          widget.dashboard.title.toUpperCase(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      if (widget.dashboard.subtitle.isNotEmpty) ...[
                                        const SizedBox(height: 4),
                                        AnimatedDefaultTextStyle(
                                          duration: const Duration(milliseconds: 200),
                                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            color: _isPressed ? Colors.black54 : Colors.black45,
                                            fontSize: getPercentSize(height, 10),
                                            fontFamily: 'Montserrat',
                                          ),
                                          child: Text(
                                            widget.dashboard.subtitle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                                SizedBox(width: getWidthPercentSize(context, 4)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
