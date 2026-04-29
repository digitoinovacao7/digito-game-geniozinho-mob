class SequenceExplosive {
  final String sequence;
  final int answer;
  final List<String> options;

  SequenceExplosive({
    required this.sequence,
    required this.answer,
    required this.options,
  });

  factory SequenceExplosive.fromJson(Map<String, dynamic> json) {
    return SequenceExplosive(
      sequence: json['sequence'],
      answer: json['answer'],
      options: List<String>.from(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sequence': sequence,
      'answer': answer,
      'options': options,
    };
  }
}
