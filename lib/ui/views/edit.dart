import 'dart:developer';

import 'package:enumresponsive/model/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../controller/home_controller.dart';
import '../../model/options_model.dart';
import '../../model/routeargument.dart';

class Edit extends StatefulWidget {
  final RouteArgument? routeArgument;

  const Edit({Key? key, this.routeArgument}) : super(key: key);

  @override
  _Manual createState() => _Manual();
}

class _Manual extends State<Edit> {
  int count = 0;
  String? answer;
  PageController pageController = PageController();
  final List<String> _editList = ["Objective", "True/False", "Others"];
  int selectedstatus = 0;
  late TextEditingController optionController;

  @override
  void initState() {
    log(widget.routeArgument?.control?.toString() ?? "NULLLL");
    _con = widget.routeArgument?.control;
    optionController = TextEditingController();
    _con.getModuleList();
    _con.getQuestionsList();
    _con.getCourseList();
    _con.getQuestionPaperList();
    selectedModule = _con.moduleList.first;
    super.initState();
  }

  late HomeController _con;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    optionController.dispose();

    super.dispose();
  }

  late Modules selectedModule;

  //PageController pageController = PageController();
  bool easySelected = false;
  bool mediumSelected = false;
  bool hardSelected = false;
  bool isChecked = false;
  bool visible = false;

  // int currentModule = -1;

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
              height: MediaQuery.of(context).size.height * .93,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    height: 75,
                    child: const Center(
                        child: Text(
                      "Edit Questions",
                      style: TextStyle(fontSize: 24),
                    )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 75,
                    color: const Color(0xffACACAC),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0, right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            primary: true,
                            itemCount: _editList.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 50,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // print(index);
                                        setState(() {
                                          selectedstatus = index;
                                          pageController.animateToPage(
                                              selectedstatus,
                                              duration: const Duration(
                                                  microseconds: 200),
                                              curve: Curves.bounceInOut);
                                        });

                                        // print(
                                        //     "selectedstatus" + selectedstatus.toString());
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: selectedstatus == index
                                                ? Colors.black
                                                : const Color(0xffD9D9D9),
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Center(
                                            child: Text(
                                          _editList.elementAt(index),
                                          style: TextStyle(
                                              color: selectedstatus == index
                                                  ? Colors.white
                                                  : Colors.black),
                                        )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),

                          // const SizedBox(
                          //   width: 10,
                          // ),
                          // Container(
                          //   width: 100,
                          //   height: 40,
                          //   decoration: BoxDecoration(
                          //       color: const Color(0xffD9D9D9),
                          //       borderRadius: BorderRadius.circular(6)),
                          //   child: const Center(child: Text("True/False")),
                          // ),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          // Container(
                          //   width: 100,
                          //   height: 40,
                          //   decoration: BoxDecoration(
                          //       color: const Color(0xffD9D9D9),
                          //       borderRadius: BorderRadius.circular(6)),
                          //   child: const Center(child: Text("Others")),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .773,
                      child: Column(
                        children: [
                          Expanded(
                            child: PageView(
                                onPageChanged: (index) {
                                  setState(() {
                                    selectedstatus = index;
                                  });
                                },
                                pageSnapping: true,
                                controller: pageController,
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .93,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Add Question",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    width: 75,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: const Center(
                                                        child: Text(
                                                      "Editor",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.white,
                                                ),
                                                child: TextField(
                                                  // inputFormatters: [
                                                  //   LengthLimitingTextInputFormatter(2),
                                                  // ],
                                                  maxLines: 30,
                                                  textAlign: TextAlign.start,
                                                  //  maxLength: 2,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.all(
                                                            30),
                                                    hintText:
                                                        "Write your question...",

                                                    //   counter: Text(""),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0)),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0)),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0)),
                                                    hintStyle: const TextStyle(
                                                      fontSize: 24,
                                                      color: Color(0xffB1BBC6),
                                                    ),
                                                    // fillColor:  Colors.white,
                                                    filled: false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // const SizedBox(
                                        //   height: 30,
                                        // ),
                                        // SizedBox(
                                        //   width:
                                        //   MediaQuery.of(context).size.width *
                                        //       .93,
                                        //   height: ,
                                        //   child: Row(
                                        //     children: [
                                        //       Container(
                                        //         color: Colors.green,
                                        //         child: const Center(
                                        //             child: Text("ans")),
                                        //       ),
                                        //       Container(
                                        //         width: MediaQuery.of(context)
                                        //                 .size
                                        //                 .width *
                                        //             .918,
                                        //         color: Colors.white,
                                        //         child: TextField(
                                        //           // inputFormatters: [
                                        //           //   LengthLimitingTextInputFormatter(2),
                                        //           // ],
                                        //
                                        //           textAlign: TextAlign.start,
                                        //           //  maxLength: 2,
                                        //           decoration: InputDecoration(
                                        //             contentPadding:
                                        //             const EdgeInsets.all(0),
                                        //             hintText:
                                        //             "Write your answers...",
                                        //
                                        //             //   counter: Text(""),
                                        //             focusedBorder:
                                        //             OutlineInputBorder(
                                        //                 borderRadius:
                                        //                 BorderRadius
                                        //                     .circular(15.0),
                                        //                 borderSide:
                                        //                 const BorderSide(
                                        //                     color: Colors
                                        //                         .white,
                                        //                     width: 0)),
                                        //             disabledBorder:
                                        //             OutlineInputBorder(
                                        //                 borderRadius:
                                        //                 BorderRadius
                                        //                     .circular(15.0),
                                        //                 borderSide:
                                        //                 const BorderSide(
                                        //                     color: Colors
                                        //                         .white,
                                        //                     width: 0)),
                                        //             enabledBorder:
                                        //             OutlineInputBorder(
                                        //                 borderRadius:
                                        //                 BorderRadius
                                        //                     .circular(15.0),
                                        //                 borderSide:
                                        //                 const BorderSide(
                                        //                     color: Colors
                                        //                         .white,
                                        //                     width: 0)),
                                        //             hintStyle: const TextStyle(
                                        //               fontSize: 24,
                                        //               color: Color(0xffB1BBC6),
                                        //             ),
                                        //             // fillColor:  Colors.white,
                                        //             filled: true,
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .03,
                                              ),
                                              child: Container(
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: Colors.white,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 30.0,
                                                    right: 30,
                                                  ),
                                                  child: Row(
                                                    children: const [
                                                      Text(
                                                        "Options",
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
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03),
                                          child: Column(
                                            children: [
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: _con
                                                      .optionObjectiveList
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    Options options = _con
                                                        .optionObjectiveList
                                                        .elementAt(index);
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10.0),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.2),
                                                                blurRadius: 5,
                                                                offset:
                                                                    const Offset(
                                                                        0, 1)),
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
                                                                    width: 60,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      color: Color(
                                                                          0xff1C274C),
                                                                      borderRadius: BorderRadius.only(
                                                                          topLeft: Radius.circular(
                                                                              10),
                                                                          bottomLeft:
                                                                              Radius.circular(10)),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.only(top: 20.0),
                                                                          child:
                                                                              Text(
                                                                            index.toString(),
                                                                            style: TextStyle(
                                                                                fontSize: 22,
                                                                                fontWeight: FontWeight.bold,
                                                                                color: Colors.white),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            20.0,
                                                                        bottom:
                                                                            20,
                                                                        left:
                                                                            20),
                                                                    child: Text(
                                                                      _con.optionObjectiveList
                                                                          .elementAt(
                                                                              index)
                                                                          .optionName,
                                                                      style: const TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              22),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 5.0,
                                                                  right: 20,
                                                                ),
                                                                child: Row(
                                                                  children: [

                                                                    const SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          _con.optionObjectiveList
                                                                              .removeAt(index);
                                                                        });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                const Color(0xff000000),
                                                                            borderRadius: BorderRadius.circular(8)),
                                                                        width:
                                                                            55,
                                                                        height:
                                                                            55,
                                                                        child: const Center(
                                                                            child:
                                                                                Icon(Icons.remove_circle_outline_outlined, color: Colors.white)),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                              Container(
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
                                                            width: 60,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: Color(
                                                                  0xff1C274C),
                                                              borderRadius: BorderRadius.only(
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
                                                              children: const [
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 20.0),
                                                                  child: Text(
                                                                    "Ans",
                                                                    style: TextStyle(
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
                                                                    top: 10.0,
                                                                    bottom: 10,
                                                                    left: 20),
                                                            child: SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  .8,
                                                              child: TextField(
                                                                style: TextStyle(fontSize: 22),
                                                                controller:
                                                                    optionController,
                                                                // inputFormatters: [
                                                                //   LengthLimitingTextInputFormatter(2),
                                                                // ],

                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                //  maxLength: 2,
                                                                decoration:
                                                                    InputDecoration(
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .all(0),
                                                                  hintText:
                                                                      "Write your option...",

                                                                  //   counter: Text(""),
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      borderSide: const BorderSide(
                                                                          color: Colors
                                                                              .white,
                                                                          width:
                                                                              0)),
                                                                  disabledBorder: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      borderSide: const BorderSide(
                                                                          color: Colors
                                                                              .white,
                                                                          width:
                                                                              0)),
                                                                  enabledBorder: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      borderSide: const BorderSide(
                                                                          color: Colors
                                                                              .white,
                                                                          width:
                                                                              0)),
                                                                  hintStyle:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        24,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  // fillColor:  Colors.white,
                                                                  filled: false,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 7.0,
                                                          right: 20,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            InkWell(
                                                              child:
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                    color:
                                                                    const Color(0xff939393),
                                                                    borderRadius: BorderRadius.circular(8)),
                                                                width:
                                                                55,
                                                                height:
                                                                55,
                                                                child: const Center(
                                                                    child:
                                                                    Icon(Icons.image, color: Colors.white)),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  _con.optionObjectiveList
                                                                      .add(
                                                                          Options(
                                                                    1,
                                                                    optionController
                                                                        .text,
                                                                  ));
                                                                  optionController.text="";
                                                                });
                                                              },
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: const Color(
                                                                        0xff000000),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8)),
                                                                width: 55,
                                                                height: 55,
                                                                child: const Center(
                                                                    child: Icon(
                                                                        Icons
                                                                            .add,
                                                                        color: Colors
                                                                            .white)),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .93,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Add Explanation",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    width: 75,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: const Center(
                                                        child: Text(
                                                      "Editor",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.white,
                                                ),
                                                child: TextField(
                                                  // inputFormatters: [
                                                  //   LengthLimitingTextInputFormatter(2),
                                                  // ],
                                                  maxLines: 30,
                                                  textAlign: TextAlign.start,
                                                  //  maxLength: 2,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.all(
                                                            30),
                                                    hintText:
                                                        "Write your answers...",

                                                    //   counter: Text(""),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0)),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0)),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0)),
                                                    hintStyle: const TextStyle(
                                                      fontSize: 24,
                                                      color: Color(0xffB1BBC6),
                                                    ),
                                                    // fillColor:  Colors.white,
                                                    filled: false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xff303030),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              width: 120,
                                              height: 35,
                                              child: const Center(
                                                  child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              width: 120,
                                              height: 35,
                                              child: const Center(
                                                  child: Text(
                                                "Add",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .93,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Add Question",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    width: 75,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: const Center(
                                                        child: Text(
                                                      "Editor",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.white,
                                                ),
                                                child: TextField(
                                                  // inputFormatters: [
                                                  //   LengthLimitingTextInputFormatter(2),
                                                  // ],
                                                  maxLines: 30,
                                                  textAlign: TextAlign.start,
                                                  //  maxLength: 2,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.all(
                                                            30),
                                                    hintText:
                                                        "Write your question...",

                                                    //   counter: Text(""),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0)),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0)),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0)),
                                                    hintStyle: const TextStyle(
                                                      fontSize: 24,
                                                      color: Color(0xffB1BBC6),
                                                    ),
                                                    // fillColor:  Colors.white,
                                                    filled: true,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .03,
                                              ),
                                              child: Container(
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: Colors.white,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 30.0,
                                                    right: 30,
                                                  ),
                                                  child: Row(
                                                    children: const [
                                                      Text(
                                                        "Answer",
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
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03),
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
                                                        width: 60,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0xff1C274C),
                                                          borderRadius:
                                                              BorderRadius.only(
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
                                                          children: const [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top:
                                                                          20.0),
                                                              child: Text(
                                                                "Ans",
                                                                style: TextStyle(
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
                                                                  top: 10.0,
                                                                  bottom: 10,
                                                                  left: 20),
                                                          child: Row(
                                                            children:  [
                                                              Container(
                                                                width: MediaQuery.of(context).size.width*.1,

                                                                child: RadioListTile(
                                                                  title: Text("True"),
                                                                  value: "True",
                                                                  groupValue: answer,
                                                                  onChanged: (value){
                                                                    setState(() {
                                                                      answer = value.toString();
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(context).size.width*.2,
                                                              
                                                                child: RadioListTile(
                                                                  title: Text("False"),
                                                                  value: "False",
                                                                  groupValue: answer,
                                                                  onChanged: (value){
                                                                    setState(() {
                                                                      answer = value.toString();
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                              // Icon(Icons.radio),
                                                              // Text(
                                                              //   "True",
                                                              //   style: TextStyle(
                                                              //       color: Colors
                                                              //           .black,
                                                              //       fontSize:
                                                              //           22),
                                                              // ),
                                                              // Icon(Icons.radio),
                                                              // Text(
                                                              //   "False",
                                                              //   style: TextStyle(
                                                              //       color: Colors
                                                              //           .black,
                                                              //       fontSize:
                                                              //           22),
                                                              // )
                                                            ],
                                                          )),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .93,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Add Explanation",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    width: 75,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: const Center(
                                                        child: Text(
                                                      "Editor",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.white,
                                                ),
                                                child: TextField(
                                                  // inputFormatters: [
                                                  //   LengthLimitingTextInputFormatter(2),
                                                  // ],
                                                  maxLines: 30,
                                                  textAlign: TextAlign.start,
                                                  //  maxLength: 2,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.all(
                                                            30),
                                                    hintText:
                                                        "Write your answers...",

                                                    //   counter: Text(""),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0)),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0)),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0)),
                                                    hintStyle: const TextStyle(
                                                      fontSize: 24,
                                                      color: Color(0xffB1BBC6),
                                                    ),
                                                    // fillColor:  Colors.white,
                                                    filled: true,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xff303030),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              width: 120,
                                              height: 35,
                                              child: const Center(
                                                  child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              width: 120,
                                              height: 35,
                                              child: const Center(
                                                  child: Text(
                                                "Add",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .93,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Add Question",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    width: 75,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: const Center(
                                                        child: Text(
                                                      "Editor",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.white,
                                                ),
                                                child: TextField(
                                                  // inputFormatters: [
                                                  //   LengthLimitingTextInputFormatter(2),
                                                  // ],
                                                  maxLines: 30,
                                                  textAlign: TextAlign.start,
                                                  //  maxLength: 2,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.all(
                                                            30),
                                                    hintText:
                                                        "Write your question...",

                                                    //   counter: Text(""),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0)),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0)),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0)),
                                                    hintStyle: const TextStyle(
                                                      fontSize: 24,
                                                      color: Color(0xffB1BBC6),
                                                    ),
                                                    // fillColor:  Colors.white,
                                                    filled: true,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .93,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Add Answer",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    width: 75,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: const Center(
                                                        child: Text(
                                                      "Editor",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.white,
                                                ),
                                                child: TextField(
                                                  // inputFormatters: [
                                                  //   LengthLimitingTextInputFormatter(2),
                                                  // ],
                                                  maxLines: 30,
                                                  textAlign: TextAlign.start,
                                                  //  maxLength: 2,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.all(
                                                            30),
                                                    hintText:
                                                        "Write your answers...",

                                                    //   counter: Text(""),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0)),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0)),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0)),
                                                    hintStyle: const TextStyle(
                                                      fontSize: 24,
                                                      color: Color(0xffB1BBC6),
                                                    ),
                                                    // fillColor:  Colors.white,
                                                    filled: true,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xff303030),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              width: 120,
                                              height: 35,
                                              child: const Center(
                                                  child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              width: 120,
                                              height: 35,
                                              child: const Center(
                                                  child: Text(
                                                "Add",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ));
  }

  questionSelect(index) {
    if (_con.allQuestionList.elementAt(index).isChecked == true) {
      setState(() {
        _con.allQuestionList.elementAt(index).isChecked == false;
      });
    } else {
      setState(() {
        _con.allQuestionList.elementAt(index).isChecked == true;
      });
    }
  }
}
