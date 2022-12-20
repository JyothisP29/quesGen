import 'package:enumresponsive/model/questions.dart';

class QuestionGenerationModel {
  final String? name;
  final int? easy;
  final int? medium;
  final int? hard;
  final int? total;
  final List<Question> questions;

  QuestionGenerationModel(
      { this.name,
         this.easy,
         this.medium,
         this.hard,
         this.total,
          required this.questions});
}