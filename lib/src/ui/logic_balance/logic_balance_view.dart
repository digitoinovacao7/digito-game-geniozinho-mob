import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:confetti/confetti.dart';
import 'package:tuple/tuple.dart';
import 'package:vsync_provider/vsync_provider.dart';

import 'package:geniozinho/src/core/app_constant.dart';
import 'package:geniozinho/src/ui/common/common_app_bar.dart';
import 'package:geniozinho/src/ui/common/common_info_text_view.dart';
import 'package:geniozinho/src/ui/common/common_main_widget.dart';
import 'package:geniozinho/src/ui/common/common_wrong_answer_animation_view.dart';
import 'package:geniozinho/src/ui/common/dialog_listener.dart';
import 'package:geniozinho/src/ui/model/gradient_model.dart';

import '../../utility/constants.dart';
import 'logic_balance_provider.dart';

class LogicBalanceView extends StatefulWidget {
  final Tuple2<GradientModel, int> colorTuple;

  const LogicBalanceView({Key? key, required this.colorTuple}) : super(key: key);

  @override
  State<LogicBalanceView> createState() => _LogicBalanceViewState();
}

class _LogicBalanceViewState extends State<LogicBalanceView> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double remainHeight = getRemainHeight(context: context);
    double mainHeight = getMainHeight(context);

    return MultiProvider(
      providers: [
        const VsyncProvider(),
        ChangeNotifierProvider<LogicBalanceProvider>(
          create: (context) => LogicBalanceProvider(
            vsync: VsyncProvider.of(context),
            level: widget.colorTuple.item2,
            context: context,
          ),
        ),
      ],
      child: DialogListener<LogicBalanceProvider>(
        gameCategoryType: GameCategoryType.LOGIC_BALANCE,
        colorTuple: widget.colorTuple,
        level: widget.colorTuple.item2,
        appBar: CommonAppBar<LogicBalanceProvider>(
          infoView: CommonInfoTextView<LogicBalanceProvider>(
            gameCategoryType: GameCategoryType.LOGIC_BALANCE,
            folder: widget.colorTuple.item1.folderName!,
            color: widget.colorTuple.item1.cellColor!,
          ),
          gameCategoryType: GameCategoryType.LOGIC_BALANCE,
          colorTuple: widget.colorTuple,
          context: context,
        ),
        child: Consumer<LogicBalanceProvider>(
          builder: (context, provider, child) {
            // Trigger confetti on right answer
            if (provider.selectedAnswerIndex == provider.currentState.answer) {
              _confettiController.play();
            }

            return Stack(
              children: [
                CommonMainWidget<LogicBalanceProvider>(
                  gameCategoryType: GameCategoryType.LOGIC_BALANCE,
                  color: widget.colorTuple.item1.bgColor!,
                  primaryColor: widget.colorTuple.item1.primaryColor!,
                  subChild: Container(
                    margin: EdgeInsets.only(top: getPercentSize(mainHeight, 20)),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Problem Card
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: Colors.white.withOpacity(0.2)),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Text(
                                  provider.currentState.question,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Prompt
                        Text(
                          "Quanto vale o item ${provider.currentState.targetItem}?",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Options Grid
                        Expanded(
                          flex: 2,
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2.0,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: provider.currentState.options.length,
                            itemBuilder: (context, index) {
                              final option = provider.currentState.options[index];
                              final isSelected = provider.selectedAnswerIndex == index;
                              
                              return GestureDetector(
                                onTap: () => provider.checkResult(index),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? widget.colorTuple.item1.primaryColor
                                        : Colors.white.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.3),
                                      width: 2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      option,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: isSelected
                                            ? Colors.black87
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  context: context,
                  isTopMargin: false,
                ),
                // Confetti Widget
                Align(
                  alignment: Alignment.topCenter,
                  child: ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop: false,
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
            );
          },
        ),
      ),
    );
  }
}
