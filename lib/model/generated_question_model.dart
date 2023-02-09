import 'package:enumresponsive/model/questions.dart';

class QuestionGenerationModel {
  final String? name;
  final int? typeId;
  final int? easy;
  final int? medium;
  final int? hard;
  final int? total;
  final int? attend;
  final int? mpq;

   List<Question> questions=[];

  QuestionGenerationModel(
      { this.name,
        this.typeId,
         this.easy,
         this.medium,
         this.hard,
         this.total,
        this.attend, this.mpq,
        required this.questions});
}