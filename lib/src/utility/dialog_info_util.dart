import 'package:geniozinho/src/core/app_constant.dart';
import 'package:geniozinho/src/data/models/game_info_dialog.dart';
import 'package:tuple/tuple.dart';

class DialogInfoUtil {
  static GameInfoDialog getInfoDialogData(GameCategoryType gameCategoryType) {
    var tuple1 = Tuple2(KeyUtil.primaryColor1, KeyUtil.bgColor1);
    var tuple2 = Tuple2(KeyUtil.primaryColor2, KeyUtil.bgColor2);
    var tuple3 = Tuple2(KeyUtil.primaryColor3, KeyUtil.bgColor3);
    switch (gameCategoryType) {
      case GameCategoryType.CALCULATOR:
        return GameInfoDialog(
            title: "Calculadora",
            image: "assets/gif/calculator-intro.gif",
            dec: "Você precisa resolver a equação fornecida corretamente.",
            correctAnswerScore: KeyUtil.calculatorScore,
            wrongAnswerScore: KeyUtil.calculatorScoreMinus,
            colorTuple: tuple1);
      case GameCategoryType.GUESS_SIGN:
        return GameInfoDialog(
            title: "Adivinhe o sinal",
            image: "assets/gif/whats-the-sign-intro.gif",
            dec:
                "Você precisa encontrar o sinal correto que complete a equação dada.",
            correctAnswerScore: KeyUtil.guessSignScore,
            wrongAnswerScore: KeyUtil.guessSignScoreMinus,
            colorTuple: tuple1);
      case GameCategoryType.SQUARE_ROOT:
        return GameInfoDialog(
            title: "Raiz quadrada",
            image: "assets/gif/sqroot-intro.gif",
            dec: "raiz quadrada do número dado.",
            correctAnswerScore: KeyUtil.squareRootScore,
            wrongAnswerScore: KeyUtil.squareRootScoreMinus,
            colorTuple: tuple2);

      case GameCategoryType.FIND_MISSING:
        return GameInfoDialog(
            title: "Encontrar desaparecidos",
            image: "assets/gif/correct-answer.gif",
            dec: "Selecione o número correto para completar a equação.",
            correctAnswerScore: KeyUtil.findMissingScore,
            wrongAnswerScore: KeyUtil.findMissingScoreMinus,
            colorTuple: tuple1);
      case GameCategoryType.TRUE_FALSE:
        return GameInfoDialog(
            title: "Verdadeiro Falso",
            image: "assets/gif/correct-answer.gif",
            dec: "Selecione o número correto para completar a equação.",
            correctAnswerScore: KeyUtil.trueFalseScore,
            wrongAnswerScore: KeyUtil.trueFalseScoreMinus,
            colorTuple: tuple1);

      case GameCategoryType.DUAL_GAME:
        return GameInfoDialog(
            title: "Jogo duplo",
            image: "assets/gif/correct-answer.gif",
            dec: "Selecione o número correto para completar a equação.",
            correctAnswerScore: KeyUtil.dualScore,
            wrongAnswerScore: KeyUtil.dualScoreMinus,
            colorTuple: tuple1);

      case GameCategoryType.COMPLEX_CALCULATION:
        return GameInfoDialog(
            title: "Cálculo complexo",
            image: "assets/gif/whats-the-sign-intro.gif",
            dec:
                "Você precisa encontrar o sinal correto que complete a equação dada.",
            correctAnswerScore: KeyUtil.complexCalculationScore,
            wrongAnswerScore: KeyUtil.complexCalculationScoreMinus,
            colorTuple: tuple1);

      case GameCategoryType.CUBE_ROOT:
        return GameInfoDialog(
            title: "Raiz cúbica",
            image: "assets/gif/correct-answer.gif",
            dec: "Selecione o número correto para completar a equação.",
            correctAnswerScore: KeyUtil.cubeRootScore,
            wrongAnswerScore: KeyUtil.cubeRootScoreMinus,
            colorTuple: tuple1);

      case GameCategoryType.NUMERIC_MEMORY:
        return GameInfoDialog(
            title: "Memória Numérica",
            image: "assets/gif/correct-answer.gif",
            dec: "Selecione o número correto para completar a equação.",
            correctAnswerScore: KeyUtil.numericMemoryScore,
            wrongAnswerScore: KeyUtil.numericMemoryScoreMinus,
            colorTuple: tuple1);
      case GameCategoryType.CONCENTRATION:
        return GameInfoDialog(
            title: "Concentração",
            image: "assets/gif/correct-answer.gif",
            dec: "Selecione o número correto para completar a equação.",
            correctAnswerScore: KeyUtil.concentrationScore,
            wrongAnswerScore: KeyUtil.concentrationScoreMinus,
            colorTuple: tuple1);
      case GameCategoryType.MATH_PAIRS:
        return GameInfoDialog(
            title: "Pares de matemática",
            image: "assets/gif/math-pair-intro.gif",
            dec:
                "Cada cartão contém uma equação ou uma resposta. Combine a equação com a resposta correta.",
            correctAnswerScore: KeyUtil.mathematicalPairsScore,
            wrongAnswerScore: KeyUtil.mathematicalPairsScoreMinus,
            colorTuple: tuple2);
      case GameCategoryType.CORRECT_ANSWER:
        return GameInfoDialog(
            title: "Resposta correta",
            image: "assets/gif/correct-answer.gif",
            dec: "Selecione o número correto para completar a equação.",
            correctAnswerScore: KeyUtil.correctAnswerScore,
            wrongAnswerScore: KeyUtil.correctAnswerScoreMinus,
            colorTuple: tuple1);
      case GameCategoryType.MAGIC_TRIANGLE:
        return GameInfoDialog(
          title: "Triângulo Mágico",
          image: "assets/gif/magic-triangle-intro.gif",
          dec:
              "A soma de cada lado do triângulo deve ser igual ao número dado. Para colocar qualquer número, selecione triângulo círculo e pressione qualquer número dado do painel.",
          correctAnswerScore: KeyUtil.magicTriangleScore,
          colorTuple: tuple3,
          wrongAnswerScore: KeyUtil.magicTriangleScore,
        );
      case GameCategoryType.MENTAL_ARITHMETIC:
        return GameInfoDialog(
          title: "Aritmética Mental",
          colorTuple: tuple2,
          image: "assets/gif/mental-arith-intro.gif",
          dec:
              "O número com operador será mostrado um por um. Você precisa lembrar o número com operador e escrever a resposta final (sem precedência).",
          correctAnswerScore: KeyUtil.mentalArithmeticScore,
          wrongAnswerScore: KeyUtil.mentalArithmeticScoreMinus,
        );
      case GameCategoryType.QUICK_CALCULATION:
        return GameInfoDialog(
          title: "Cálculo rápido",
          colorTuple: tuple1,
          image: "assets/gif/quick-calculation-intro.gif",
          dec:
              "Resolva equações simples uma por uma. Quanto mais rápido você resolver, mais tempo será dado para resolver a próxima equação.",
          correctAnswerScore: KeyUtil.quickCalculationScore,
          wrongAnswerScore: KeyUtil.quickCalculationScoreMinus,
        );
      case GameCategoryType.MATH_GRID:
        return GameInfoDialog(
          title: "Grade matemática",
          colorTuple: tuple2,
          image: "assets/gif/math-machine-intro.gif",
          dec:
              "Selecione o número da grade matemática para chegar à resposta mostrada acima. Você pode selecionar qualquer número para chegar à resposta acima.",
          correctAnswerScore: KeyUtil.mathGridScore,
          wrongAnswerScore: KeyUtil.mathGridScore,
        );
      case GameCategoryType.PICTURE_PUZZLE:
        return GameInfoDialog(
          title: "Quebra-cabeça de imagem",
          colorTuple: tuple3,
          image: "assets/gif/picture-puzzle-intro.gif",
          dec:
              "Cada forma representa um número. Encontre o número de cada forma da equação dada e resolva a última equação.",
          correctAnswerScore: KeyUtil.picturePuzzleScore,
          wrongAnswerScore: KeyUtil.picturePuzzleScore,
        );
      case GameCategoryType.NUMBER_PYRAMID:
        return GameInfoDialog(
          title: "Pirâmide Numérica",
          colorTuple: tuple3,
          image: "assets/gif/num-pyramid.gif",
          dec:
              "Soma de células consecutivas deve ser colocada na célula superior. Você precisa preencher todas as células corretamente para resolver a pirâmide numérica.",
          correctAnswerScore: KeyUtil.numberPyramidScore,
          wrongAnswerScore: KeyUtil.numberPyramidScore,
        );
    }
  }
}
