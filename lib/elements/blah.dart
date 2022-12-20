// List<ManualQuestionGenerationModel> generateQuestions() {
//   List<ManualQuestionGenerationModel> generatedList =
//   <ManualQuestionGenerationModel>[];
//   if (int.tryParse(section1Controller.text) != 0) {
//     List<Question> questionListOneWord = [];
//     questionListOneWord.addAll(_con.allQuestionList
//         .where((element) => element.questionType == Constants.oneWord)
//         .toList());
//
//     ManualQuestionGenerationModel quesOneWordAnswer =
//     ManualQuestionGenerationModel(
//         name: 'One Word Questions',
//         questionsCount: int.tryParse(section1Controller.text),
//         mpqManual: int.tryParse(mpq1ManualController.text),
//         attendManual: int.tryParse(manualAttend1Controller.text),
//         questions: questionListOneWord);
//
//     generatedList.add(quesOneWordAnswer);
//   }
//   if (int.tryParse(section2Controller.text) != 0) {
//     List<Question> questionListShortAnswer = [];
//     questionListShortAnswer.addAll(_con.allQuestionList
//         .where((element) => element.questionType == Constants.shortAnswer)
//         .toList());
//
//     ManualQuestionGenerationModel quesShortAnswer =
//     ManualQuestionGenerationModel(
//         name: 'Short Answer Questions',
//         questionsCount: int.tryParse(section2Controller.text),
//         mpqManual: int.tryParse(mpq2ManualController.text),
//         attendManual: int.tryParse(manualAttend2Controller.text),
//         questions: questionListShortAnswer);
//
//     generatedList.add(quesShortAnswer);
//   }
//   if (int.tryParse(section3Controller.text) != 0) {
//     List<Question> questionListLongAnswer = [];
//     questionListLongAnswer.addAll(_con.allQuestionList
//         .where((element) => element.questionType == Constants.longAnswer)
//         .toList());
//
//     ManualQuestionGenerationModel quesLongAnswer =
//     ManualQuestionGenerationModel(
//         name: 'Long Answer Questions',
//         questionsCount: int.tryParse(section3Controller.text),
//         mpqManual: int.tryParse(mpq3ManualController.text),
//         attendManual: int.tryParse(manualAttend3Controller.text),
//         questions: questionListLongAnswer);
//
//     generatedList.add(quesLongAnswer);
//   }
//   if (int.tryParse(section4Controller.text) != 0) {
//     List<Question> questionListEssayAnswer = [];
//     questionListEssayAnswer.addAll(_con.allQuestionList
//         .where((element) => element.questionType == Constants.essayAnswer)
//         .toList());
//
//     ManualQuestionGenerationModel quesEssayAnswer =
//     ManualQuestionGenerationModel(
//         name: 'Essay Answer Questions',
//         questionsCount: int.tryParse(section4Controller.text),
//         mpqManual: int.tryParse(mpq4ManualController.text),
//         attendManual: int.tryParse(manualAttend4Controller.text),
//         questions: questionListEssayAnswer);
//
//     generatedList.add(quesEssayAnswer);
//   }
//   return generatedList;
// }