import 'package:enumresponsive/model/generated_question_model.dart';

import '../elements/manual_question_generation_model.dart';

class QuestionPaper {
  int? quesPaperid;
  String questionPaperName;
  String? questionCode;
  int timeDuration;
  String? hourOrMinute;
  String? semester;
  String? subject;

  List<QuestionGenerationModel>? sections;
  List<ManualQuestionGenerationModel>? manualSections;

  int? qsPaperstatus;


  QuestionPaper(
    this.quesPaperid,
    this.questionPaperName,
    this.questionCode,
    this.timeDuration,
    this.hourOrMinute,

    this.sections,

    this.qsPaperstatus,

  );


}


