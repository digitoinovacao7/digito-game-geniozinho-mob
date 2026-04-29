import 'dart:math';
import '../models/sequence_explosive.dart';

class SequenceExplosiveRepository {
  static List<SequenceExplosive> getSequenceExplosiveDataList(int level) {
    List<SequenceExplosive> list = [];
    Random random = Random();

    for (int i = 0; i < 20; i++) {
      int start = 1 + random.nextInt(9); // 1 to 9
      int op1 = 1 + random.nextInt(5);
      int op2 = 1 + random.nextInt(5);
      
      // 0: +, 1: -, 2: *
      int type1 = random.nextInt(3);
      int type2 = random.nextInt(3);
      
      int result = start;
      String seq = "$start";
      
      if (type1 == 0) {
        result += op1;
        seq += " ➔ +$op1";
      } else if (type1 == 1) {
        result -= op1;
        seq += " ➔ -$op1";
      } else {
        result *= op1;
        seq += " ➔ ✖$op1";
      }
      
      if (type2 == 0) {
        result += op2;
        seq += " ➔ +$op2";
      } else if (type2 == 1) {
        result -= op2;
        seq += " ➔ -$op2";
      } else {
        result *= op2;
        seq += " ➔ ✖$op2";
      }
      
      List<String> options = [];
      options.add(result.toString());
      
      while (options.length < 4) {
        int distractor = result + random.nextInt(20) - 10;
        if (!options.contains(distractor.toString())) {
          options.add(distractor.toString());
        }
      }
      
      options.shuffle();
      int answerIndex = options.indexOf(result.toString());
      
      list.add(SequenceExplosive(
        sequence: seq,
        answer: answerIndex,
        options: options,
      ));
    }
    return list;
  }
}
