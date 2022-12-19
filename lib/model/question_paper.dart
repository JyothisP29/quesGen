import 'package:enumresponsive/model/questions.dart';

class QuestionPaper {
  int? quesPaperid;
  String questionPaperName;
  String? questionCode;
  int? timeDuration;
  int? easy1;
  int? medium1;
  int? hard1;
  int? easy2;
  int? medium2;
  int? hard2;
  int? easy3;
  int? medium3;
  int? hard3;
  int? attend1;
  int? attend2;
  int? attend3;
  int? mpq1;
  int? mpq2;
  int? mpq3;
  int? qsPaperstatus;


  QuestionPaper(
    this.quesPaperid,
    this.questionPaperName,
    this.qsPaperstatus,
  );
}


