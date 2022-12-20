import 'dart:developer';

import 'package:enumresponsive/model/modules.dart';
import 'package:enumresponsive/model/routeargument.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../controller/home_controller.dart';
import '../../model/generated_question_model.dart';
import '../../model/questions.dart';

class GeneratedQuestions extends StatefulWidget {
  final RouteArgument? routeArgument;

  //final List<QuestionGenerationModel> questionList;

  const GeneratedQuestions({Key? key, this.routeArgument}) : super(key: key);

  @override
  _GeneratedQuestions createState() => _GeneratedQuestions();
}

class _GeneratedQuestions extends State<GeneratedQuestions> {
  // int count = 0;
  // int? attend;
  // int? mpq;

  @override
  void initState() {
    _con = widget.routeArgument?.control;
    if (widget.routeArgument?.param != null) {
      _con.questionList.addAll(widget.routeArgument!.param);
    }
    // log(widget.routeArgument?.other?.toString() ?? "NULLLL");
    log(_con.quesPaper.sections.length.toString());
    for (var element in _con.quesPaper.sections) {
      if (kDebugMode) {
        print(element.easy);
      }
    }
    // count = widget.routeArgument?.other;
    // attend = widget.routeArgument?.attend;
    // mpq = widget.routeArgument?.mpq;

    _con.getModuleList();
    _con.getQuestionsList();
    _con.getCourseList();
    _con.getQuestionPaperList();
    selectedModule = _con.moduleList.first;
    super.initState();
  }

  late Modules selectedModule;

  //PageController pageController = PageController();
  bool easySelected = false;
  bool mediumSelected = false;
  bool hardSelected = false;
  bool isChecked = false;
  bool visible = false;

  // int currentModule = -1;
  late HomeController _con;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .07,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Clezz",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // Padding(
                  //     padding: const EdgeInsets.only(left: 5.0),
                  //     child: Container(
                  //       height: 50,
                  //       width: MediaQuery.of(context).size.width * .5,
                  //       margin: const EdgeInsets.only(
                  //           left: 0, right: 0, bottom: 10, top: 10),
                  //       decoration: const BoxDecoration(
                  //         color: Color(0XFFD9D9D9),
                  //         borderRadius: BorderRadius.all(Radius.circular(5)),
                  //       ),
                  //       child: TextFormField(
                  //         textAlign: TextAlign.start,
                  //         keyboardType: TextInputType.number,
                  //         style: const TextStyle(
                  //           color: Color(0xff5668A1),
                  //           fontSize: 14,
                  //         ),
                  //         decoration: InputDecoration(
                  //           hintText: "Search",
                  //           hintStyle: const TextStyle(color: Colors.black),
                  //           prefixIcon: const Icon(
                  //             Icons.search,
                  //             color: Colors.black,
                  //           ),
                  //           contentPadding: const EdgeInsets.symmetric(
                  //               vertical: 0.0, horizontal: 10.0),
                  //
                  //           //fillColor: Colors.white,
                  //           focusedBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(5.0),
                  //             borderSide: const BorderSide(
                  //               color: Color(0XFFD9D9D9),
                  //             ),
                  //           ),
                  //           enabledBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(5.0),
                  //             borderSide: const BorderSide(
                  //               color: Color(0XFFD9D9D9),
                  //               width: 0.0,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     )),
                  SizedBox(
                    child: Row(
                      children: const [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 35,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .93,
              margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * .01),
              color: const Color(0xffD9D9D9),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20,
                      ),
                      width: MediaQuery.of(context).size.width * .95,
                      height: MediaQuery.of(context).size.height * .25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * .01,
                                top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xffD9D9D9),
                                      borderRadius: BorderRadius.circular(5)),
                                  width: 40,
                                  height: 40,
                                  child: const Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            _con.quesPaper.questionPaperName,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .015,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text(
                                _con.quesPaper.semester??"",
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              const Text(
                                " th Semester BCA. Degree(Internal)",
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .015,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .04,
                                right: MediaQuery.of(context).size.width * .04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Expanded(
                                    child: Row(
                                      children: [
                                        const Text("Time: ",
                                            style: TextStyle(
                                              fontSize: 22,
                                            )),
                                        Text(_con.quesPaper.timeDuration.toString(),
                                            style: const TextStyle(
                                              fontSize: 22,
                                            )),
                                        Text(  _con.quesPaper.hourOrMinute??"",
                                            style: const TextStyle(
                                              fontSize: 22,
                                            )),
                                      ],
                                    )),
                                 Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                           _con.quesPaper.questionCode??"",
                                            style: TextStyle(
                                              fontSize: 22,
                                            )),
                                        Text(
                                             _con.quesPaper.subject??"",
                                            style: TextStyle(
                                              fontSize: 22,
                                            )),
                                      ],
                                    )),
                                Expanded(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text("Mark:40",
                                        style: TextStyle(
                                          fontSize: 22,
                                        )),
                                    //   Text("widget.toString()??")
                                  ],
                                ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: _con.quesPaper.sections.length,
                        itemBuilder: (context, index) {
                          QuestionGenerationModel ques =
                              _con.questionList.elementAt(index);
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 20,
                                ),
                                width: MediaQuery.of(context).size.width * .95,
                                height:
                                    MediaQuery.of(context).size.height * .22,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .01,
                                    right:
                                        MediaQuery.of(context).size.width * .01,
                                    top: MediaQuery.of(context).size.height *
                                        .02,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 250,
                                          ),
                                          // Text(questionList.length.toString()),
                                          const Text(
                                            "SECTION - A",
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0, right: 0, top: 0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 120,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xffAEAEAE))),
                                                  child: Center(
                                                    child: Text(
                                                      "Refresh",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .grey.shade700,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  width: 120,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xffAEAEAE))),
                                                  child: Center(
                                                    child: Text(
                                                      "Shuffle",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .grey.shade700,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .06,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .4,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color:
                                                    const Color(0xffAEAEAE))),
                                        child: Center(
                                          child: TextFormField(
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Color(0xff5668A1),
                                              fontSize: 22,
                                            ),
                                            decoration: InputDecoration(
                                              hintText:
                                                  "Answer the Four question. Each questions carries 1 mark",
                                              hintStyle: const TextStyle(
                                                  color: Colors.black),

                                              // contentPadding: const EdgeInsets.symmetric(
                                              //     vertical: 0.0, horizontal: 10.0),

                                              //fillColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                borderSide: const BorderSide(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                borderSide: const BorderSide(
                                                  color: Colors.white,
                                                  width: 0.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .01,
                                    right:
                                        MediaQuery.of(context).size.width * .01,
                                    top: MediaQuery.of(context).size.height *
                                        .02,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .95,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .5,
                                        child: ListView.builder(
                                          itemCount: ques.questions.length,
                                          itemBuilder: (context, index) {
                                            Question question =
                                                ques.questions.elementAt(index);
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5.0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.2),
                                                        blurRadius: 5,
                                                        offset:
                                                            const Offset(0, 1)),
                                                  ],
                                                ),
                                                child: IntrinsicHeight(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 50,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: question
                                                                  .diffColor,
                                                              borderRadius: const BorderRadius
                                                                      .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          10)),
                                                            ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                              top: 20.0),
                                                                  child: Text(
                                                                    question
                                                                        .qusId
                                                                        .toString(),
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            22,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 20.0,
                                                                    bottom: 20,
                                                                    left: 20),
                                                            child: Text(
                                                              question.question,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 22),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 18.0,
                                                          right: 20,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                Navigator.pushNamed(
                                                                    context,
                                                                    "/Edit",
                                                                    arguments:
                                                                        RouteArgument());
                                                              },
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: const Color(
                                                                        0xffD9D9D9),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8)),
                                                                width: 100,
                                                                height: 30,
                                                                child:
                                                                    const Center(
                                                                        child:
                                                                            Text(
                                                                  "Edit",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12),
                                                                )),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  color: const Color(
                                                                      0xffD9D9D9),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8)),
                                                              width: 100,
                                                              height: 30,
                                                              child: const Center(
                                                                  child: Text(
                                                                      "Replace",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12))),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .01,
                                            ),
                                            child: Container(
                                              height: 35,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 30.0,
                                                  right: 30,
                                                ),
                                                child: Row(
                                                  children:  [
                                                    Text(
                                                     _con.quesPaper.sections.elementAt(index).attend.toString(),
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 22),
                                                    ),
                                                    Text(
                                                      "*",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 22),
                                                    ),
                                                    Text(
                                                          _con.quesPaper.sections.elementAt(index).mpq.toString(),
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 22),
                                                    ),
                                                    Text(
                                                      "=",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 22),
                                                    ),
                                                    Text(
                                                             totalMark(index).toString(),
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 22),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              )
                            ],
                          );
                        })
                  ],
                ),
              ),
            )
          ],
        ));
  }

int totalMark(index) {
  int tot = 0;
  tot = (_con.quesPaper.sections.elementAt(index).attend! *  _con.quesPaper.sections.elementAt(index).mpq!);
  return tot;
}
// questionSelect(index) {
//   if (_con.allQuestionList.elementAt(index).isChecked == true) {
//     setState(() {
//       _con.allQuestionList.elementAt(index).isChecked == false;
//     });
//   } else {
//     setState(() {
//       _con.allQuestionList.elementAt(index).isChecked == true;
//     });
//   }
// }
// int TotalQuesNo(){
//   totalQues=tota
// }

}
