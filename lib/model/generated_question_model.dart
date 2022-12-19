import 'package:enumresponsive/model/questions.dart';

class QuestionGenerationModel {
  final String name;
  final int easy;
  final int medium;
  final int hard;
  final int total;
  final List<Question> questions;

  QuestionGenerationModel(
      {required this.name,
        required this.easy,
        required this.medium,
        required this.hard,
        required this.total,
        required this.questions});
}