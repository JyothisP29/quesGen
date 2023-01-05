import 'package:enumresponsive/model/question_paper.dart';
import 'package:enumresponsive/ui/base_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../controller/home_controller.dart';
import '../../elements/create_course_alert.dart';

import '../../elements/hover_widget.dart';
import '../../model/course.dart';
import '../../elements/questionpapersection.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends StateMVC<HomeView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _con.getCourseList();
    _con.getQuestionPaperList();
    selectedCourse = _con.courseList.first;
    super.initState();
  }

  PageController pageController = PageController();
  int selectedCoursePage = 0;

  late HomeController _con;
  late Course selectedCourse;

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
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * .01),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0XFFD9D9D9),
                        child: Column(
                          children: [
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
                                    height: MediaQuery.of(context).size.height *
                                        .02,
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
                                                itemCount:
                                                    _con.courseList.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                separatorBuilder: (c, index) =>
                                                    const SizedBox(
                                                  width: 25,
                                                ),
                                                itemBuilder: (c, index) {
                                                  Course course = _con
                                                      .courseList
                                                      .elementAt(index);
                                                  bool isSelectedCourse =
                                                      selectedCourse == course;
                                                  return HoverWidget(
                                                      builder: (isHovering) {
                                                    return InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedCourse =
                                                              course;
                                                          selectedCoursePage =
                                                              index;
                                                          pageController.animateToPage(
                                                              selectedCoursePage,
                                                              duration:
                                                                  const Duration(
                                                                      microseconds:
                                                                          200),
                                                              curve: Curves
                                                                  .bounceInOut);
                                                        });
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
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
                                                                isSelectedCourse
                                                                    ? 5
                                                                    : 0,
                                                            color: isSelectedCourse
                                                                ? _con
                                                                    .courseList
                                                                    .elementAt(
                                                                        index)
                                                                    .borderColor
                                                                : Colors
                                                                    .transparent,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: _con.courseList
                                                              .elementAt(index)
                                                              .color,
                                                        ),
                                                        height:
                                                            size.height * 0.35,
                                                        width:
                                                            size.width * 0.127,
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
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )
                                                          ],
                                                        )),
                                                      ),
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
                      Expanded(
                        child: SizedBox(
                          // height: MediaQuery.of(context).size.height * .62,
                          width: MediaQuery.of(context).size.width * .7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .07,
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
                                child: PageView(
                                  onPageChanged: (index) {
                                    setState(() {
                                      selectedCoursePage = index;
                                    });
                                  },
                                  pageSnapping: true,
                                  controller: pageController,
                                  children: [
                              GridView.builder(
                                      gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        // mainAxisExtent: 339,
                                          childAspectRatio: 1 / 2,
                                          crossAxisSpacing: 15,
                                          mainAxisSpacing: 15,
                                          crossAxisCount: 4),
                                      itemCount:
                                      _con.questionPaperList.length,
                                      itemBuilder: (context, index) {
                                        QuestionPaper paper =
                                        _con.questionPaperList[index];
                                        return QuestionPaperSection(
                                          controller: _con,
                                          paper: paper,
                                        );
                                      }),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ));
    });
  }
}
