import 'package:enumresponsive/elements/semester_details_alert.dart';
import 'package:enumresponsive/model/generated_question_model.dart';
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

  int count1 = 0;

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
            width: MediaQuery.of(context).size.width * .57,
            height: MediaQuery.of(context).size.height * .7,
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
                          "Select the question types for your test paper",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .0135,
                        ),
                        const Text(
                          "You can add the questions yourself from the Clezz question library in the next section.",
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
                                  "QUESTIONS",
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
                                      onChanged: (e) {
                                        setState(() {});
                                      },
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
                                      onChanged: (e) {
                                        setState(() {});
                                      },
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
                                      onChanged: (e) {
                                        setState(() {});
                                      },
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
                                      onChanged: (e) {
                                        setState(() {});
                                      },
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
                                      onChanged: (e) {
                                        setState(() {});
                                      },
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
                                      onChanged: (e) {
                                        setState(() {});
                                      },
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
                                      onChanged: (e) {
                                        setState(() {});
                                      },
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
                                      onChanged: (e) {
                                        setState(() {});
                                      },
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
                                      onChanged: (e) {
                                        setState(() {});
                                      },
                                      controller: manualAttend3Controller,
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
                                      onChanged: (e) {
                                        setState(() {});
                                      },
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
                                      onChanged: (e) {
                                        setState(() {});
                                      },
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
                                      onChanged: (e) {
                                        setState(() {});
                                      },
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
                                text: TextSpan(
                                  text: "You've selected ",
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: totalQues().toString(),
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
                                        text: totalMPS().toString(),
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
                                  _con.quesPaper.sections = generateQuestions();
                                  Navigator.pushNamed(context, "/manual",
                                      arguments: RouteArgument(
                                        param: generateQuestions(),
                                        control: _con,
                                        other: totalMPS(),
                                        sectionCount: totalSection(),
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
      ),
    );
  }

  List<QuestionGenerationModel> generateQuestions() {
    List<QuestionGenerationModel> generatedList = <QuestionGenerationModel>[];
    if (int.tryParse(section1Controller.text) != 0 &&
        int.tryParse(section1Controller.text) != null) {
      List<Question> questionListOneWord = [];
      questionListOneWord.addAll(_con.allQuestionList
          .where((element) => element.questionType == Constants.oneWord)
          .toList());

      QuestionGenerationModel quesOneWordAnswer = QuestionGenerationModel(
          name: 'One Word Questions',
          typeId: Constants.oneWord,
          total: int.tryParse(section1Controller.text),
          mpq: int.tryParse(mpq1ManualController.text),
          attend: int.tryParse(manualAttend1Controller.text),
          questions: questionListOneWord);

      generatedList.add(quesOneWordAnswer);
    }
    print("nullano ${int.tryParse(section2Controller.text)}");
    if (int.tryParse(section2Controller.text) != 0 &&
        int.tryParse(section2Controller.text) != null) {
      List<Question> questionListShortAnswer = [];
      questionListShortAnswer.addAll(_con.allQuestionList
          .where((element) => element.questionType == Constants.shortAnswer)
          .toList());

      QuestionGenerationModel quesShortAnswer = QuestionGenerationModel(
          name: 'Short Answer Questions',
          typeId: Constants.shortAnswer,
          total: int.tryParse(section2Controller.text),
          mpq: int.tryParse(mpq2ManualController.text),
          attend: int.tryParse(manualAttend2Controller.text),
          questions: questionListShortAnswer);

      generatedList.add(quesShortAnswer);
    }
    if (int.tryParse(section3Controller.text) != 0 &&
        int.tryParse(section3Controller.text) != null) {
      List<Question> questionListLongAnswer = [];
      questionListLongAnswer.addAll(_con.allQuestionList
          .where((element) => element.questionType == Constants.longAnswer)
          .toList());

      QuestionGenerationModel quesLongAnswer = QuestionGenerationModel(
          name: 'Long Answer Questions',
          typeId: Constants.longAnswer,
          total: int.tryParse(section3Controller.text),
          mpq: int.tryParse(mpq3ManualController.text),
          attend: int.tryParse(manualAttend3Controller.text),
          questions: questionListLongAnswer);

      generatedList.add(quesLongAnswer);
    }
    if (int.tryParse(section4Controller.text) != 0 &&
        int.tryParse(section4Controller.text) != null) {
      List<Question> questionListEssayAnswer = [];
      questionListEssayAnswer.addAll(_con.allQuestionList
          .where((element) => element.questionType == Constants.essayAnswer)
          .toList());

      QuestionGenerationModel quesEssayAnswer = QuestionGenerationModel(
          name: 'Essay Answer Questions',
          typeId: Constants.essayAnswer,
          total: int.tryParse(section4Controller.text),
          mpq: int.tryParse(mpq4ManualController.text),
          attend: int.tryParse(manualAttend4Controller.text),
          questions: questionListEssayAnswer);

      generatedList.add(quesEssayAnswer);
    }
    return generatedList;
  }

  // int Count1() {
  //   setState(() {
  //     count1 = count1 + int.parse(section1Controller.text);
  //   });
  //   return count1;
  // }

  int mPS1() {
    int mps1 = 0;
    int trial = 0;
    if (manualAttend1Controller.text.isNotEmpty) {
      trial = 1 * int.parse(manualAttend1Controller.text);
    }
    if (mpq1ManualController.text.isNotEmpty) {
      mps1 = trial * int.parse(mpq1ManualController.text);
    }
    return mps1;
  }

  int mPS2() {
    int mps1 = 0;
    int trial = 0;
    if (manualAttend2Controller.text.isNotEmpty) {
      trial = 1 * int.parse(manualAttend2Controller.text);
    }
    if (mpq2ManualController.text.isNotEmpty) {
      mps1 = trial * int.parse(mpq2ManualController.text);
    }
    return mps1;
  }

  int mPS3() {
    int mps1 = 0;
    int trial = 0;
    if (manualAttend3Controller.text.isNotEmpty) {
      trial = 1 * int.parse(manualAttend3Controller.text);
    }
    if (mpq3ManualController.text.isNotEmpty) {
      mps1 = trial * int.parse(mpq3ManualController.text);
    }
    return mps1;
  }

  int mPS4() {
    int mps1 = 0;
    int trial = 0;
    if (manualAttend4Controller.text.isNotEmpty) {
      trial = 1 * int.parse(manualAttend4Controller.text);
    }
    if (mpq4ManualController.text.isNotEmpty) {
      mps1 = trial * int.parse(mpq4ManualController.text);
    }
    return mps1;
  }

  int totalQues() {
    int a = 0;
    if (section1Controller.text.isNotEmpty) {
      a = a + int.parse(section1Controller.text);
    }
    if (section2Controller.text.isNotEmpty) {
      a = a + int.parse(section2Controller.text);
    }
    if (section3Controller.text.isNotEmpty) {
      a = a + int.parse(section3Controller.text);
    }
    if (section4Controller.text.isNotEmpty) {
      a = a + int.parse(section4Controller.text);
    }

    return a;
  }

  int totalSection() {
    // int a = 1;
    int trial = 0;
    if (section1Controller.text.isNotEmpty) {
      trial = trial + 1;
      print(trial);
    }
    if (section2Controller.text.isNotEmpty) {
      trial = trial + 1;
    }
    if (section3Controller.text.isNotEmpty) {
      trial = trial + 1;
    }
    if (section4Controller.text.isNotEmpty) {
      trial = trial + 1;
    }

    return trial;
  }

  int totalMPS() {
    int totalmark = 0;
    totalmark = mPS1() + mPS2() + mPS3() + mPS4();
    return totalmark;
  }
}
