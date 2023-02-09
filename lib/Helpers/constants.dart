import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart';

@immutable
class Constants {
  ///Questions difficult level
  static const easyQuestions = 1;
  static const mediumQuestion = 2;
  static const hardQuestions = 3;
  static const easyColor=Colors.green;
  static const mediumColor=Colors.orange;
  static const hardColor=Colors.red;




  ///Questions type

  static const oneWord = 0;
  static const shortAnswer = 1;
  static const longAnswer = 2;
  static const essayAnswer = 3;


}
