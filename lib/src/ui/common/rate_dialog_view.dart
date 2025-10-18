import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geniozinho/src/core/app_constant.dart';
import 'package:tuple/tuple.dart';

import '../../core/app_assets.dart';
import '../../utility/constants.dart';
import '../feedback_screen.dart';
import '../model/gradient_model.dart';
import '../resizer/fetch_pixels.dart';
import '../resizer/widget_utils.dart';

class RateViewDialog extends StatelessWidget {
  final Tuple2<GradientModel, int> colorTuple;

  const RateViewDialog({
    required this.colorTuple,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double starSize = FetchPixels.getPixelHeight(80);

    double rate = 0;
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: FetchPixels.getPixelWidth(80),
                vertical: FetchPixels.getPixelHeight(80)),
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(AppAssets.assetPath + "rate.png"),
            ),
          ),

          getTextWidget(
              Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
              "Dê sua opinião",
              TextAlign.center,
              getScreenPercentSize(context, 2.5)),

          SizedBox(height: getScreenPercentSize(context, 1.5)),

          getTextWidget(
              Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
              "Crie uma meta de matemática melhor para você e gostaria de saber como você classificaria nosso aplicativo?",
              TextAlign.center,
              getScreenPercentSize(context, 1.8)),

          SizedBox(height: getScreenPercentSize(context, 3)),

          RatingBar(
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(
                  horizontal: FetchPixels.getPixelWidth(30)),
              allowHalfRating: false,
              itemSize: starSize,
              initialRating: 0,
              updateOnDrag: true,
              glowColor: Theme.of(context).scaffoldBackgroundColor,
              ratingWidget: RatingWidget(
                full: getSvgImageWithSize(
                    context, "star_fill.svg", starSize, starSize),
                empty: getSvgImageWithSize(
                    context, "star.svg", starSize, starSize),
                half: getSvgImageWithSize(
                    context, "star_fill.svg", starSize, starSize),
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  rate = rating;
                });
              }),

          SizedBox(height: getScreenPercentSize(context, 5)),
          Row(
            children: [
              Expanded(
                child: getButtonWidget(
                    context, "Cancelar", colorTuple.item1.primaryColor!, () {
                  Navigator.pop(context);
                }, textColor: darken(KeyUtil.primaryColor1), isBorder: true),
                flex: 1,
              ),
              SizedBox(
                width: getWidthPercentSize(context, 3),
              ),
              Expanded(
                child: getButtonWidget(
                    context, "Enviar", darken(colorTuple.item1.primaryColor!),
                    () async {
                  if (rate >= 3) {
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FeedbackScreen(),
                        ));
                  }
                }, textColor: Colors.white),
                flex: 1,
              ),
            ],
          )
        ],
      );
    });
  }
}
