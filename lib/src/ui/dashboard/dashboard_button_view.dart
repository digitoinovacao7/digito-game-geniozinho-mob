import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geniozinho/src/core/app_assets.dart';
import 'package:geniozinho/src/data/models/dashboard.dart';
import 'package:geniozinho/src/ui/app/theme_provider.dart';
import 'package:geniozinho/src/ui/common/common_tab_animation_view.dart';
import 'package:geniozinho/src/utility/constants.dart';
import 'package:provider/provider.dart';

class DashboardButtonView extends StatelessWidget {
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
  Widget build(BuildContext context) {
    // double height = FetchPixels.getPixelWidth( );
    double height = getWidthPercentSize(context, 42);
    double circle = getPercentSize(height, 42);
    double iconSize = getPercentSize(circle, 62);

    debugPrint(
        "dashboard-----${AppAssets.assetFolderPath + dashboard.folder + AppAssets.homeIcon}");

    // Caminho do SVG de fundo, calculado uma vez para clareza
    final String backgroundSvgPath =
        '${getFolderName(context, dashboard.folder)}${AppAssets.homeCellBg}';
    // Caminho do ícone SVG, calculado uma vez
    final String iconSvgPath =
        AppAssets.assetFolderPath + dashboard.folder + AppAssets.homeIcon;

    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return CommonTabAnimationView(
          onTab: onTab,
          isDelayed: true,
          child: SlideTransition(
            position: position,
            child: Container(
              height: height,
              width: double.infinity,
              child: Stack(
                children: [
                  // Usar Positioned.fill para o SVG de fundo
                  Positioned.fill(
                    child: SvgPicture.asset(
                      backgroundSvgPath,
                      fit: BoxFit.fill,
                      // As propriedades height e width no SvgPicture aqui podem ser desnecessárias
                      // já que Positioned.fill e BoxFit.fill devem cuidar do dimensionamento.
                      // No entanto, se o SVG tiver um tamanho intrínseco que cause problemas,
                      // elas podem ser re-adicionadas. Por performance e simplicidade, omitindo por agora.
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0.0, 0.0), // Adicionado const e usando 0.0, 0.0 que é o mesmo que Alignment.center
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: getWidthPercentSize(context, 6),
                        ),
                        Container(
                          height: circle,
                          width: circle,
                          decoration: getDefaultDecoration( // Assumindo que getDefaultDecoration é otimizado
                              bgColor: Colors.white, // Colors.white é const
                              radius: getPercentSize(circle, 24)),
                          child: Center( // Center pode ser const se child for const, mas SvgPicture.asset não é
                            child: SvgPicture.asset(
                              iconSvgPath,
                              width: iconSize,
                              height: iconSize,
                            ),
                          ),
                        ),
                        SizedBox(width: getWidthPercentSize(context, 4.5)),
                        // Assumindo que getTextWidget é otimizado
                        getTextWidget(
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black // Colors.black é const
                            ),
                            dashboard.title,
                            TextAlign.center,
                            getPercentSize(height, 12))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

