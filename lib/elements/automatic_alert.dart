import 'package:enumresponsive/Helpers/constants.dart';
import 'package:enumresponsive/elements/semester_details_alert.dart';
import 'package:enumresponsive/model/questions.dart';
import 'package:enumresponsive/model/routeargument.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controller/home_controller.dart';
import '../model/generated_question_model.dart';

class AutomaticAlert extends StatefulWidget {
  final HomeController controller;

  const AutomaticAlert({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _AutomaticAlert createState() => _AutomaticAlert();
}

class _AutomaticAlert extends State<AutomaticAlert> {
  late HomeController _con;

  late TextEditingController myController,
      myControllerEasy1,
      myControllerMedium1,
      myControllerHard1,
      myControllerTotal1,
      myControllerAttend1,
      myControllerMPQ1,
      myControllerMPS1,
      myControllerEasy2,
      myControllerMedium2,
      myControllerHard2,
      myControllerTotal2,
      myControllerAttend2,
      myControllerMPQ2,
      myControllerMPS2,
      myControllerEasy3,
      myControllerMedium3,
      myControllerHard3,
      myControllerTotal3,
      myControllerAttend3,
      myControllerMPQ3,
      myControllerMPS3,
      myControllerEasy4,
      myControllerMedium4,
      myControllerHard4,
      myControllerTotal4,
      myControllerAttend4,
      myControllerMPQ4,
      myControllerMPS4;

  @override
  void initState() {
    super.initState();

    _con = widget.controller;
    myController = TextEditingController();
    myControllerEasy1 = TextEditingController();
    myControllerMedium1 = TextEditingController();
    myControllerHard1 = TextEditingController();
    myControllerTotal1 = TextEditingController();
    myControllerAttend1 = TextEditingController();
    myControllerMPQ1 = TextEditingController();
    myControllerMPS1 = TextEditingController();

    myControllerEasy2 = TextEditingController();
    myControllerMedium2 = TextEditingController();
    myControllerHard2 = TextEditingController();
    myControllerTotal2 = TextEditingController();
    myControllerAttend2 = TextEditingController();
    myControllerMPQ2 = TextEditingController();
    myControllerMPS2 = TextEditingController();

    myControllerEasy3 = TextEditingController();
    myControllerMedium3 = TextEditingController();
    myControllerHard3 = TextEditingController();
    myControllerTotal3 = TextEditingController();
    myControllerAttend3 = TextEditingController();
    myControllerMPQ3 = TextEditingController();
    myControllerMPS3 = TextEditingController();

    myControllerEasy4 = TextEditingController();
    myControllerMedium4 = TextEditingController();
    myControllerHard4 = TextEditingController();
    myControllerTotal4 = TextEditingController();
    myControllerAttend4 = TextEditingController();
    myControllerMPQ4 = TextEditingController();
    myControllerMPS4 = TextEditingController();
    _con.getQuestionsList();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myControllerEasy1.dispose();
    myControllerMedium1.dispose();
    myControllerHard1.dispose();
    myControllerTotal1.dispose();
    myControllerAttend1.dispose();
    myControllerMPQ1.dispose();
    myControllerMPS1.dispose();

    myControllerEasy2.dispose();
    myControllerMedium2.dispose();
    myControllerHard2.dispose();
    myControllerTotal2.dispose();
    myControllerAttend2.dispose();
    myControllerMPQ2.dispose();
    myControllerMPS2.dispose();

    myControllerEasy3.dispose();
    myControllerMedium3.dispose();
    myControllerHard3.dispose();
    myControllerTotal3.dispose();
    myControllerAttend3.dispose();
    myControllerMPQ3.dispose();
    myControllerMPS3.dispose();

    myControllerEasy4.dispose();
    myControllerMedium4.dispose();
    myControllerHard4.dispose();
    myControllerTotal4.dispose();
    myControllerAttend4.dispose();
    myControllerMPQ4.dispose();
    myControllerMPS4.dispose();

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
            child: SingleChildScrollView(
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
                        const Text(
                          "Help Clezz to understand the question types for your question paper",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .0135,
                        ),
                        const Text(
                          "You can define question types with complexity, mark and count to attend against each section and Clezz will generate your test paper accordingly.",
                          style: TextStyle(fontSize: 22, color: Colors.grey),
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
                                  "EASY",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                "MEDIUM",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            )),
                            Expanded(
                                child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                "HARD",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            )),
                            Expanded(
                                child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                "TOTAL",
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
                                "MARKS/QUESTION",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            )),
                            Expanded(
                                child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                "MARK/SECTION",
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
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffA3E5D4))),
                                  child: SizedBox(
                                    // margin: const EdgeInsets.only(right: 30, left: 0),

                                    child: TextField(
                                      controller: myControllerEasy1,

                                      onChanged: (e) {
                                        setState(() {});
                                      },

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
                                                color: Color(0xffA3E5D4),
                                                width: 1)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffA3E5D4),
                                                width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffA3E5D4),
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
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffE5DD92))),
                                  child: SizedBox(
                                    // margin: const EdgeInsets.only(right: 30, left: 0),

                                    child: TextField(
                                      controller: myControllerMedium1,
                                      onChanged: (e) {
                                        setState(() {
                                          // _con.quesPaper.medium2 =
                                          //     int.tryParse(e);
                                        });
                                      },
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
                                                color: Color(0xffE5DD92),
                                                width: 1)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE5DD92),
                                                width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE5DD92),
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
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffE5A3A3))),
                                  child: SizedBox(
                                    // margin: const EdgeInsets.only(right: 30, left: 0),

                                    child: TextField(
                                      controller: myControllerHard1,
                                      onChanged: (e) {
                                        setState(() {
                                          // _con.quesPaper.hard1 = int.tryParse(e);
                                        });
                                      },
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
                                                color: Color(0xffE5A3A3),
                                                width: 1)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE5A3A3),
                                                width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE5A3A3),
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
                                    width:
                                        MediaQuery.of(context).size.width * .04,
                                    height: MediaQuery.of(context).size.height *
                                        .046,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xffF1F1F1),
                                        border: Border.all(
                                            color: const Color(0xffC9C9C9))),
                                    child: Center(
                                        child: Text(
                                      total1().toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xffB1BBC6)),
                                    ))),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffC9C9C9))),
                                  child: Center(
                                    child: TextField(
                                      onChanged: (e) {
                                        setState(() {});
                                      },
                                      controller: myControllerAttend1,

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
                                                color: Color(0xffC9C9C9),
                                                width: 1)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffC9C9C9),
                                                width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffC9C9C9),
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
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffAEAEAE))),
                                  child: TextField(
                                    onChanged: (e) {
                                      setState(() {});
                                    },
                                    controller: myControllerMPQ1,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(0),
                                      hintText: "0",
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xffAEAEAE),
                                              width: 1)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xffAEAEAE),
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xffAEAEAE),
                                              width: 1)),
                                      hintStyle: const TextStyle(
                                        color: Color(0xffB1BBC6),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
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
                                    width:
                                        MediaQuery.of(context).size.width * .04,
                                    height: MediaQuery.of(context).size.height *
                                        .046,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xffF1F1F1),
                                        border: Border.all(
                                            color: const Color(0xffC9C9C9))),
                                    child: Center(
                                        child: Text(
                                      mPS1().toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xffB1BBC6)),
                                    ))),
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
                                child: Text("Short answer",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ))),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffA3E5D4))),
                                  child: SizedBox(
                                    // margin: const EdgeInsets.only(right: 30, left: 0),

                                    child: TextField(
                                      controller: myControllerEasy2,
                                      onChanged: (e) {
                                        setState(() {});
                                      },
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
                                                color: Color(0xffA3E5D4),
                                                width: 1)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffA3E5D4),
                                                width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffA3E5D4),
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
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffE5DD92))),
                                  child: SizedBox(
                                    // margin: const EdgeInsets.only(right: 30, left: 0),

                                    child: TextField(
                                      onChanged: (e) {
                                        setState(() {});
                                      },
                                      controller: myControllerMedium2,
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
                                                color: Color(0xffE5DD92),
                                                width: 1)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE5DD92),
                                                width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE5DD92),
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
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffE5A3A3))),
                                  child: SizedBox(
                                    // margin: const EdgeInsets.only(right: 30, left: 0),

                                    child: TextField(
                                      controller: myControllerHard2,
                                      onChanged: (e) {
                                        setState(() {
                                          // _con.quesPaper.hard3 = int.tryParse(e);
                                        });
                                      },
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
                                                color: Color(0xffE5A3A3),
                                                width: 1)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE5A3A3),
                                                width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE5A3A3),
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
                                    width:
                                        MediaQuery.of(context).size.width * .04,
                                    height: MediaQuery.of(context).size.height *
                                        .046,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xffF1F1F1),
                                        border: Border.all(
                                            color: const Color(0xffC9C9C9))),
                                    child: Center(
                                        child: Text(
                                      total2().toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xffB1BBC6)),
                                    ))),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffC9C9C9))),
                                  child: Center(
                                    child: TextField(
                                      controller: myControllerAttend2,
                                      onChanged: (e) {
                                        setState(() {
                                          // _con.quesPaper.attend2 =
                                          //     int.tryParse(e);
                                        });
                                      },
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
                                                color: Color(0xffC9C9C9),
                                                width: 1)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffC9C9C9),
                                                width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffC9C9C9),
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
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffAEAEAE))),
                                  child: TextField(
                                    controller: myControllerMPQ2,
                                    onChanged: (e) {
                                      setState(() {});
                                    },
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
                                              color: Color(0xffAEAEAE),
                                              width: 1)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xffAEAEAE),
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xffAEAEAE),
                                              width: 1)),
                                      hintStyle: const TextStyle(
                                        color: Color(0xffB1BBC6),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
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
                                    width:
                                        MediaQuery.of(context).size.width * .04,
                                    height: MediaQuery.of(context).size.height *
                                        .046,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xffF1F1F1),
                                        border: Border.all(
                                            color: const Color(0xffC9C9C9))),
                                    child: Center(
                                        child: Text(
                                      mPS2().toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xffB1BBC6)),
                                    ))),
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
                            Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: const Text("Long answer",
                                      style: TextStyle(
                                        fontSize: 18,
                                      )),
                                )),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffA3E5D4))),
                                  child: SizedBox(
                                    // margin: const EdgeInsets.only(right: 30, left: 0),

                                    child: TextField(
                                      controller: myControllerEasy3,
                                      onChanged: (String e) {
                                        setState(() {
                                          // _con.quesPaper.easy3 = int.tryParse(e);
                                        });
                                      },
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
                                                color: Color(0xffA3E5D4),
                                                width: 1)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffA3E5D4),
                                                width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffA3E5D4),
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
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffE5DD92))),
                                  child: SizedBox(
                                    // margin: const EdgeInsets.only(right: 30, left: 0),

                                    child: TextField(
                                      onChanged: (String e) {
                                        setState(() {});
                                      },
                                      controller: myControllerMedium3,
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
                                                color: Color(0xffE5DD92),
                                                width: 1)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE5DD92),
                                                width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE5DD92),
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
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffE5A3A3))),
                                  child: SizedBox(
                                    // margin: const EdgeInsets.only(right: 30, left: 0),

                                    child: TextField(
                                      onChanged: (String e) {
                                        setState(() {
                                          // _con.quesPaper.hard3 = int.tryParse(e);
                                        });
                                      },
                                      controller: myControllerHard3,
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
                                                color: Color(0xffE5A3A3),
                                                width: 1)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE5A3A3),
                                                width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE5A3A3),
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
                                    width:
                                        MediaQuery.of(context).size.width * .04,
                                    height: MediaQuery.of(context).size.height *
                                        .046,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xffF1F1F1),
                                        border: Border.all(
                                            color: const Color(0xffC9C9C9))),
                                    child: Center(
                                        child: Text(
                                      total3().toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xffB1BBC6)),
                                    ))),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffC9C9C9))),
                                  child: Center(
                                    child: TextField(
                                      controller: myControllerAttend3,
                                      onChanged: (e) {
                                        setState(() {
                                          // _con.quesPaper.attend3 =
                                          //     int.tryParse(e);
                                        });
                                      },
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
                                                color: Color(0xffC9C9C9),
                                                width: 1)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffC9C9C9),
                                                width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffC9C9C9),
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
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffAEAEAE))),
                                  child: TextField(
                                    controller: myControllerMPQ3,
                                    onChanged: (e) {
                                      setState(() {
                                        // _con.quesPaper.mpq3 = int.tryParse(e);
                                      });
                                    },
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
                                              color: Color(0xffAEAEAE),
                                              width: 1)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xffAEAEAE),
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xffAEAEAE),
                                              width: 1)),
                                      hintStyle: const TextStyle(
                                        color: Color(0xffB1BBC6),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
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
                                    width:
                                        MediaQuery.of(context).size.width * .04,
                                    height: MediaQuery.of(context).size.height *
                                        .046,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xffF1F1F1),
                                        border: Border.all(
                                            color: const Color(0xffC9C9C9))),
                                    child: Center(
                                        child: Text(
                                      mPS3().toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xffB1BBC6)),
                                    ))),
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
                                child: Text("Problems & Essays",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ))),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffA3E5D4))),
                                  child: SizedBox(
                                    // margin: const EdgeInsets.only(right: 30, left: 0),

                                    child: TextField(
                                      onChanged: (String e) {
                                        setState(() {});
                                      },
                                      controller: myControllerEasy4,
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
                                                color: Color(0xffA3E5D4),
                                                width: 1)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffA3E5D4),
                                                width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffA3E5D4),
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
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffE5DD92))),
                                  child: SizedBox(
                                    child: TextField(
                                      onChanged: (String e) {
                                        setState(() {});
                                      },
                                      controller: myControllerMedium4,
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
                                                color: Color(0xffE5DD92),
                                                width: 1)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE5DD92),
                                                width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE5DD92),
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
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffE5A3A3))),
                                  child: SizedBox(
                                    child: TextField(
                                      onChanged: (String e) {
                                        setState(() {});
                                      },
                                      controller: myControllerHard4,
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
                                                color: Color(0xffE5A3A3),
                                                width: 1)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE5A3A3),
                                                width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE5A3A3),
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
                                    width:
                                        MediaQuery.of(context).size.width * .04,
                                    height: MediaQuery.of(context).size.height *
                                        .046,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xffF1F1F1),
                                        border: Border.all(
                                            color: const Color(0xffC9C9C9))),
                                    child: Center(
                                        child: Text(
                                      total4().toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xffB1BBC6)),
                                    ))),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffC9C9C9))),
                                  child: Center(
                                    child: TextField(
                                      controller: myControllerAttend4,
                                      onChanged: (e) {
                                        setState(() {});
                                      },
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
                                                color: Color(0xffC9C9C9),
                                                width: 1)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffC9C9C9),
                                                width: 1)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: Color(0xffC9C9C9),
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
                                  width:
                                      MediaQuery.of(context).size.width * .04,
                                  height:
                                      MediaQuery.of(context).size.height * .046,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xffAEAEAE))),
                                  child: TextField(
                                    controller: myControllerMPQ4,
                                    onChanged: (e) {
                                      setState(() {});
                                    },
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
                                              color: Color(0xffAEAEAE),
                                              width: 1)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xffAEAEAE),
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xffAEAEAE),
                                              width: 1)),
                                      hintStyle: const TextStyle(
                                        color: Color(0xffB1BBC6),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
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
                                    width:
                                        MediaQuery.of(context).size.width * .04,
                                    height: MediaQuery.of(context).size.height *
                                        .046,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xffF1F1F1),
                                        border: Border.all(
                                            color: const Color(0xffC9C9C9))),
                                    child: Center(
                                        child: Text(
                                      mPS4().toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xffB1BBC6)),
                                    ))),
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
                              flex: 1,
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
                                text: TextSpan(
                                  text: "You've selected ",
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: totalQuestion().toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black)),
                                    const TextSpan(
                                        text:
                                            ' questions and total marks can be scored as ',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey)),
                                    TextSpan(
                                        text: mPS().toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .0125,
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

                                  _con.quesPaper.sections = generateQuestions();
                                  Navigator.pushNamed(
                                      context, "/generatedQuestion",
                                      arguments: RouteArgument(
                                          param: generateQuestions(),
                                          control: _con,
                                          other: mPS()));
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
      ),
    );
  }

  List<QuestionGenerationModel> generateQuestions() {
    List<QuestionGenerationModel> generatedList = <QuestionGenerationModel>[];
    if (total1() != 0) {
      int oneWordEasy = myControllerEasy1.text.isEmpty
          ? 0
          : int.parse(myControllerEasy1.text);
      int oneWordMedium = myControllerMedium1.text.isEmpty
          ? 0
          : int.parse(myControllerMedium1.text);
      int oneWordHard = myControllerHard1.text.isEmpty
          ? 0
          : int.parse(myControllerHard1.text);
      List<Question> questionListOneWord = [];
      questionListOneWord.addAll(_con.allQuestionList
          .where((element) =>
              element.diffLevel == Constants.easyQuestions &&
              element.questionType == Constants.oneWord)
          .take(oneWordEasy)
          .toList());
      questionListOneWord.addAll(_con.allQuestionList
          .where((element) =>
              element.diffLevel == Constants.mediumQuestion &&
              element.questionType == Constants.oneWord)
          .take(oneWordMedium)
          .toList());

      questionListOneWord.addAll(_con.allQuestionList
          .where((element) =>
              element.diffLevel == Constants.hardQuestions &&
              element.questionType == Constants.oneWord)
          .take(oneWordHard)
          .toList());

      QuestionGenerationModel quesOneWordAnswer = QuestionGenerationModel(
          name: 'One Word Questions',
          typeId: Constants.oneWord,
          easy: int.tryParse(myControllerEasy1.text),
          medium: int.tryParse(myControllerMedium1.text),
          hard: int.tryParse(myControllerHard1.text),
          total: int.tryParse(myControllerTotal1.text),
          attend: int.tryParse(myControllerAttend1.text),
          mpq: int.tryParse(myControllerMPQ1.text),
          questions: questionListOneWord);

      generatedList.add(quesOneWordAnswer);
    }
    if (total2() != 0) {
      int shortEasy = myControllerEasy2.text.isEmpty
          ? 0
          : int.parse(myControllerEasy2.text);
      int shortMedium = myControllerMedium2.text.isEmpty
          ? 0
          : int.parse(myControllerMedium2.text);
      int shortHard = myControllerHard2.text.isEmpty
          ? 0
          : int.parse(myControllerHard2.text);
      List<Question> questionListShort = [];
      questionListShort.addAll(_con.allQuestionList
          .where((element) =>
              element.diffLevel == Constants.easyQuestions &&
              element.questionType == Constants.shortAnswer)
          .take(shortEasy)
          .toList());
      questionListShort.addAll(_con.allQuestionList
          .where((element) =>
              element.diffLevel == Constants.mediumQuestion &&
              element.questionType == Constants.shortAnswer)
          .take(shortMedium)
          .toList());
      questionListShort.addAll(_con.allQuestionList
          .where((element) =>
              element.diffLevel == Constants.hardQuestions &&
              element.questionType == Constants.shortAnswer)
          .take(shortHard)
          .toList());
      QuestionGenerationModel quesShortAnswer = QuestionGenerationModel(
          name: 'Short Answer Questions',
          typeId: Constants.shortAnswer,
          easy: int.tryParse(myControllerEasy2.text),
          medium: int.tryParse(myControllerMedium2.text),
          hard: int.tryParse(myControllerHard2.text),
          total: int.tryParse(myControllerTotal2.text),
          attend: int.tryParse(myControllerAttend2.text),
          mpq: int.tryParse(myControllerMPQ2.text),
          questions: questionListShort);
      generatedList.add(quesShortAnswer);
    }
    if (total3() != 0) {
      int longAnswerEasy = myControllerEasy3.text.isEmpty
          ? 0
          : int.parse(myControllerEasy3.text);
      int longAnswerMedium = myControllerMedium3.text.isEmpty
          ? 0
          : int.parse(myControllerMedium3.text);
      int longAnswerHard = myControllerHard3.text.isEmpty
          ? 0
          : int.parse(myControllerHard3.text);
      List<Question> questionListLongAnswer = [];
      questionListLongAnswer.addAll(_con.allQuestionList
          .where((element) =>
              element.diffLevel == Constants.easyQuestions &&
              element.questionType == Constants.longAnswer)
          .take(longAnswerEasy)
          .toList());
      questionListLongAnswer.addAll(_con.allQuestionList
          .where((element) =>
              element.diffLevel == Constants.mediumQuestion &&
              element.questionType == Constants.longAnswer)
          .take(longAnswerMedium)
          .toList());
      questionListLongAnswer.addAll(_con.allQuestionList
          .where((element) =>
              element.diffLevel == Constants.hardQuestions &&
              element.questionType == Constants.longAnswer)
          .take(longAnswerHard)
          .toList());
      QuestionGenerationModel quesLongAnswer = QuestionGenerationModel(
          name: 'Long Answer Questions',
          typeId: Constants.longAnswer,
          easy: int.tryParse(myControllerEasy3.text),
          medium: int.tryParse(myControllerMedium3.text),
          hard: int.tryParse(myControllerHard3.text),
          total: int.tryParse(myControllerTotal3.text),
          attend: int.tryParse(myControllerAttend3.text),
          mpq: int.tryParse(myControllerMPQ3.text),
          questions: questionListLongAnswer);
      generatedList.add(quesLongAnswer);
    }
    if (total4() != 0) {
      int essayAnswerEasy = myControllerEasy4.text.isEmpty
          ? 0
          : int.parse(myControllerEasy4.text);
      int essayAnswerMedium = myControllerMedium4.text.isEmpty
          ? 0
          : int.parse(myControllerMedium4.text);
      int essayAnswerHard = myControllerHard4.text.isEmpty
          ? 0
          : int.parse(myControllerHard4.text);
      List<Question> questionListEssayAnswer = [];
      questionListEssayAnswer.addAll(_con.allQuestionList
          .where((element) =>
              element.diffLevel == Constants.easyQuestions &&
              element.questionType == Constants.essayAnswer)
          .take(essayAnswerEasy)
          .toList());
      questionListEssayAnswer.addAll(_con.allQuestionList
          .where((element) =>
              element.diffLevel == Constants.mediumQuestion &&
              element.questionType == Constants.essayAnswer)
          .take(essayAnswerMedium)
          .toList());
      questionListEssayAnswer.addAll(_con.allQuestionList
          .where((element) =>
              element.diffLevel == Constants.hardQuestions &&
              element.questionType == Constants.essayAnswer)
          .take(essayAnswerHard)
          .toList());
      QuestionGenerationModel quesEssayAnswer = QuestionGenerationModel(
          name: 'Essay Questions',
          typeId: Constants.essayAnswer,
          easy: int.tryParse(myControllerEasy4.text),
          medium: int.tryParse(myControllerMedium4.text),
          hard: int.tryParse(myControllerHard4.text),
          total: int.tryParse(myControllerTotal4.text),
          attend: int.tryParse(myControllerAttend4.text),
          mpq: int.tryParse(myControllerMPQ4.text),
          questions: questionListEssayAnswer);
      generatedList.add(quesEssayAnswer);
    }
    return generatedList;
  }

  // List<QuestionGenerationModel> generateQuestions() {
  //   List<QuestionGenerationModel> generatedList = <QuestionGenerationModel>[];
  //
  //   ///One word and objective section
  //   int oneWordEasy =
  //       myControllerEasy1.text.isEmpty ? 0 : int.parse(myControllerEasy1.text);
  //   int oneWordMedium = myControllerMedium1.text.isEmpty
  //       ? 0
  //       : int.parse(myControllerMedium1.text);
  //   int oneWordHard =
  //       myControllerHard1.text.isEmpty ? 0 : int.parse(myControllerHard1.text);
  //   List<Question> questionListOneWord = [];
  //   questionListOneWord.addAll(_con.allQuestionList
  //       .where((element) =>
  //           element.diffLevel == Constants.easyQuestions &&
  //           element.questionType == Constants.oneWord)
  //       .take(oneWordEasy)
  //       .toList());
  //   questionListOneWord.addAll(_con.allQuestionList
  //       .where((element) =>
  //           element.diffLevel == Constants.mediumQuestion &&
  //           element.questionType == Constants.oneWord)
  //       .take(oneWordMedium)
  //       .toList());
  //   questionListOneWord.addAll(_con.allQuestionList
  //       .where((element) =>
  //           element.diffLevel == Constants.hardQuestions &&
  //           element.questionType == Constants.oneWord)
  //       .take(oneWordHard)
  //       .toList());
  //   QuestionGenerationModel quesOneWord = QuestionGenerationModel(
  //       name: "One word & Objective",
  //       easy: oneWordEasy,
  //       medium: oneWordMedium,
  //       hard: oneWordHard,
  //       total: total1(),
  //       questions: questionListOneWord);
  //   generatedList.add(quesOneWord);
  //
  //   ///Short answer section
  //   int shortEasy =
  //       myControllerEasy2.text.isEmpty ? 0 : int.parse(myControllerEasy2.text);
  //   int shortMedium = myControllerMedium2.text.isEmpty
  //       ? 0
  //       : int.parse(myControllerMedium2.text);
  //   int shortHard =
  //       myControllerHard2.text.isEmpty ? 0 : int.parse(myControllerHard2.text);
  //   List<Question> questionListShort = [];
  //   questionListShort.addAll(_con.allQuestionList
  //       .where((element) =>
  //           element.diffLevel == Constants.easyQuestions &&
  //           element.questionType == Constants.shortAnswer)
  //       .take(shortEasy)
  //       .toList());
  //   questionListShort.addAll(_con.allQuestionList
  //       .where((element) =>
  //           element.diffLevel == Constants.mediumQuestion &&
  //           element.questionType == Constants.shortAnswer)
  //       .take(shortMedium)
  //       .toList());
  //   questionListShort.addAll(_con.allQuestionList
  //       .where((element) =>
  //           element.diffLevel == Constants.hardQuestions &&
  //           element.questionType == Constants.shortAnswer)
  //       .take(shortHard)
  //       .toList());
  //   QuestionGenerationModel quesShort = QuestionGenerationModel(
  //       name: "Short Answer",
  //       easy: shortEasy,
  //       medium: shortMedium,
  //       hard: shortHard,
  //       total: total2(),
  //       questions: questionListShort);
  //
  //   generatedList.add(quesShort);
  //
  //   ///Long Answer Section
  //
  //   int longAnswerEasy =
  //       myControllerEasy3.text.isEmpty ? 0 : int.parse(myControllerEasy3.text);
  //   int longAnswerMedium = myControllerMedium3.text.isEmpty
  //       ? 0
  //       : int.parse(myControllerMedium3.text);
  //   int longAnswerHard =
  //       myControllerHard3.text.isEmpty ? 0 : int.parse(myControllerHard3.text);
  //   List<Question> questionListLongAnswer = [];
  //   questionListLongAnswer.addAll(_con.allQuestionList
  //       .where((element) =>
  //           element.diffLevel == Constants.easyQuestions &&
  //           element.questionType == Constants.longAnswer)
  //       .take(longAnswerEasy)
  //       .toList());
  //   questionListLongAnswer.addAll(_con.allQuestionList
  //       .where((element) =>
  //           element.diffLevel == Constants.mediumQuestion &&
  //           element.questionType == Constants.longAnswer)
  //       .take(longAnswerMedium)
  //       .toList());
  //   questionListLongAnswer.addAll(_con.allQuestionList
  //       .where((element) =>
  //           element.diffLevel == Constants.hardQuestions &&
  //           element.questionType == Constants.longAnswer)
  //       .take(longAnswerHard)
  //       .toList());
  //   QuestionGenerationModel quesLongAnswer = QuestionGenerationModel(
  //       name: "Long Answer",
  //       easy: longAnswerEasy,
  //       medium: longAnswerMedium,
  //       hard: longAnswerHard,
  //       total: total3(),
  //       questions: questionListLongAnswer);
  //   generatedList.add(quesLongAnswer);
  //
  //   ///Essay Answer Section
  //
  //   int essayAnswerEasy =
  //       myControllerEasy4.text.isEmpty ? 0 : int.parse(myControllerEasy4.text);
  //   int essayAnswerMedium = myControllerMedium4.text.isEmpty
  //       ? 0
  //       : int.parse(myControllerMedium4.text);
  //   int essayAnswerHard =
  //       myControllerHard4.text.isEmpty ? 0 : int.parse(myControllerHard4.text);
  //   List<Question> questionListEssayAnswer = [];
  //   questionListEssayAnswer.addAll(_con.allQuestionList
  //       .where((element) =>
  //           element.diffLevel == Constants.easyQuestions &&
  //           element.questionType == Constants.essayAnswer)
  //       .take(essayAnswerEasy)
  //       .toList());
  //   questionListEssayAnswer.addAll(_con.allQuestionList
  //       .where((element) =>
  //           element.diffLevel == Constants.mediumQuestion &&
  //           element.questionType == Constants.essayAnswer)
  //       .take(essayAnswerMedium)
  //       .toList());
  //   questionListEssayAnswer.addAll(_con.allQuestionList
  //       .where((element) =>
  //           element.diffLevel == Constants.hardQuestions &&
  //           element.questionType == Constants.essayAnswer)
  //       .take(essayAnswerHard)
  //       .toList());
  //   QuestionGenerationModel quesEssayAnswer = QuestionGenerationModel(
  //       name: "Problems & Essays",
  //       easy: essayAnswerEasy,
  //       medium: essayAnswerMedium,
  //       hard: essayAnswerHard,
  //       total: total4(),
  //       questions: questionListEssayAnswer);
  //   generatedList.add(quesEssayAnswer);
  //
  //   generatedList.add(quesEssayAnswer);
  //
  //   return generatedList;
  // }

  int total4() {
    int a = 0;
    if (myControllerHard4.text.isNotEmpty) {
      a = a + int.parse(myControllerHard4.text);
    }
    if (myControllerMedium4.text.isNotEmpty) {
      a = a + int.parse(myControllerMedium4.text);
    }
    if (myControllerEasy4.text.isNotEmpty) {
      a = a + int.parse(myControllerEasy4.text);
    }
    return a;
  }

  int total3() {
    int a = 0;
    if (myControllerHard3.text.isNotEmpty) {
      a = a + int.parse(myControllerHard3.text);
    }
    if (myControllerMedium3.text.isNotEmpty) {
      a = a + int.parse(myControllerMedium3.text);
    }
    if (myControllerEasy3.text.isNotEmpty) {
      a = a + int.parse(myControllerEasy3.text);
    }
    return a;
  }

  int total2() {
    int a = 0;
    if (myControllerHard2.text.isNotEmpty) {
      a = a + int.parse(myControllerHard2.text);
    }
    if (myControllerMedium2.text.isNotEmpty) {
      a = a + int.parse(myControllerMedium2.text);
    }
    if (myControllerEasy2.text.isNotEmpty) {
      a = a + int.parse(myControllerEasy2.text);
    }
    return a;
  }

  int total1() {
    int a = 0;
    if (myControllerHard1.text.isNotEmpty) {
      a = a + int.parse(myControllerHard1.text);
    }
    if (myControllerMedium1.text.isNotEmpty) {
      a = a + int.parse(myControllerMedium1.text);
    }
    if (myControllerEasy1.text.isNotEmpty) {
      a = a + int.parse(myControllerEasy1.text);
    }

    return a;
  }

  int totalQuestion() {
    int a = 0;
    if (myControllerHard1.text.isNotEmpty) {
      a = a + int.parse(myControllerHard1.text);
    }
    if (myControllerMedium1.text.isNotEmpty) {
      a = a + int.parse(myControllerMedium1.text);
    }
    if (myControllerEasy1.text.isNotEmpty) {
      a = a + int.parse(myControllerEasy1.text);
    }
    if (myControllerHard3.text.isNotEmpty) {
      a = a + int.parse(myControllerHard3.text);
    }
    if (myControllerMedium3.text.isNotEmpty) {
      a = a + int.parse(myControllerMedium3.text);
    }
    if (myControllerEasy3.text.isNotEmpty) {
      a = a + int.parse(myControllerEasy3.text);
    }
    if (myControllerHard2.text.isNotEmpty) {
      a = a + int.parse(myControllerHard2.text);
    }
    if (myControllerMedium2.text.isNotEmpty) {
      a = a + int.parse(myControllerMedium2.text);
    }
    if (myControllerEasy2.text.isNotEmpty) {
      a = a + int.parse(myControllerEasy2.text);
    }
    if (myControllerHard4.text.isNotEmpty) {
      a = a + int.parse(myControllerHard4.text);
    }
    if (myControllerMedium4.text.isNotEmpty) {
      a = a + int.parse(myControllerMedium4.text);
    }
    if (myControllerEasy4.text.isNotEmpty) {
      a = a + int.parse(myControllerEasy4.text);
    }
    return a;
  }

  int mPS() {
    int mps = 0;
    // int trial = 0;
    mps = mPS1() + mPS2() + mPS3() + mPS4();

    return mps;
  }

  int mPS1() {
    int mps1 = 0;
    int trial = 0;
    if (myControllerAttend1.text.isNotEmpty) {
      trial = 1 * int.parse(myControllerAttend1.text);
    }
    if (myControllerMPQ1.text.isNotEmpty) {
      mps1 = trial * int.parse(myControllerMPQ1.text);
    }
    return mps1;
  }

  int mPS2() {
    int mps2 = 0;
    int trial = 0;
    if (myControllerAttend2.text.isNotEmpty) {
      trial = 1 * int.parse(myControllerAttend2.text);
    }
    if (myControllerMPQ2.text.isNotEmpty) {
      mps2 = trial * int.parse(myControllerMPQ2.text);
    }
    return mps2;
  }

  int mPS3() {
    int mps3 = 0;
    int trial = 0;
    if (myControllerAttend3.text.isNotEmpty) {
      trial = 1 * int.parse(myControllerAttend3.text);
    }
    if (myControllerMPQ3.text.isNotEmpty) {
      mps3 = trial * int.parse(myControllerMPQ3.text);
    }
    return mps3;
  }

  int mPS4() {
    int mps4 = 0;
    int trial = 0;
    if (myControllerAttend4.text.isNotEmpty) {
      trial = 1 * int.parse(myControllerAttend4.text);
    }
    if (myControllerMPQ4.text.isNotEmpty) {
      mps4 = trial * int.parse(myControllerMPQ4.text);
    }
    return mps4;
  }
}
