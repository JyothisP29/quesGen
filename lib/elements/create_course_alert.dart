import 'package:flutter/material.dart';

import '../controller/home_controller.dart';
import '../model/course.dart';

class CreateCourse extends StatefulWidget {
  final HomeController controller;

  const CreateCourse({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _CreateCourse createState() => _CreateCourse();
}

class _CreateCourse extends State<CreateCourse> {
  late HomeController _con;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con = widget.controller;
  }

  String? dropdownvalue1;

  var items = [
    'Graduation',
    'Post Graduation',
  ];
  String? dropdownvalue2;

  var items2 = [
    'Calicut University',
    'Kannur University',
  ];
  String? dropdownvalue3;

  var items3 = [
    'B.Sc CS',
    'B.Com CA',
  ];

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
                          "Select a course to create your question paper",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        Row(
                          children: const [
                            Text(
                              "Select a course to continue...",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .059,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, bottom: 5),
                              child: Row(
                                children: const [
                                  Text(
                                    "Course Type",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
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
                                      left: 15.0, right: 10),
                                  child: DropdownButton(
                                    hint: Text(
                                      "Select course type",
                                      style: TextStyle(
                                          color: Colors.grey.shade500),
                                    ),
                                    // Initial Value
                                    value: dropdownvalue1,

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
                                    items: items.map((String items) {
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
                                        dropdownvalue1 = newValue!;
                                      });
                                    },
                                    isExpanded: true,
                                    underline: Container(),
                                    //empty line
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .059,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, bottom: 5),
                              child: Row(
                                children: const [
                                  Text(
                                    "Select University",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
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
                                      left: 15.0, right: 10),
                                  child: DropdownButton(
                                    hint: Text(
                                      "Select course type",
                                      style: TextStyle(
                                          color: Colors.grey.shade500),
                                    ),
                                    // Initial Value
                                    value: dropdownvalue2,

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
                                    items: items2.map((String items) {
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
                                        dropdownvalue2 = newValue!;
                                      });
                                    },
                                    isExpanded: true,
                                    underline: Container(),
                                    //empty line
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .059,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, bottom: 5),
                              child: Row(
                                children: const [
                                  Text(
                                    "Select Course",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
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
                                      left: 15.0, right: 10),
                                  child: DropdownButton(
                                    hint: Text(
                                      "Select course type",
                                      style: TextStyle(
                                          color: Colors.grey.shade500),
                                    ),
                                    // Initial Value
                                    value: dropdownvalue3,

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
                                    items: items3.map((String items) {
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
                                        dropdownvalue3 = newValue!;
                                      });
                                    },
                                    isExpanded: true,
                                    underline: Container(),
                                    //empty line
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .045,
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
                                  setState(() {
                                    _con.courseList.add(Course(
                                        1,
                                        dropdownvalue1,
                                        dropdownvalue2,
                                        dropdownvalue3,
                                        const Color(0xffB9FBC7),
                                        Colors.green));
                                  });
                                  Navigator.pop(context, true);
                                },
                                child: Container(
                                  width: 150,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black),
                                  child: const Center(
                                      child: Text(
                                    "Select",
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
