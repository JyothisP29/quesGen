import 'package:collection/collection.dart';
import 'package:enumresponsive/elements/hover_widget.dart';
import 'package:enumresponsive/model/modules.dart';
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

class _Manual extends State<Manual> with SingleTickerProviderStateMixin {
  // int count1 = 0;
  int index = 0;
  int sectionStepper = 0;
  int currentSection = 0;
  int? sectionCount = 0;
  late AnimationController animatedController;
  late Animation animation;

  int totaMark = 0;
  List<String> sectionList = ["A", "B", "C", "D"];

  @override
  void initState() {
    animatedController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween<double>(begin: 0, end: 70).animate(animatedController);
    _con = widget.routeArgument?.control;
    int totalMark = widget.routeArgument?.other;
    print(widget.routeArgument?.other);
    // count1 = widget.routeArgument?.other;
    sectionCount = widget.routeArgument?.sectionCount;
    if (widget.routeArgument?.param != null) {
      _con.questionList.addAll(widget.routeArgument!.param);
      _con.manualList.addAll(widget.routeArgument!.param);
    }

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
                      // width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50.0, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProgressStepper(
                              width: _con.manualList.length * 150,
                              height: 45,
                              color: const Color(0xffD9D9D9),
                              progressColor: Colors.black,
                              stepCount: _con.manualList.length,
                              builder: (index) {
                                print(widget.routeArgument?.other);
                                print("current index $index");
                                return index - 1 == sectionStepper
                                    ? ProgressStepWithChevron(
                                        width: 150,
                                        defaultColor: const Color(0xffD9D9D9),
                                        progressColor: Colors.black,
                                        wasCompleted: true,
                                        child: Center(
                                            child: Text(
                                          "Section ${sectionList.elementAt(index - 1)}",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        )),
                                      )
                                    : ProgressStepWithChevron(
                                        width: 150,
                                        defaultColor: const Color(0xffD9D9D9),
                                        progressColor: Colors.black,
                                        wasCompleted: false,
                                        child: Center(
                                            child: Text(
                                          "Section ${sectionList.elementAt(index - 1)}",
                                          style: const TextStyle(
                                              color: Colors.grey),
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
                                    _con.manualList
                                        .elementAt(currentSection)
                                        .total
                                        .toString(),
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
                      Container(
                        color: Colors.black,
                        width: MediaQuery.of(context).size.width * .2,
                        height: MediaQuery.of(context).size.height * .83,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * .03,
                                  right:
                                      MediaQuery.of(context).size.width * .01),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
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
                                    height: MediaQuery.of(context).size.height *
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
                                    height: MediaQuery.of(context).size.height *
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
                                        style: TextStyle(color: Colors.orange),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
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
                                    height: MediaQuery.of(context).size.height *
                                        .02,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .08,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * .03,
                                  right:
                                      MediaQuery.of(context).size.width * .01),
                              child: const Text(
                                "Question Types",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * .03,
                                  right:
                                      MediaQuery.of(context).size.width * .03),
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
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * .03,
                                  right:
                                      MediaQuery.of(context).size.width * .03),
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
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * .03,
                                  right:
                                      MediaQuery.of(context).size.width * .03),
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
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * .03,
                                  right:
                                      MediaQuery.of(context).size.width * .03),
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
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                          ],
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
                                                              : (isHovering
                                                                  ? Colors.grey
                                                                  : const Color(
                                                                      0xffD9D9D9)),
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
                                                                (selectedModule
                                                                        .allQuestionList
                                                                        .length)
                                                                    .toString(),
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
                                                              _con.selectedList
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
                                      itemCount:
                                          selectedModule.allQuestionList.length,
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
                                                      value: _con
                                                          .selectedQuestionList
                                                          .contains(ques.qusId),
                                                      onChanged: (val) {
                                                        setState(() {
                                                          if (val!) {
                                                            _con.selectedQuestionList
                                                                .add(ques
                                                                    .qusId!);
                                                            _con.selectedQuestionList
                                                                        .length ==
                                                                    _con.manualList
                                                                        .elementAt(
                                                                            currentSection)
                                                                        .total
                                                                ? animatedController
                                                                    .forward()
                                                                : animatedController
                                                                    .reverse();
                                                          } else if (!val) {
                                                            _con.selectedQuestionList
                                                                .remove(
                                                                    ques.qusId);
                                                            _con.selectedQuestionList
                                                                        .length ==
                                                                    _con.manualList
                                                                        .elementAt(
                                                                            currentSection)
                                                                        .total
                                                                ? animatedController
                                                                    .forward()
                                                                : animatedController
                                                                    .reverse();
                                                          }
                                                          // if (_con.selectedQuestionList
                                                          //         .length ==
                                                          //     5) {}
                                                          // if (kDebugMode) {
                                                          //   print(_con
                                                          //       .selectedQuestionList
                                                          //       .length);
                                                          // }
                                                          // if (kDebugMode) {
                                                          //   print(widget
                                                          //       .routeArgument
                                                          //       ?.other);
                                                          // }
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    child: AnimatedBuilder(
                                        animation: animation,
                                        builder: (context, wi) {
                                          return Container(
                                            decoration: const BoxDecoration(
                                              color: Color(0xff4D4D4D),
                                            ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .8,
                                            height: animation.value,
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
                                                        _con.selectedQuestionList
                                                            .clear();
                                                        print(_con
                                                            .selectedQuestionList
                                                            .length);
                                                        animatedController
                                                            .reverse();
                                                      });
                                                    },
                                                    child: AnimatedContainer(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: const Color(
                                                                0xffD1D1D1)),
                                                        height: 45,
                                                        width: 135,
                                                        duration:
                                                            const Duration(
                                                                microseconds:
                                                                    1000),
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
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        if (_con.manualList
                                                                    .length -
                                                                1 >
                                                            currentSection) {
                                                          currentSection++;
                                                          sectionStepper++;
                                                        } else {
                                                          processManualSelectedQuestions();
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color:
                                                                Colors.white),
                                                        height: 45,
                                                        width: 135,
                                                        child: const Center(
                                                            child: Text(
                                                          "Next",
                                                          style: TextStyle(
                                                              fontSize: 22),
                                                        ))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }))
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
          ],
        ));
  }

  int totMark() {
    totaMark = widget.routeArgument?.other;
    return totaMark;
  }

  processManualSelectedQuestions() {
    List<Question> listNeeded = <Question>[];
    selectedModule.allQuestionList.forEach((element) {
      if (_con.selectedQuestionList.contains(element.qusId)) {
        print(element.question);
        listNeeded.add(element);
      }
    });
    var groupedQuestions = groupBy(listNeeded, (e) => e.questionType);

    groupedQuestions.forEach((key, value) {
      print("key$key");
      var m =
          _con.manualList.firstWhereOrNull((element) => element.typeId == key);

      if (m != null) {
        print("questionLength${m.typeId}");
        int index = _con.manualList.indexOf(m);
        m.questions.addAll(value);
        _con.manualList[index] = m;
      }
    });
    _con.quesPaper.sections = _con.manualList;
    print("length${_con.manualList.length}");
    _con.selectedQuestionList.clear();
    Navigator.pushNamed(context, "/generatedQuestion",
        arguments: RouteArgument(
            control: _con, param: _con.manualList, other: totMark()));
  }
}
