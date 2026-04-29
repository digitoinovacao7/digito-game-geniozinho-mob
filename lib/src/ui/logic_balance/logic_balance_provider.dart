import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:geniozinho/src/core/app_constant.dart';
import 'package:geniozinho/src/ui/app/game_provider.dart';
import 'package:geniozinho/src/ui/soundPlayer/audio_file.dart';
import '../../data/models/logic_balance.dart';

class LogicBalanceProvider extends GameProvider<LogicBalance> {
  BuildContext? context;
  int? level;
  int? selectedAnswerIndex;

  LogicBalanceProvider({
    required TickerProvider vsync,
    required int level,
    required BuildContext context,
  }) : super(vsync: vsync, gameCategoryType: GameCategoryType.values.firstWhere((e) => e.name == 'LOGIC_BALANCE'), c: context) {
    this.level = level;
    this.context = context;
    startGame(level: this.level == null ? null : level);
  }

  void checkResult(int answerIndex) async {
    AudioPlayer audioPlayer = AudioPlayer(context!);
    selectedAnswerIndex = answerIndex;
    notifyListeners();

    if (timerStatus != TimerStatus.pause) {
      if (answerIndex == currentState.answer) {
        audioPlayer.playRightSound();
        
        await Future.delayed(const Duration(milliseconds: 300));
        selectedAnswerIndex = null;
        loadNewDataIfRequired(level: level == null ? null : level);
        
        if (timerStatus != TimerStatus.pause) {
          restartTimer();
        }

        currentScore = currentScore + 1; // Score per correct answer
        addCoin();
        notifyListeners();
      } else {
        minusCoin();
        audioPlayer.playWrongSound();
        wrongAnswer();
        selectedAnswerIndex = null;
        notifyListeners();
      }
    }
  }
}
