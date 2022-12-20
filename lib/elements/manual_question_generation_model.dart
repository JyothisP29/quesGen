import 'package:enumresponsive/model/questions.dart';

class ManualQuestionGenerationModel {
  final String? name;
  final int? questionsCount;
  final int? mpqManual;
  final int? attendManual;

  final List<Question> questions;

  ManualQuestionGenerationModel(
      {this.name,
      this.questionsCount,
      this.mpqManual,
      this.attendManual,
      required this.questions});
}
