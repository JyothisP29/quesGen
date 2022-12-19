import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../Helpers/constants.dart';
import '../model/course.dart';
import '../model/generated_question_model.dart';
import '../model/modules.dart';
import '../model/question_paper.dart';
import '../model/questions.dart';

class HomeController extends ControllerMVC {
  List<Course> courseList = <Course>[];
  List<QuestionPaper> questionPaperList = <QuestionPaper>[];
  List<QuestionGenerationModel> questionList = <QuestionGenerationModel>[];

  // List<Question> questionList = <Question>[];
  List<Question> questionListManual = <Question>[];
  List<Modules> moduleList = <Modules>[];
  List<Question> allQuestionList = [];

  List selectedList = [];

  GlobalKey<ScaffoldState>? scaffoldKey;

  HomeController() {
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  int courseCount = 0;

  int courseCountfn() {
    setState(() {
      courseCount++;
    });
    return courseCount;
  }


  QuestionPaper quesPaper =QuestionPaper(0,"",0);



  void getCourseList() {

      // courseList.add(Course(1, "B.Sc. CS", "Kannur University",
      //     const Color(0xffB9FBC7), Colors.green));
      // courseList.add(Course(1, "B.Sc. CS", "Kannur University",
      //     const Color(0xffB9FBC7), Colors.green));
      // courseList.add(Course(1, "B.Sc. CS", "Kannur University",
      //     const Color(0xffB9FBC7), Colors.green));
      // courseList.add(Course(1, "B.Sc. CS", "Kannur University",
      //     const Color(0xffB9FBC7), Colors.green));

      courseList.add(Course(1, "B.Sc. CS", "Kannur University",
          const Color(0xffB9FBC7), Colors.green));
      courseList.add(Course(2, "B.C.A", "Calicut University",
          const Color(0xffFBF4B9), Colors.yellow));
      courseList.add(Course(3, "B.Com", "Mahathma Gandhi University",
          const Color(0xffFBB9B9), Colors.redAccent));
      courseList.add(Course(4, "B.Sc. PHYSICS", "Kochin University",
          const Color(0xffE8C54A), Colors.orange));

  }

  void getQuestionPaperList() {

      questionPaperList.add(QuestionPaper(1, "", 0));
      questionPaperList.add(QuestionPaper(2, "BCA103 Mathematics-| 2019", 1));
      questionPaperList.add(QuestionPaper(3, "BCA103 Mahematics-| 2019", 1));
      questionPaperList.add(QuestionPaper(4, "BCA103 Mahematics-| 2019", 1));

  }

  void getModuleList() {

      moduleList.add(Modules(1, 'Module 01', allQuestionList));
      moduleList.add(Modules(2, 'Module 02', allQuestionList));
      moduleList.add(Modules(3, 'Module 03', allQuestionList));
      moduleList.add(Modules(4, 'Module 04', allQuestionList));
      moduleList.add(Modules(5, 'Module 05', allQuestionList));
      moduleList.add(Modules(6, 'Module 06', allQuestionList));
      moduleList.add(Modules(7, 'Module 07', allQuestionList));

  }

  void getQuestionsList() {

      allQuestionList.add(Question(1, "question1", Constants.easyQuestions,
          false, Constants.oneWord, Constants.easyColor));
      allQuestionList.add(Question(2, "question2", Constants.mediumQuestion,
          false, Constants.oneWord, Constants.mediumColor));
      allQuestionList.add(Question(3, "question3", Constants.hardQuestions,
          false, Constants.oneWord, Constants.hardColor));
      allQuestionList.add(Question(4, "question4", Constants.easyQuestions,
          false, Constants.shortAnswer, Constants.easyColor));
      allQuestionList.add(Question(5, "question5", Constants.mediumQuestion,
          false, Constants.shortAnswer, Constants.mediumColor));
      allQuestionList.add(Question(6, "question6", Constants.hardQuestions,
          false, Constants.shortAnswer, Constants.hardColor));
      allQuestionList.add(Question(7, "question7", Constants.easyQuestions,
          false, Constants.longAnswer, Constants.easyColor));
      allQuestionList.add(Question(8, "question8", Constants.mediumQuestion,
          false, Constants.longAnswer, Constants.mediumColor));
      allQuestionList.add(Question(9, "question9", Constants.hardQuestions,
          false, Constants.longAnswer, Constants.hardColor));
      allQuestionList.add(Question(10, "question10", Constants.easyQuestions,
          false, Constants.essayAnswer, Constants.easyColor));
      allQuestionList.add(Question(11, "question11", Constants.mediumQuestion,
          false, Constants.essayAnswer, Constants.mediumColor));
      allQuestionList.add(Question(12, "question12", Constants.hardQuestions,
          false, Constants.essayAnswer, Constants.hardColor));
      allQuestionList.add(Question(13, "question13", Constants.easyQuestions,
          false, Constants.oneWord, Constants.easyColor));
      allQuestionList.add(Question(14, "question14", Constants.mediumQuestion,
          false, Constants.oneWord, Constants.mediumColor));
      allQuestionList.add(Question(15, "question 15", Constants.hardQuestions,
          false, Constants.oneWord, Constants.hardColor));
      allQuestionList.add(Question(16, "question 164", Constants.easyQuestions,
          false, Constants.shortAnswer, Constants.easyColor));
      allQuestionList.add(Question(
          17,
          "question 17 5",
          Constants.mediumQuestion,
          false,
          Constants.shortAnswer,
          Constants.mediumColor));
      allQuestionList.add(Question(
        18,
        "question 18",
        Constants.hardQuestions,
        false,
        Constants.shortAnswer,
        Constants.hardColor,
      ));
      allQuestionList.add(Question(19, "question7 19", Constants.easyQuestions,
          false, Constants.longAnswer, Constants.easyColor));
      allQuestionList.add(Question(
          20,
          "question8 20 ",
          Constants.mediumQuestion,
          false,
          Constants.longAnswer,
          Constants.mediumColor));
      allQuestionList.add(Question(21, "question9 21 ", Constants.hardQuestions,
          false, Constants.longAnswer, Constants.hardColor));
      allQuestionList.add(Question(22, "question10 22", Constants.easyQuestions,
          false, Constants.essayAnswer, Constants.easyColor));
      allQuestionList.add(Question(
          23,
          "question11 23 ",
          Constants.mediumQuestion,
          false,
          Constants.essayAnswer,
          Constants.mediumColor));
      allQuestionList.add(Question(24, "question12 24", Constants.hardQuestions,
          false, Constants.essayAnswer, Constants.hardColor));
      allQuestionList.add(Question(25, "question1 25", Constants.easyQuestions,
          false, Constants.oneWord, Constants.easyColor));
      allQuestionList.add(Question(26, "question2 26", Constants.mediumQuestion,
          false, Constants.oneWord, Constants.mediumColor));
      allQuestionList.add(Question(27, "question3 27", Constants.hardQuestions,
          false, Constants.oneWord, Constants.hardColor));
      allQuestionList.add(Question(28, "question4 29", Constants.easyQuestions,
          false, Constants.shortAnswer, Constants.easyColor));
      allQuestionList.add(Question(29, "question5 30", Constants.mediumQuestion,
          false, Constants.shortAnswer, Constants.mediumColor));
      allQuestionList.add(Question(30, "question6 31", Constants.hardQuestions,
          false, Constants.shortAnswer, Constants.hardColor));
      allQuestionList.add(Question(31, "question7 32", Constants.easyQuestions,
          false, Constants.longAnswer, Constants.easyColor));
      allQuestionList.add(Question(32, "question8 33", Constants.mediumQuestion,
          false, Constants.longAnswer, Constants.mediumColor));
      allQuestionList.add(Question(33, "question9 34", Constants.hardQuestions,
          false, Constants.longAnswer, Constants.hardColor));
      allQuestionList.add(Question(
          34,
          "question10 35 ",
          Constants.easyQuestions,
          false,
          Constants.essayAnswer,
          Constants.easyColor));
      allQuestionList.add(Question(
          35,
          "question11 36",
          Constants.mediumQuestion,
          false,
          Constants.essayAnswer,
          Constants.mediumColor));
      allQuestionList.add(Question(36, "question12 37", Constants.hardQuestions,
          false, Constants.essayAnswer, Constants.hardColor));
      allQuestionList.add(Question(37, "question1 38", Constants.easyQuestions,
          false, Constants.oneWord, Constants.easyColor));
      allQuestionList.add(Question(38, "question2 39", Constants.mediumQuestion,
          false, Constants.oneWord, Constants.mediumColor));
      allQuestionList.add(Question(39, "question3 40", Constants.hardQuestions,
          false, Constants.oneWord, Constants.hardColor));
      allQuestionList.add(Question(40, "question4 41", Constants.easyQuestions,
          false, Constants.shortAnswer, Constants.easyColor));
      allQuestionList.add(Question(41, "question5 42", Constants.mediumQuestion,
          false, Constants.shortAnswer, Constants.mediumColor));
      allQuestionList.add(Question(42, "question6 43", Constants.hardQuestions,
          false, Constants.shortAnswer, Constants.hardColor));
      allQuestionList.add(Question(43, "question7 44", Constants.easyQuestions,
          false, Constants.longAnswer, Constants.easyColor));
      allQuestionList.add(Question(44, "question8 45", Constants.mediumQuestion,
          false, Constants.longAnswer, Constants.mediumColor));
      allQuestionList.add(Question(45, "question9 46", Constants.hardQuestions,
          false, Constants.longAnswer, Constants.hardColor));
      allQuestionList.add(Question(46, "question10 47", Constants.easyQuestions,
          false, Constants.essayAnswer, Constants.easyColor));
      allQuestionList.add(Question(
          47,
          "question11 48",
          Constants.mediumQuestion,
          false,
          Constants.essayAnswer,
          Constants.mediumColor));
      allQuestionList.add(Question(
          48,
          "question12 49 ",
          Constants.hardQuestions,
          false,
          Constants.essayAnswer,
          Constants.hardColor));
      allQuestionList.add(Question(49, "question1 50", Constants.easyQuestions,
          false, Constants.oneWord, Constants.easyColor));
      allQuestionList.add(Question(50, "question2 51", Constants.mediumQuestion,
          false, Constants.oneWord, Constants.mediumColor));
      allQuestionList.add(Question(51, "question3 52", Constants.hardQuestions,
          false, Constants.oneWord, Constants.hardColor));
      allQuestionList.add(Question(52, "question4 53", Constants.easyQuestions,
          false, Constants.shortAnswer, Constants.easyColor));
      allQuestionList.add(Question(53, "question5 54", Constants.mediumQuestion,
          false, Constants.shortAnswer, Constants.mediumColor));
      allQuestionList.add(Question(54, "question6 55", Constants.hardQuestions,
          false, Constants.shortAnswer, Constants.hardColor));
      allQuestionList.add(Question(55, "question7 56", Constants.easyQuestions,
          false, Constants.longAnswer, Constants.easyColor));
      allQuestionList.add(Question(56, "question8 57", Constants.mediumQuestion,
          false, Constants.longAnswer, Constants.mediumColor));
      allQuestionList.add(Question(57, "question9 58", Constants.hardQuestions,
          false, Constants.longAnswer, Constants.hardColor));
      allQuestionList.add(Question(58, "question10 59", Constants.easyQuestions,
          false, Constants.essayAnswer, Constants.easyColor));
      allQuestionList.add(Question(
          59,
          "question11 60",
          Constants.mediumQuestion,
          false,
          Constants.essayAnswer,
          Constants.mediumColor));
      allQuestionList.add(Question(60, "question12 61", Constants.hardQuestions,
          false, Constants.essayAnswer, Constants.hardColor));

  }
}
