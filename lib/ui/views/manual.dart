
import 'package:enumresponsive/elements/hover_widget.dart';
import 'package:enumresponsive/model/modules.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:progress_stepper/progress_stepper.dart';

import '../../controller/home_controller.dart';
import '../../model/questions.dart';
import '../../model/routeargument.dart';

class Manual extends StatefulWidget {
  final RouteArgument? routeArgument;

  const Manual({Key? key, this.routeArgument}) : super(key: key);

  @override
  _Manual createState() => _Manual();
}

class _Manual extends State<Manual> {
  int count1 = 0;

  @override
  void initState() {
    _con = widget.routeArgument?.control;
    count1 = widget.routeArgument?.other;
    if (widget.routeArgument?.param != null) {
      _con.questionList.addAll(widget.routeArgument!.param);
    }
    // log(widget.routeArgument?.other?.toString() ?? "NULLLL");
    // log(_con.quesPaper.sections?.length.toString()??"");

    _con.getModuleList();
    _con.getQuestionsList();
    _con.getCourseList();
    _con.getQuestionPaperList();
    selectedModule = _con.moduleList.first;
    super.initState();
  }

  late Modules selectedModule;

  //PageController pageController = PageController();
  bool easySelected = true;
  bool mediumSelected = true;
  bool hardSelected = true;
  bool isChecked = false;
  bool visible = false;

  // int currentModule = -1;
  late HomeController _con;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: _con.scaffoldKey,
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
              margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * .01),
              color: const Color(0xffD9D9D9),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50.0, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProgressStepper(
                              width: 500,
                              height: 45,
                              color: const Color(0xffD9D9D9),
                              progressColor: Colors.black,
                              stepCount: 3,
                              builder: (index) {
                                double widthOfStep = 500 / 3;
                                if (index == 1) {
                                  return ProgressStepWithArrow(
                                    width: widthOfStep,
                                    defaultColor: const Color(0xffD9D9D9),
                                    progressColor: Colors.black,
                                    wasCompleted: true,
                                    child: const Center(
                                        child: Text(
                                      "Section A",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  );
                                }
                                return ProgressStepWithChevron(
                                  width: widthOfStep,
                                  defaultColor: const Color(0xffD9D9D9),
                                  progressColor: Colors.black,
                                  wasCompleted: false,
                                  child: const Center(
                                      child: Text(
                                    "Section B",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                );
                              },
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    _con.selectedQuestionList.length.toString(),
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    " Questions of ",
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    count1.toString(),
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    " Selected",
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .83,
                        child: Container(
                          color: Colors.black,
                          width: MediaQuery.of(context).size.width * .2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .03,
                                    right: MediaQuery.of(context).size.width *
                                        .01),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .06,
                                    ),
                                    const Text(
                                      "Difficulty Levels",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                    ),
                                    Row(
                                      children: [
                                        Transform.scale(
                                          scale: 1.2,
                                          child: Checkbox(
                                            side: const BorderSide(
                                                color: Colors.white),
                                            activeColor: Colors.black,
                                            checkColor: Colors.white,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(3.0),
                                              ),
                                            ),
                                            value: easySelected,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                easySelected = value!;
                                              });
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          "Easy",
                                          style: TextStyle(color: Colors.green),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .01,
                                    ),
                                    Row(
                                      children: [
                                        Transform.scale(
                                          scale: 1.2,
                                          child: Checkbox(
                                            side: const BorderSide(
                                                color: Colors.white),
                                            activeColor: Colors.black,
                                            checkColor: Colors.white,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(3.0),
                                              ),
                                            ),
                                            value: mediumSelected,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                mediumSelected = value!;
                                              });
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          "Medium",
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .01,
                                    ),
                                    Row(
                                      children: [
                                        Transform.scale(
                                          scale: 1.2,
                                          child: Checkbox(
                                            side: const BorderSide(
                                                color: Colors.white),
                                            activeColor: Colors.black,
                                            checkColor: Colors.white,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(3.0),
                                              ),
                                            ),
                                            value: hardSelected,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                hardSelected = value!;
                                              });
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          "Hard",
                                          style: TextStyle(color: Colors.red),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .08,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .03,
                                    right: MediaQuery.of(context).size.width *
                                        .01),
                                child: const Text(
                                  "Question Types",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              const Divider(
                                color: Colors.white,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .03,
                                    right: MediaQuery.of(context).size.width *
                                        .03),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Transform.scale(
                                          scale: 1.2,
                                          child: Checkbox(
                                            side: const BorderSide(
                                                color: Colors.white),
                                            activeColor: Colors.black,
                                            checkColor: Colors.white,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(3.0),
                                              ),
                                            ),
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          "Ojectives Questions",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      "100",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              const Divider(
                                color: Colors.white,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .03,
                                    right: MediaQuery.of(context).size.width *
                                        .03),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Transform.scale(
                                          scale: 1.2,
                                          child: Checkbox(
                                            side: const BorderSide(
                                                color: Colors.white),
                                            activeColor: Colors.black,
                                            checkColor: Colors.white,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(3.0),
                                              ),
                                            ),
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          "True or false Questions",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      "90",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              const Divider(
                                color: Colors.white,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .03,
                                    right: MediaQuery.of(context).size.width *
                                        .03),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Transform.scale(
                                          scale: 1.2,
                                          child: Checkbox(
                                            side: const BorderSide(
                                                color: Colors.white),
                                            activeColor: Colors.black,
                                            checkColor: Colors.white,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(3.0),
                                              ),
                                            ),
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          "Fill in the blanks Questions",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      "50",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              const Divider(
                                color: Colors.white,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .03,
                                    right: MediaQuery.of(context).size.width *
                                        .03),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Transform.scale(
                                          scale: 1.2,
                                          child: Checkbox(
                                            side: const BorderSide(
                                                color: Colors.white),
                                            activeColor: Colors.black,
                                            checkColor: Colors.white,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(3.0),
                                              ),
                                            ),
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          "One word Questions",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      "35",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              const Divider(
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              color: const Color(0xffACACAC),
                              height: MediaQuery.of(context).size.height * .08,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .01,
                                    right: MediaQuery.of(context).size.width *
                                        .01),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      // color: Colors.orange,
                                      width: MediaQuery.of(context).size.width *
                                          .77,
                                      height: 45,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          primary: false,
                                          itemCount: _con.selectedList.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            Modules module = _con.moduleList
                                                .elementAt(index);
                                            bool isSelected =
                                                selectedModule == module;
                                            return Row(
                                              children: [
                                                HoverWidget(
                                                    builder: (isHovering) {
                                                  return InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedModule = module;
                                                      });
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: isSelected
                                                              ? Colors.black
                                                              : const Color(
                                                                  0xffD9D9D9),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      width: 145,
                                                      height: 45,
                                                      child: Center(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            CircleAvatar(
                                                              radius: 14,
                                                              backgroundColor: isSelected
                                                                  ? const Color(
                                                                      0xffD9D9D9)
                                                                  : Colors
                                                                      .black,
                                                              child: Text(
                                                                '888',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: isSelected
                                                                        ? Colors
                                                                            .black
                                                                        : const Color(
                                                                            0xffD9D9D9)),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              _con.moduleList
                                                                      .elementAt(
                                                                          index)
                                                                      .modName ??
                                                                  "",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color: isSelected
                                                                      ? const Color(
                                                                          0xffD9D9D9)
                                                                      : Colors
                                                                          .black),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                                const SizedBox(
                                                  width: 20,
                                                )
                                              ],
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .9,
                                  height:
                                      MediaQuery.of(context).size.height * .75,
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .75,
                                    child: ListView.builder(
                                      itemCount: selectedModule.allQuestionList.length,
                                      shrinkWrap: true,
                                      primary: false,
                                      itemBuilder: (context, index) {
                                        Question ques = selectedModule
                                            .allQuestionList
                                            .elementAt(index);
                                        //   _con.questionList.elementAt(index);
                                        return Container(
                                          margin: const EdgeInsets.all(10),
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                                  offset: const Offset(0, 1)),
                                            ],
                                          ),
                                          child: IntrinsicHeight(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 65,
                                                      decoration: BoxDecoration(
                                                        color: ques.diffLevel ==
                                                                1
                                                            ? const Color(
                                                                0xff35BE13)
                                                            : ques.diffLevel ==
                                                                    2
                                                                ? const Color(
                                                                    0xffDD970F)
                                                                : const Color(
                                                                    0xffF55648),
                                                        borderRadius:
                                                            const BorderRadius
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
                                                              ques.qusId
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 22,
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
                                                          const EdgeInsets.only(
                                                              top: 20.0,
                                                              bottom: 20,
                                                              left: 20),
                                                      child: Text(
                                                        ques.question,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 22),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20.0,
                                                          bottom: 20,
                                                          right: 20),
                                                  child: Transform.scale(
                                                    scale: 1.2,
                                                    child: Checkbox(
                                                      activeColor: Colors.black,
                                                      checkColor: Colors.white,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(3.0),
                                                        ),
                                                      ),
                                                      value: _con.selectedQuestionList
                                                          .contains(ques.qusId),
                                                      onChanged: (val) {
                                                        setState(() {
                                                          if (val!) {
                                                            _con.selectedQuestionList
                                                                .add(
                                                                    ques.qusId);
                                                          } else if (!val) {
                                                            _con.selectedQuestionList
                                                                .remove(
                                                                    ques.qusId);
                                                          }
                                                          if (_con.selectedQuestionList
                                                                  .length ==
                                                              5) {}
                                                          if (kDebugMode) {
                                                            print(_con
                                                              .selectedQuestionList
                                                              .length);
                                                          }
                                                          if (kDebugMode) {
                                                            print(widget
                                                              .routeArgument
                                                              ?.other);
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                // Padding(
                                                //   padding: const EdgeInsets.only(
                                                //     top: 18.0,
                                                //     right: 20,
                                                //   ),
                                                //   child: Row(
                                                //     children: [
                                                //       Container(
                                                //         decoration: BoxDecoration(
                                                //             color: const Color(0xffD9D9D9),
                                                //             borderRadius:
                                                //                 BorderRadius.circular(
                                                //                     8)),
                                                //         width: 100,
                                                //         height: 30,
                                                //         child: const Center(
                                                //             child: Text(
                                                //           "Edit",
                                                //           style:
                                                //               TextStyle(fontSize: 12),
                                                //         )),
                                                //       ),
                                                //       const SizedBox(
                                                //         width: 10,
                                                //       ),
                                                //       Container(
                                                //         decoration: BoxDecoration(
                                                //             color: const Color(0xffD9D9D9),
                                                //             borderRadius:
                                                //                 BorderRadius.circular(
                                                //                     8)),
                                                //         child: const Center(
                                                //             child: Text("Replace",
                                                //                 style: TextStyle(
                                                //                     fontSize: 12))),
                                                //         width: 100,
                                                //         height: 30,
                                                //       ),
                                                //     ],
                                                //   ),
                                                // )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: _con.selectedQuestionList.length == count1
                                      ? true
                                      : false,
                                  child: Positioned(
                                      bottom: 0,
                                      child: AnimatedContainer(
                                        decoration: const BoxDecoration(
                                          color: Color(0xff4D4D4D),
                                        ),
                                        curve: Curves.linear,
                                        duration: const Duration(seconds: 1),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .8,
                                        height: 70,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .03),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _con.selectedQuestionList.clear();
                                                  });
                                                },
                                                child: AnimatedContainer(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: const Color(
                                                            0xffD1D1D1)),
                                                    height: 45,
                                                    width: 135,
                                                    duration: const Duration(
                                                        microseconds: 1000),
                                                    child: const Center(
                                                        child: Text(
                                                      "Clear All",
                                                      style: TextStyle(
                                                          fontSize: 22),
                                                    ))),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white),
                                                  height: 45,
                                                  width: 135,
                                                  child: const Center(
                                                      child: Text(
                                                    "Next",
                                                    style:
                                                        TextStyle(fontSize: 22),
                                                  ))),
                                            ],
                                          ),
                                        ),
                                      )),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // SingleChildScrollView(
            //   child: Container(
            //     margin: EdgeInsets.only(
            //         right: MediaQuery.of(context).size.width * .01),
            //     color: const Color(0xffD9D9D9),
            //     width: MediaQuery.of(context).size.width,
            //     child: Column(
            //       children: [
            //         Container(
            //           margin: const EdgeInsets.only(
            //             top: 20,
            //           ),
            //           width: MediaQuery.of(context).size.width * .95,
            //           height: MediaQuery.of(context).size.height * .25,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               color: Colors.white),
            //           child: Column(
            //             children: [
            //               Padding(
            //                 padding: EdgeInsets.only(
            //                     right: MediaQuery.of(context).size.width * .01,
            //                     top: 20),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.end,
            //                   children: [
            //                     Container(
            //                       decoration: BoxDecoration(
            //                           color: const Color(0xffD9D9D9),
            //                           borderRadius: BorderRadius.circular(5)),
            //                       width: 40,
            //                       height: 40,
            //                       child: const Icon(Icons.edit),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const Text(
            //                 "ABC ARTS & SCIENCE COLLEGE ERNAKULAM",
            //                 style: TextStyle(
            //                     fontSize: 30, fontWeight: FontWeight.bold),
            //               ),
            //               SizedBox(
            //                 height: MediaQuery.of(context).size.height * .015,
            //               ),
            //               const Text(
            //                 "V th Semester BCA. Degree(Internal)",
            //                 style: TextStyle(
            //                   fontSize: 22,
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: MediaQuery.of(context).size.height * .015,
            //               ),
            //               Padding(
            //                 padding: EdgeInsets.only(
            //                     left: MediaQuery.of(context).size.width * .04,
            //                     right: MediaQuery.of(context).size.width * .04),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     const Expanded(
            //                         child: Text("Time: 2 Hours",
            //                             style: TextStyle(
            //                               fontSize: 22,
            //                             ))),
            //                     const Expanded(
            //                         child: Center(
            //                             child: Text(
            //                                 "1A11BCA: INFORMATICS FOR COMPUTER",
            //                                 style: TextStyle(
            //                                   fontSize: 22,
            //                                 )))),
            //                     Expanded(
            //                         child: Row(
            //                           mainAxisAlignment: MainAxisAlignment.end,
            //                           children: [
            //                             const Text("Mark:40",
            //                                 style: TextStyle(
            //                                   fontSize: 22,
            //                                 )),
            //                           ],
            //                         ))
            //                   ],
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //         Container(
            //           margin: const EdgeInsets.only(
            //             top: 20,
            //           ),
            //           width: MediaQuery.of(context).size.width * .95,
            //           height: MediaQuery.of(context).size.height * .22,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               color: Colors.white),
            //           child: Padding(
            //             padding: EdgeInsets.only(
            //               left: MediaQuery.of(context).size.width * .01,
            //               right: MediaQuery.of(context).size.width * .01,
            //               top: MediaQuery.of(context).size.height * .02,
            //             ),
            //             child: Column(
            //               children: [
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Container(
            //                       width: 250,
            //                     ),
            //                     const Text(
            //                       "SECTION - A",
            //                       style: TextStyle(fontSize: 24),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(
            //                           left: 0.0, right: 0, top: 0),
            //                       child: Row(
            //                         children: [
            //                           Container(
            //                             width: 120,
            //                             height: 35,
            //                             decoration: BoxDecoration(
            //                                 borderRadius:
            //                                 BorderRadius.circular(8),
            //                                 border: Border.all(
            //                                     color:
            //                                     const Color(0xffAEAEAE))),
            //                             child: Center(
            //                               child: Text(
            //                                 "Refresh",
            //                                 style: TextStyle(
            //                                     color: Colors.grey.shade700,
            //                                     fontSize: 18),
            //                               ),
            //                             ),
            //                           ),
            //                           const SizedBox(
            //                             width: 20,
            //                           ),
            //                           Container(
            //                             width: 120,
            //                             height: 35,
            //                             decoration: BoxDecoration(
            //                                 borderRadius:
            //                                 BorderRadius.circular(8),
            //                                 border: Border.all(
            //                                     color:
            //                                     const Color(0xffAEAEAE))),
            //                             child: Center(
            //                               child: Text(
            //                                 "Shuffle",
            //                                 style: TextStyle(
            //                                     color: Colors.grey.shade700,
            //                                     fontSize: 18),
            //                               ),
            //                             ),
            //                           )
            //                         ],
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   height: MediaQuery.of(context).size.height * .06,
            //                 ),
            //                 Container(
            //                   width: MediaQuery.of(context).size.width * .4,
            //                   height: 70,
            //                   decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(10),
            //                       border: Border.all(
            //                           color: const Color(0xffAEAEAE))),
            //                   child: Center(
            //                     child: TextFormField(
            //                       textAlign: TextAlign.center,
            //                       style: const TextStyle(
            //                         color: Color(0xff5668A1),
            //                         fontSize: 22,
            //                       ),
            //                       decoration: InputDecoration(
            //                         hintText:
            //                         "Answer the Four question. Each questions carries 1 mark",
            //                         hintStyle:
            //                         const TextStyle(color: Colors.black),
            //
            //                         // contentPadding: const EdgeInsets.symmetric(
            //                         //     vertical: 0.0, horizontal: 10.0),
            //
            //                         //fillColor: Colors.white,
            //                         focusedBorder: OutlineInputBorder(
            //                           borderRadius: BorderRadius.circular(5.0),
            //                           borderSide: const BorderSide(
            //                             color: Colors.white,
            //                           ),
            //                         ),
            //                         enabledBorder: OutlineInputBorder(
            //                           borderRadius: BorderRadius.circular(5.0),
            //                           borderSide: const BorderSide(
            //                             color: Colors.white,
            //                             width: 0.0,
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //         ),
            //         Container(
            //           margin: const EdgeInsets.only(
            //             top: 20,
            //           ),
            //           width: MediaQuery.of(context).size.width * .95,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               color: Colors.white),
            //           child: Row(
            //             children: [
            //               Container(
            //                 width: 100,
            //                 color: Colors.green,
            //                 child: Center(child: Text("1")),
            //               ),
            //               Text("Hardwere refers to..."),
            //               Row(children: [
            //                 Container(width:100,height: 35,color: Colors.grey, child: Center(child: Text("Edit")),),
            //                 Container(width:100,height: 35,color: Colors.grey,child: Center(child: Text("Replace")),)
            //               ],)
            //             ],
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // )
          ],
        ));
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
}
