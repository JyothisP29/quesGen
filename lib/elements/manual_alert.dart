import 'package:enumresponsive/elements/semester_details_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Helpers/constants.dart';
import '../controller/home_controller.dart';
import '../model/questions.dart';
import '../model/routeargument.dart';
import 'manual_question_generation_model.dart';

class ManualAlert extends StatefulWidget {
  final HomeController controller;

  // final RouteArgument? routeArgument;
  const ManualAlert({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<ManualAlert> createState() => _ManualAlert();
}

class _ManualAlert extends State<ManualAlert> {
  late HomeController _con;

  bool addsub = false;
  String? semester;
  int count1 = 0;
  var semesters = [
    'semester 01',
    'semester 02',
  ];
  String? subject;

  var subjects = [
    'subjects 01',
    'subjects 02',
  ];
  bool select1 = false;
  bool select2 = false;
  bool select3 = false;
  bool select4 = false;
  bool select5 = false;
  bool select6 = false;
  bool select7 = false;
  late TextEditingController section1Controller,
      section2Controller,
      section3Controller,
      section4Controller,
      mpq1ManualController,
      manualAttend1Controller,
      mpq2ManualController,
      manualAttend2Controller,
      mpq3ManualController,
      manualAttend3Controller,
      mpq4ManualController,
      manualAttend4Controller;

  @override
  void initState() {
    super.initState();
    // log(widget.routeArgument?.other?.toString()??"NULLLL");
// count1=widget.routeArgument?.other;
    _con = widget.controller;
    section1Controller = TextEditingController();
    section2Controller = TextEditingController();
    section3Controller = TextEditingController();
    section4Controller = TextEditingController();
    mpq1ManualController = TextEditingController();
    manualAttend1Controller = TextEditingController();
    manualAttend4Controller = TextEditingController();
    manualAttend3Controller = TextEditingController();
    mpq4ManualController = TextEditingController();
    mpq2ManualController = TextEditingController();
    manualAttend2Controller = TextEditingController();
    mpq3ManualController = TextEditingController();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    section1Controller.dispose();
    section2Controller.dispose();
    section3Controller.dispose();
    section4Controller.dispose();
    mpq1ManualController.dispose();
    manualAttend1Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Align(
        alignment: const Alignment(0, 0),
        child: Material(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            // padding: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width * .57,
            height: MediaQuery.of(context).size.height * .7,
            //  height:  MediaQuery.of(context).size.height*.6,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(blurRadius: 5, offset: Offset(0, 1)),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .04,
                    right: MediaQuery.of(context).size.width * .02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            size: 35,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .04,
                      right: MediaQuery.of(context).size.width * .04,
                      bottom: MediaQuery.of(context).size.height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Select the question types for your test paper",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .0135,
                      ),
                      Row(
                        children: const [
                          Text(
                            "You can add the questions yourself from the Clezz question library in the next section.",
                            style: TextStyle(fontSize: 22, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(flex: 2, child: Container()),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                "QUESTIONS",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "MARKS/QUESTION",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          )),
                          Expanded(
                              child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "ATTEND",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          )),
                          Expanded(
                              child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "MARKS/SECTION",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * .0135,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Expanded(
                              flex: 2,
                              child: Text(
                                "One word & Objective",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 75,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0XFFC9C9C9))),
                                child: SizedBox(
                                  // margin: const EdgeInsets.only(right: 30, left: 0),

                                  child: TextField(
                                    controller: section1Controller,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    textAlign: TextAlign.center,
                                    //  maxLength: 2,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(0),
                                      hintText: "0",

                                      //   counter: Text(""),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      hintStyle: const TextStyle(
                                        color: Color(0xffB1BBC6),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 75,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0XFFC9C9C9))),
                                child: SizedBox(
                                  // margin: const EdgeInsets.only(right: 30, left: 0),

                                  child: TextField(
                                    controller: mpq1ManualController,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    textAlign: TextAlign.center,
                                    //  maxLength: 2,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(0),
                                      hintText: "0",

                                      //   counter: Text(""),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      hintStyle: const TextStyle(
                                        color: Color(0xffB1BBC6),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 75,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0XFFC9C9C9))),
                                child: SizedBox(
                                  // margin: const EdgeInsets.only(right: 30, left: 0),

                                  child: TextField(
                                    controller: manualAttend1Controller,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    textAlign: TextAlign.center,
                                    //  maxLength: 2,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(0),
                                      hintText: "0",

                                      //   counter: Text(""),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      hintStyle: const TextStyle(
                                        color: Color(0xffB1BBC6),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 75,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xffF1F1F1),
                                    border: Border.all(
                                        color: const Color(0XFFC9C9C9))),
                                child: TextField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(2),
                                  ],
                                  textAlign: TextAlign.center,
                                  //  maxLength: 2,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(0),
                                    hintText: "0",

                                    //   counter: Text(""),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: Color(0XFFC9C9C9),
                                            width: 1)),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: Color(0XFFC9C9C9),
                                            width: 1)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: Color(0XFFC9C9C9),
                                            width: 1)),
                                    hintStyle: const TextStyle(
                                      color: Color(0xffB1BBC6),
                                    ),
                                    fillColor: const Color(0xffF1F1F1),
                                    filled: true,
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * .0135,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Expanded(
                              flex: 2,
                              child: Text(
                                "Short answer",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 75,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0XFFC9C9C9))),
                                child: SizedBox(
                                  // margin: const EdgeInsets.only(right: 30, left: 0),

                                  child: TextField(
                                    controller: section2Controller,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    textAlign: TextAlign.center,
                                    //  maxLength: 2,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(0),
                                      hintText: "0",

                                      //   counter: Text(""),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      hintStyle: const TextStyle(
                                        color: Color(0xffB1BBC6),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 75,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0XFFC9C9C9))),
                                child: SizedBox(
                                  // margin: const EdgeInsets.only(right: 30, left: 0),

                                  child: TextField(
                                    controller: mpq2ManualController,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    textAlign: TextAlign.center,
                                    //  maxLength: 2,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(0),
                                      hintText: "0",

                                      //   counter: Text(""),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      hintStyle: const TextStyle(
                                        color: Color(0xffB1BBC6),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 75,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0XFFC9C9C9))),
                                child: SizedBox(
                                  // margin: const EdgeInsets.only(right: 30, left: 0),

                                  child: TextField(
                                    controller: manualAttend2Controller,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    textAlign: TextAlign.center,
                                    //  maxLength: 2,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(0),
                                      hintText: "0",

                                      //   counter: Text(""),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      hintStyle: const TextStyle(
                                        color: Color(0xffB1BBC6),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 75,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xffF1F1F1),
                                    border: Border.all(
                                        color: const Color(0XFFDBDBDB))),
                                child: TextField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(2),
                                  ],
                                  textAlign: TextAlign.center,
                                  //  maxLength: 2,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(0),
                                    hintText: "0",

                                    //   counter: Text(""),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: Color(0XFFDBDBDB),
                                            width: 1)),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: Color(0XFFDBDBDB),
                                            width: 1)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: Color(0XFFDBDBDB),
                                            width: 1)),
                                    hintStyle: const TextStyle(
                                      color: Color(0xffB1BBC6),
                                    ),
                                    fillColor: const Color(0xffF1F1F1),
                                    filled: true,
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * .0135,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Expanded(
                              flex: 2,
                              child: Text(
                                "Long answer",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 75,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0XFFC9C9C9))),
                                child: SizedBox(
                                  // margin: const EdgeInsets.only(right: 30, left: 0),

                                  child: TextField(
                                    controller: section3Controller,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    textAlign: TextAlign.center,
                                    //  maxLength: 2,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(0),
                                      hintText: "0",

                                      //   counter: Text(""),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      hintStyle: const TextStyle(
                                        color: Color(0xffB1BBC6),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 75,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0XFFC9C9C9))),
                                child: SizedBox(
                                  // margin: const EdgeInsets.only(right: 30, left: 0),

                                  child: TextField(
                                    controller: mpq3ManualController,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    textAlign: TextAlign.center,
                                    //  maxLength: 2,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(0),
                                      hintText: "0",

                                      //   counter: Text(""),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      hintStyle: const TextStyle(
                                        color: Color(0xffB1BBC6),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 75,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0XFFC9C9C9))),
                                child: SizedBox(
                                  // margin: const EdgeInsets.only(right: 30, left: 0),

                                  child: TextField(
                                    controller: manualAttend2Controller,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    textAlign: TextAlign.center,
                                    //  maxLength: 2,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(0),
                                      hintText: "0",

                                      //   counter: Text(""),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      hintStyle: const TextStyle(
                                        color: Color(0xffB1BBC6),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 75,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xffF1F1F1),
                                    border: Border.all(
                                        color: const Color(0XFFC9C9C9))),
                                child: TextField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(2),
                                  ],
                                  textAlign: TextAlign.center,
                                  //  maxLength: 2,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(0),
                                    hintText: "0",

                                    //   counter: Text(""),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: Color(0XFFC9C9C9),
                                            width: 1)),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: Color(0XFFC9C9C9),
                                            width: 1)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: Color(0XFFC9C9C9),
                                            width: 1)),
                                    hintStyle: const TextStyle(
                                      color: Color(0xffB1BBC6),
                                    ),
                                    fillColor: const Color(0xffF1F1F1),
                                    filled: true,
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * .0135,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Expanded(
                              flex: 2,
                              child: Text(
                                "Problems & essays",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 75,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0XFFC9C9C9))),
                                child: SizedBox(
                                  // margin: const EdgeInsets.only(right: 30, left: 0),

                                  child: TextField(
                                    controller: section4Controller,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    textAlign: TextAlign.center,
                                    //  maxLength: 2,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(0),
                                      hintText: "0",

                                      //   counter: Text(""),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      hintStyle: const TextStyle(
                                        color: Color(0xffB1BBC6),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 75,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0XFFC9C9C9))),
                                child: SizedBox(
                                  // margin: const EdgeInsets.only(right: 30, left: 0),

                                  child: TextField(
                                    controller: mpq4ManualController,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    textAlign: TextAlign.center,
                                    //  maxLength: 2,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(0),
                                      hintText: "0",

                                      //   counter: Text(""),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      hintStyle: const TextStyle(
                                        color: Color(0xffB1BBC6),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 75,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0XFFC9C9C9))),
                                child: SizedBox(
                                  // margin: const EdgeInsets.only(right: 30, left: 0),

                                  child: TextField(
                                    controller: manualAttend4Controller,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    textAlign: TextAlign.center,
                                    //  maxLength: 2,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(0),
                                      hintText: "0",

                                      //   counter: Text(""),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0XFFC9C9C9),
                                              width: 1)),
                                      hintStyle: const TextStyle(
                                        color: Color(0xffB1BBC6),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 75,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xffF1F1F1),
                                    border: Border.all(
                                        color: const Color(0XFFC9C9C9))),
                                child: TextField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(2),
                                  ],
                                  textAlign: TextAlign.center,
                                  //  maxLength: 2,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(0),
                                    hintText: "0",

                                    //   counter: Text(""),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: Color(0XFFC9C9C9),
                                            width: 1)),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: Color(0XFFC9C9C9),
                                            width: 1)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: Color(0XFFC9C9C9),
                                            width: 1)),
                                    hintStyle: const TextStyle(
                                      color: Color(0xffB1BBC6),
                                    ),
                                    fillColor: const Color(0xffF1F1F1),
                                    filled: true,
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * .0135,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 3,
                            child: RichText(
                              // Controls visual overflow
                              overflow: TextOverflow.clip,

                              // Controls how the text should be aligned horizontally

                              // Control the text direction

                              // Whether the text should break at soft line breaks
                              softWrap: true,

                              // Maximum number of lines for the text to span

                              // The number of font pixels for each logical pixel
                              textScaleFactor: 1,
                              text: const TextSpan(
                                text: "You've selected",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' 45 ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black)),
                                  TextSpan(
                                      text:
                                          'questions and total marks can be scored as',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.grey)),
                                  TextSpan(
                                      text: ' 100',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black)),
                                ],
                              ),
                            ),
                            // Text(
                            //     "You've selected 45 questions and total marks can be scored as 100")
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * .02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context, true);
                                showDialog(
                                    context: context,
                                    builder: (ctx) => SemesterDetailsAlert(
                                          controller: _con,
                                        ));
                              },
                              child: Container(
                                width: 110,
                                height: 45,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: const Center(
                                    child: Text(
                                  "Back",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                )),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context, true);
                                _con.quesPaper.manualSections =
                                    generateQuestions();
                                Navigator.pushNamed(context, "/manual",
                                    arguments: RouteArgument(
                                      param: generateQuestions(),
                                      control: _con,
                                      other: Count1(),
                                    ));
                              },
                              child: Container(
                                width: 150,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black),
                                child: const Center(
                                    child: Text(
                                  "Generate",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<ManualQuestionGenerationModel> generateQuestions() {
    List<ManualQuestionGenerationModel> generatedList =
        <ManualQuestionGenerationModel>[];
    if (int.tryParse(section1Controller.text) != 0) {
      List<Question> questionListOneWord = [];
      questionListOneWord.addAll(_con.allQuestionList
          .where((element) => element.questionType == Constants.oneWord)
          .toList());

      ManualQuestionGenerationModel quesOneWordAnswer =
          ManualQuestionGenerationModel(
              name: 'One Word Questions',
              questionsCount: int.tryParse(section1Controller.text),
              mpqManual: int.tryParse(mpq1ManualController.text),
              attendManual: int.tryParse(manualAttend1Controller.text),
              questions: questionListOneWord);

      generatedList.add(quesOneWordAnswer);
    }
    if (int.tryParse(section2Controller.text) != 0) {
      List<Question> questionListShortAnswer = [];
      questionListShortAnswer.addAll(_con.allQuestionList
          .where((element) => element.questionType == Constants.shortAnswer)
          .toList());

      ManualQuestionGenerationModel quesShortAnswer =
          ManualQuestionGenerationModel(
              name: 'Short Answer Questions',
              questionsCount: int.tryParse(section2Controller.text),
              mpqManual: int.tryParse(mpq2ManualController.text),
              attendManual: int.tryParse(manualAttend2Controller.text),
              questions: questionListShortAnswer);

      generatedList.add(quesShortAnswer);
    }
    if (int.tryParse(section3Controller.text) != 0) {
      List<Question> questionListLongAnswer = [];
      questionListLongAnswer.addAll(_con.allQuestionList
          .where((element) => element.questionType == Constants.longAnswer)
          .toList());

      ManualQuestionGenerationModel quesLongAnswer =
          ManualQuestionGenerationModel(
              name: 'Long Answer Questions',
              questionsCount: int.tryParse(section3Controller.text),
              mpqManual: int.tryParse(mpq3ManualController.text),
              attendManual: int.tryParse(manualAttend3Controller.text),
              questions: questionListLongAnswer);

      generatedList.add(quesLongAnswer);
    }
    if (int.tryParse(section4Controller.text) != 0) {
      List<Question> questionListEssayAnswer = [];
      questionListEssayAnswer.addAll(_con.allQuestionList
          .where((element) => element.questionType == Constants.essayAnswer)
          .toList());

      ManualQuestionGenerationModel quesEssayAnswer =
          ManualQuestionGenerationModel(
              name: 'Essay Answer Questions',
              questionsCount: int.tryParse(section4Controller.text),
              mpqManual: int.tryParse(mpq4ManualController.text),
              attendManual: int.tryParse(manualAttend4Controller.text),
              questions: questionListEssayAnswer);

      generatedList.add(quesEssayAnswer);
    }
    return generatedList;
  }

  int Count1() {
    setState(() {
      count1 = count1 + int.parse(section1Controller.text);
    });
    return count1;
  }
}
