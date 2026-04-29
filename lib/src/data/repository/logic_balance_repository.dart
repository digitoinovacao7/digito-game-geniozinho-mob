import 'dart:math';
import '../models/logic_balance.dart';

class LogicBalanceRepository {
  static List<LogicBalance> getLogicBalanceDataList(int level) {
    List<LogicBalance> list = [];
    Random random = Random();

    for (int i = 0; i < 20; i++) {
      int itemA = 2 + random.nextInt(8); // 2 to 9
      int itemB = 2 + random.nextInt(8); // 2 to 9
      
      while (itemA == itemB) {
        itemB = 2 + random.nextInt(8);
      }

      String emojiA = _getRandomEmoji(random);
      String emojiB = _getRandomEmoji(random, exclude: emojiA);

      int eq1 = itemA + itemA;
      int eq2 = itemA + itemB;

      String question = "$emojiA + $emojiA = $eq1\n$emojiA + $emojiB = $eq2";
      
      List<String> options = [];
      options.add(itemB.toString());
      
      // Generate distractors
      while (options.length < 4) {
        int distractor = 2 + random.nextInt(15);
        if (!options.contains(distractor.toString()) && distractor != itemB) {
          options.add(distractor.toString());
        }
      }
      
      options.shuffle();
      int answerIndex = options.indexOf(itemB.toString());

      list.add(LogicBalance(
        question: question,
        targetItem: emojiB,
        options: options,
        answer: answerIndex,
      ));
    }

    return list;
  }

  static String _getRandomEmoji(Random random, {String? exclude}) {
    List<String> emojis = ["🍎", "🍌", "🍇", "🍊", "🍓", "🍉", "🍒", "🍍", "🥝"];
    if (exclude != null) {
      emojis.remove(exclude);
    }
    return emojis[random.nextInt(emojis.length)];
  }
}
