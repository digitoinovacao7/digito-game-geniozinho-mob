class LogicBalance {
  final String question;
  final String targetItem;
  final List<String> options;
  final int answer;

  LogicBalance({
    required this.question,
    required this.targetItem,
    required this.options,
    required this.answer,
  });

  factory LogicBalance.fromJson(Map<String, dynamic> json) {
    return LogicBalance(
      question: json['question'],
      targetItem: json['targetItem'],
      options: List<String>.from(json['options']),
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'targetItem': targetItem,
      'options': options,
      'answer': answer,
    };
  }
}
