import 'package:enumresponsive/model/questions.dart';

class Modules {
  final int? modId;
  final String? modName;

  final List<Question> allQuestionList;

  Modules(
    this.modId,
    this.modName,
    this.allQuestionList,
  );
}
