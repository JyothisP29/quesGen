import 'package:enumresponsive/ui/base_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../controller/home_controller.dart';
import '../../elements/create_course_alert.dart';
import '../../elements/exam_name_alert.dart';
import '../../elements/hover_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends StateMVC<HomeView> {
  @override
  void initState() {
    _con.getCourseList();
    _con.getQuestionPaperList();
    // selectedModule = _con.moduleList.first;
    super.initState();
  }

  // late Modules selectedModule;
  late HomeController _con;

  _HomeViewState() : super(HomeController()) {
    _con = controller as HomeController;
  }

  ScrollController scr = ScrollController();

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(_con.courseList.length);
    }
    Size size = MediaQuery.of(context).size;
    return BaseWidget(builder: (context, sizingInformation) {
      return Scaffold(
          key: _con.scaffoldKey,
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
                    Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * .55,
                          margin: const EdgeInsets.only(
                              left: 0, right: 0, bottom: 10, top: 10),
                          decoration: const BoxDecoration(
                            color: Color(0XFFD9D9D9),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: Color(0xff5668A1),
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: const TextStyle(color: Colors.black),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 10.0),

                              //fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  color: Color(0XFFD9D9D9),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  color: Color(0XFFD9D9D9),
                                  width: 0.0,
                                ),
                              ),
                            ),
                          ),
                        )),
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
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .31,
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0XFFD9D9D9),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Container(
                          //   color: Colors.blue,
                          //   width: MediaQuery.of(context).size.width * .8,
                          //   child: Column(
                          //     children: [
                          //       Row(
                          //         children: const [Text("Your Courses")],
                          //       ),
                          //       SizedBox(
                          //         width: MediaQuery.of(context).size.width * .8,
                          //         height: 100,
                          //         child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           mainAxisSize: MainAxisSize.max,
                          //           children: [
                          //             Container(
                          //               width:
                          //                   MediaQuery.of(context).size.height *
                          //                       .02,
                          //               height:
                          //                   MediaQuery.of(context).size.width *
                          //                       .03,
                          //
                          //               child: const Center(child: Icon(Icons.add)),
                          //               decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                          //             ),
                          //             Expanded(
                          //               child: ListView.builder(
                          //                   scrollDirection: Axis.horizontal,
                          //                   itemCount: 5,
                          //                   itemBuilder: (context, index) {
                          //                     return Row(
                          //                       mainAxisSize: MainAxisSize.max,
                          //                       mainAxisAlignment:
                          //                           MainAxisAlignment.center,
                          //                       children: [
                          //                         Container(
                          //                           width:
                          //                               MediaQuery.of(context)
                          //                                       .size
                          //                                       .width *
                          //                                   .02,
                          //                           height:
                          //                               MediaQuery.of(context)
                          //                                       .size
                          //                                       .height *
                          //                                   .03,
                          //                           color: Colors.white,
                          //                           child: const Center(
                          //                               child: Text("fcyf")),
                          //                         ),
                          //                         const SizedBox(
                          //                           width: 10,
                          //                         )
                          //                       ],
                          //                     );
                          //                   }),
                          //             )
                          //           ],
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          Container(
                            decoration: const BoxDecoration(
                                // color: Colors.yellow.withOpacity(0.34),
                                ),
                            width: size.width * 0.7,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .02,
                                ),
                                const Text(
                                  "Your Courses",
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    HoverWidget(builder: (isHovering) {
                                      return InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (ctx) => CreateCourse(
                                                    controller: _con,
                                                  )).then(
                                              (value) => setState(() {}));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: isHovering
                                                ? Colors.grey
                                                : Colors.white,
                                          ),
                                          height: size.height * 0.14,
                                          width: size.width * 0.127,
                                          child: const Icon(
                                            Icons.add,
                                            size: 65,
                                            color: Colors.black,
                                          ),
                                        ),
                                      );
                                    }),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Scrollbar(
                                          controller: scr,
                                          thumbVisibility: false,
                                          thickness: 5,
                                          child: SizedBox(
                                            height: size.height * 0.14,
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              physics: const ScrollPhysics(),
                                              controller: scr,
                                              itemCount: _con.courseList.length,
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder: (c, index) =>
                                                  const SizedBox(
                                                width: 25,
                                              ),
                                              itemBuilder: (c, index) {
                                                return HoverWidget(
                                                    builder: (isHovering) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: isHovering
                                                              ? Colors.grey
                                                              : Colors
                                                                  .transparent,
                                                          spreadRadius: 3,
                                                          blurRadius: 7,
                                                          offset: const Offset(
                                                              0,
                                                              1), // changes position of shadow
                                                        ),
                                                      ],
                                                      border: Border.all(
                                                        width:
                                                            isHovering ? 2 : 0,
                                                        color: isHovering
                                                            ? _con.courseList
                                                                .elementAt(
                                                                    index)
                                                                .borderColor
                                                            : Colors
                                                                .transparent,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: _con.courseList
                                                          .elementAt(index)
                                                          .color,
                                                    ),
                                                    height: size.height * 0.35,
                                                    width: size.width * 0.127,
                                                    child: Center(
                                                        child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          _con.courseList
                                                                  .elementAt(
                                                                      index)
                                                                  .name ??
                                                              "",
                                                          style: const TextStyle(
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          _con.courseList
                                                                  .elementAt(
                                                                      index)
                                                                  .university ??
                                                              "",
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      ],
                                                    )),
                                                  );
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .06,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .62,
                      width: MediaQuery.of(context).size.width * .7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .07,
                          ),
                          Row(
                            children: const [
                              Text(
                                "Create new question paper",
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: 339,
                                        childAspectRatio: 1 / 2,
                                        crossAxisSpacing: 15,
                                        mainAxisSpacing: 15,
                                        crossAxisCount: 4),
                                itemCount: _con.questionPaperList.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      _con.questionPaperList
                                                  .elementAt(index)
                                                  .qsPaperstatus ==
                                              0
                                          ? showDialog(
                                              context: context,
                                              builder: (ctx) => ExamNameAlert(
                                                    controller: _con,
                                                  ))
                                          : Container();
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 300,
                                          decoration: BoxDecoration(
                                              border: _con.questionPaperList
                                                          .elementAt(index)
                                                          .qsPaperstatus ==
                                                      0
                                                  ? null
                                                  : Border.all(
                                                      color: Colors.black),
                                              color: _con.questionPaperList
                                                          .elementAt(index)
                                                          .qsPaperstatus ==
                                                      0
                                                  ? const Color(0xffF4F5F9)
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: HoverWidget(
                                              builder: (isHovering) {
                                            return Stack(
                                              children: [
                                                isHovering
                                                    ? Visibility(
                                                        visible: true,
                                                        child: _con.questionPaperList
                                                                    .elementAt(
                                                                        index)
                                                                    .qsPaperstatus ==
                                                                0
                                                            ? Container()
                                                            : Positioned(
                                                                bottom: 0,
                                                                child:
                                                                    AnimatedContainer(
                                                                  decoration: const BoxDecoration(
                                                                      color: Colors
                                                                          .grey,
                                                                      borderRadius: BorderRadius.only(
                                                                          bottomLeft: Radius.circular(
                                                                              10),
                                                                          bottomRight:
                                                                              Radius.circular(10))),
                                                                  curve: Curves
                                                                      .linear,
                                                                  duration:
                                                                      const Duration(
                                                                          seconds:
                                                                              1),
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  height: 50,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10.0),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: const [
                                                                        Icon(
                                                                          Icons
                                                                              .edit,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Icon(
                                                                            Icons
                                                                                .copy,
                                                                            color:
                                                                                Colors.white),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Icon(
                                                                            Icons
                                                                                .delete,
                                                                            color:
                                                                                Colors.white)
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )),
                                                      )
                                                    : Visibility(
                                                        visible: false,
                                                        child: Positioned(
                                                            bottom: 0,
                                                            child:
                                                                AnimatedContainer(
                                                              decoration: const BoxDecoration(
                                                                  color: Colors
                                                                      .grey,
                                                                  borderRadius: BorderRadius.only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              10),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              10))),
                                                              curve:
                                                                  Curves.linear,
                                                              duration:
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: 50,
                                                            )),
                                                      ),
                                                Center(
                                                    child: _con.questionPaperList
                                                                .elementAt(
                                                                    index)
                                                                .qsPaperstatus ==
                                                            0
                                                        ? const Icon(
                                                            Icons.add,
                                                            size: 125,
                                                          )
                                                        : const Text("")),
                                              ],
                                            );
                                          }),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            _con.questionPaperList
                                                        .elementAt(index)
                                                        .qsPaperstatus ==
                                                    0
                                                ? const Text("")
                                                : const Icon(Icons
                                                    .drive_file_rename_outline),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              _con.questionPaperList
                                                      .elementAt(index)
                                                      .questionPaperName,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ));
    });
  }
}
