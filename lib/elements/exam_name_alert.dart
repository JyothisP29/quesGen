import 'package:enumresponsive/elements/semester_details_alert.dart';
import 'package:flutter/material.dart';

import '../controller/home_controller.dart';

class ExamNameAlert extends StatefulWidget {
  final HomeController controller;
  const ExamNameAlert({
    Key? key, required this.controller,
  }) : super(key: key);

  @override
  _ExamNameAlert createState() => _ExamNameAlert();
}

class _ExamNameAlert extends State<ExamNameAlert> {

  late HomeController _con;

  bool addsub = false;
  String? durationtime;

  var time1 = [
    'Hours',
    'Minutes',
  ];
  late TextEditingController examNameController,paperCodeController,timeController;

  @override
  void initState() {
    super.initState();
    //  count=widget.routeArgument.other;
    _con=widget.controller;
    examNameController = TextEditingController();
    paperCodeController = TextEditingController();
    timeController = TextEditingController();

  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    timeController.dispose();
    examNameController.dispose();
    paperCodeController.dispose();

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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            child: const Icon(Icons.close,size: 35,))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .04,
                        right: MediaQuery.of(context).size.width * .04,
                        bottom: MediaQuery.of(context).size.height * .02),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Text(
                              "Let's begin with entering your question paper details",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        Row(
                          children: const [
                            Text(
                              "This data will be shown on your question paper header",
                              style: TextStyle(fontSize: 22, color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .06,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, bottom: 0),
                              child: Row(
                                children: const [
                                  Text(
                                    "Name of the Examination*",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Container(
                                  height: 45,
                                  margin: const EdgeInsets.only(
                                      left: 0, right: 0, bottom: 5, top: 5),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: TextFormField(
                                    controller: examNameController,
                                    onChanged: (e) {
                                      setState(() {
                                        _con.quesPaper.questionPaperName=e;

                                      });
                                    },
                                    cursorColor: Colors.black,
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(

                                      fontSize: 20,
                                    ),
                                    decoration: InputDecoration(
                                      hintText:
                                          "Enter the name of the examination",
                                      hintStyle: const TextStyle(
                                          color: Colors.grey, fontSize: 20),

                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 20.0),

                                      //fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade600,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .06,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, bottom: 0),
                              child: Row(
                                children: const [
                                  Text(
                                    "Question paper code",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),

                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Container(
                                  height: 45,
                                  margin: const EdgeInsets.only(
                                      left: 0, right: 0, bottom: 5, top: 5),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: TextFormField(

                                    controller: paperCodeController,

                                    onChanged: (e) {
                                      setState(() {
                                        _con.quesPaper.questionCode=e;

                                      });
                                    },
                                    cursorColor: Colors.black,
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                    decoration: InputDecoration(

                                      hintText:
                                          "Enter question paper code(optional)",
                                      hintStyle: const TextStyle(
                                          color: Colors.grey, fontSize: 20),

                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 20.0),

                                      //fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade600,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .06,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, bottom: 0),
                              child: Row(
                                children: const [
                                  Text(
                                    "Time Duration*",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Container(
                                      width: 80,
                                      height: 45,
                                      margin: const EdgeInsets.only(
                                          left: 0, right: 0, bottom: 5, top: 5),
                                      decoration: const BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: TextFormField(
                                        controller: timeController,

                                        onChanged: (e) {
                                          setState(() {
                                            _con.quesPaper.timeDuration=int.parse(e);

                                          });
                                        },
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(

                                          fontSize: 20,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "00:00",
                                          hintStyle: const TextStyle(
                                              color: Colors.grey, fontSize: 20),

                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 15.0),

                                          //fillColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.grey.shade600,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 120,
                                  height: 45,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      //background color of dropdown button
                                      border: Border.all(
                                          color: Colors.grey.shade600, width: 1),
                                      //border of dropdown button
                                      borderRadius: BorderRadius.circular(
                                          10), //border raiuds of dropdown button
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15),
                                      child: DropdownButton(

                                        hint: Text(
                                          "Hours",
                                          style: TextStyle(
                                            fontSize: 18,
                                              color: Colors.grey.shade500),

                                        ),

                                        // Initial Value
                                        value: durationtime,

                                        // Down Arrow Icon
                                        icon: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),

                                        // Array list of items
                                        items: time1.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 5),
                                              child: Text(
                                                maxLines: 4,
                                                overflow: TextOverflow.ellipsis,
                                                items,
                                                style:
                                                    const TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            durationtime = newValue!;
                                            _con.quesPaper.hourOrMinute=newValue;
                                          });
                                        },

                                        isExpanded: true,
                                        underline: Container(),
                                        //empty line
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .029,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context, true);
                                  showDialog(
                                      context: context,
                                      builder: (ctx) =>
                                           SemesterDetailsAlert(controller: _con,));
                                },
                                child: Container(
                                  width: 150,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black),
                                  child: const Center(
                                      child: Text(
                                    "Next",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void togaddsub() {
    setState(() {
      addsub = !addsub;
    });
  }
}
