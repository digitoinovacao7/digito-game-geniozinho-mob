import 'dart:math';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:geniozinho/src/utility/constants.dart';
import 'package:geniozinho/src/ui/resizer/fetch_pixels.dart';
import 'package:geniozinho/src/ui/common/common_button.dart';

class DailyRewardDialog extends StatefulWidget {
  final int streak;
  final int coinsEarned;
  final VoidCallback onClaim;

  const DailyRewardDialog({
    Key? key,
    required this.streak,
    required this.coinsEarned,
    required this.onClaim,
  }) : super(key: key);

  @override
  _DailyRewardDialogState createState() => _DailyRewardDialogState();
}

class _DailyRewardDialogState extends State<DailyRewardDialog> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(30)),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: FetchPixels.getPixelHeight(100),
              bottom: FetchPixels.getPixelHeight(30),
              left: FetchPixels.getPixelWidth(30),
              right: FetchPixels.getPixelWidth(30),
            ),
            margin: EdgeInsets.only(top: FetchPixels.getPixelHeight(50)),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Recompensa Diária!',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: Colors.orangeAccent,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: FetchPixels.getPixelHeight(20)),
                Text(
                  'Você jogou ${widget.streak} dias seguidos.',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: FetchPixels.getPixelHeight(15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.monetization_on,
                      color: Colors.amber,
                      size: FetchPixels.getPixelHeight(50),
                    ),
                    SizedBox(width: FetchPixels.getPixelWidth(10)),
                    Text(
                      '+${widget.coinsEarned}',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: Colors.amber,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: FetchPixels.getPixelHeight(30)),
                CommonButton(
                  text: 'RESGATAR',
                  onTab: () {
                    widget.onClaim();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: FetchPixels.getPixelHeight(10),
            child: CircleAvatar(
              backgroundColor: Colors.amber,
              radius: FetchPixels.getPixelHeight(50),
              child: Icon(
                Icons.calendar_month,
                color: Colors.white,
                size: FetchPixels.getPixelHeight(50),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2, // radial value - DOWN
              maxBlastForce: 5,
              minBlastForce: 2,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.2,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ],
            ),
          ),
        ],
      ),
    );
  }
}
