
import 'package:flutter/src/material/colors.dart';

class Question {
  final int? qusId;
  String question;
  int? diffLevel;
  bool isChecked;
  int? questionType;
  MaterialColor diffColor;

  Question(
      this.qusId,
      this.question,
      this.diffLevel,
      this.isChecked,
      this.questionType,
      this.diffColor,
      );
}

