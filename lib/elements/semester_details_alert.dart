import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../controller/home_controller.dart';
import '../model/modules.dart';
import 'automatic_alert.dart';
import 'exam_name_alert.dart';
import 'manual_alert.dart';

class SemesterDetailsAlert extends StatefulWidget {
  final HomeController controller;

  const SemesterDetailsAlert({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _SemesterDetailsAlert createState() => _SemesterDetailsAlert();
}


class _SemesterDetailsAlert extends State<SemesterDetailsAlert>  {
  late HomeController _con;

  @override
  void initState() {

    _con = widget.controller;
    _con.getModuleList();
    super.initState();
  }

  //bool addsub = false;
  String? semester;

  var semesters = [
    'semester 01',
    'semester 02',
  ];
  String? subject;

  var subjects = [
    'subjects 01',
    'subjects 02',
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Select semester, subject & modules for your question paper",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        Text(
                          "Select the modules and subject here and you can even let Clezz to generate questions automatically by selecting",
                          style: TextStyle(fontSize: 22, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RichText(
                          // Controls visual overflow
                          overflow: TextOverflow.clip,

                          // Controls how the text should be aligned horizontally

                          // Control the text direction
                          textDirection: TextDirection.rtl,

                          // Whether the text should break at soft line breaks
                          softWrap: true,

                          // Maximum number of lines for the text to span

                          // The number of font pixels for each logical pixel
                          textScaleFactor: 1,
                          text: const TextSpan(

                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Automatic ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.grey)),
                              TextSpan(
                                  text: 'mode while continuing',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.grey)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .058,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, bottom: 5),
                              child: Row(
                                children: const [
                                  Text(
                                    "Select Semester*",
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
                                      "Select Semester",
                                      style:
                                          TextStyle(color: Colors.grey.shade500),
                                    ),
                                    // Initial Value
                                    value: semester,

                                    // Down Arrow Icon
                                    icon: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(5)),
                                      child: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),

                                    // Array list of items
                                    items: semesters.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Text(
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            items,
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        semester = newValue!;
                                        _con.quesPaper.semester=newValue;
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
                          height: MediaQuery.of(context).size.height * .058,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, bottom: 5),
                              child: Row(
                                children: const [
                                  Text(
                                    "Select Subject*",
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
                                      "Select Subject",
                                      style:
                                          TextStyle(color: Colors.grey.shade500),
                                    ),
                                    // Initial Value
                                    value: subject,

                                    // Down Arrow Icon
                                    icon: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(5)),
                                      child: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),

                                    // Array list of items
                                    items: subjects.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Text(
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            items,
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        subject = newValue!;
                                        _con.quesPaper.subject=newValue;
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
                          height: MediaQuery.of(context).size.height * .058,
                        ),
                        // Column(
                        //   children: [
                        //     Padding(
                        //       padding:
                        //           const EdgeInsets.only(left: 15.0, bottom: 5),
                        //       child: Row(
                        //         children: const [
                        //           Text(
                        //             "Modules*",
                        //             style: TextStyle(
                        //                 color: Colors.black, fontSize: 18),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       height: MediaQuery.of(context).size.height * .01,
                        //     ),
                        //     Row(
                        //       children: [
                        //         InkWell(
                        //             onTap: weekSelect1,
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //
                        //                   //background color of dropdown button
                        //                   border: Border.all(
                        //                       color: Colors.grey.shade500,
                        //                       width: 1),
                        //                   //border of dropdown button
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   //border raiuds of dropdown button
                        //
                        //                   color: select1 == false
                        //                       ? Colors.white
                        //                       : Colors.black),
                        //               width: 110,
                        //               height: 45,
                        //               child: Center(
                        //                 child: Text(
                        //                   "Module 01",
                        //                   style: TextStyle(
                        //                       fontSize: 14,
                        //                       color: select1 == true
                        //                           ? Colors.white
                        //                           : Colors.black),
                        //                 ),
                        //               ),
                        //             )),
                        //         const SizedBox(
                        //           width: 20,
                        //         ),
                        //         InkWell(
                        //             onTap: weekSelect2,
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //
                        //                   //background color of dropdown button
                        //                   border: Border.all(
                        //                       color: Colors.grey.shade500,
                        //                       width: 1),
                        //                   //border of dropdown button
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   //border raiuds of dropdown button
                        //
                        //                   color: select2 == false
                        //                       ? Colors.white
                        //                       : Colors.black),
                        //               width: 110,
                        //               height: 45,
                        //               child: Center(
                        //                 child: Text(
                        //                   "Module 02",
                        //                   style: TextStyle(
                        //                       fontSize: 14,
                        //                       color: select2 == true
                        //                           ? Colors.white
                        //                           : Colors.black),
                        //                 ),
                        //               ),
                        //             )),
                        //         const SizedBox(
                        //           width: 20,
                        //         ),
                        //         InkWell(
                        //             onTap: weekSelect3,
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //
                        //                   //background color of dropdown button
                        //                   border: Border.all(
                        //                       color: Colors.grey.shade500,
                        //                       width: 1),
                        //                   //border of dropdown button
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   //border raiuds of dropdown button
                        //
                        //                   color: select3 == false
                        //                       ? Colors.white
                        //                       : Colors.black),
                        //               width: 110,
                        //               height: 45,
                        //               child: Center(
                        //                 child: Text(
                        //                   "Module 03",
                        //                   style: TextStyle(
                        //                       fontSize: 14,
                        //                       color: select3 == true
                        //                           ? Colors.white
                        //                           : Colors.black),
                        //                 ),
                        //               ),
                        //             )),
                        //         const SizedBox(
                        //           width: 20,
                        //         ),
                        //         InkWell(
                        //             onTap: weekSelect4,
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //
                        //                   //background color of dropdown button
                        //                   border: Border.all(
                        //                       color: Colors.grey.shade500,
                        //                       width: 1),
                        //                   //border of dropdown button
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   //border raiuds of dropdown button
                        //
                        //                   color: select4 == false
                        //                       ? Colors.white
                        //                       : Colors.black),
                        //               width: 110,
                        //               height: 45,
                        //               child: Center(
                        //                 child: Text(
                        //                   "Module 04",
                        //                   style: TextStyle(
                        //                       fontSize: 14,
                        //                       color: select4 == true
                        //                           ? Colors.white
                        //                           : Colors.black),
                        //                 ),
                        //               ),
                        //             )),
                        //         const SizedBox(
                        //           width: 20,
                        //         ),
                        //         InkWell(
                        //             onTap: weekSelect5,
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //
                        //                   //background color of dropdown button
                        //                   border: Border.all(
                        //                       color: Colors.grey.shade500,
                        //                       width: 1),
                        //                   //border of dropdown button
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   //border raiuds of dropdown button
                        //
                        //                   color: select5 == false
                        //                       ? Colors.white
                        //                       : Colors.black),
                        //               width: 110,
                        //               height: 45,
                        //               child: Center(
                        //                 child: Text(
                        //                   "Module 05",
                        //                   style: TextStyle(
                        //                       fontSize: 14,
                        //                       color: select5 == true
                        //                           ? Colors.white
                        //                           : Colors.black),
                        //                 ),
                        //               ),
                        //             )),
                        //         const SizedBox(
                        //           width: 20,
                        //         ),
                        //         InkWell(
                        //             onTap: weekSelect6,
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //
                        //                   //background color of dropdown button
                        //                   border: Border.all(
                        //                       color: Colors.grey.shade500,
                        //                       width: 1),
                        //                   //border of dropdown button
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   //border raiuds of dropdown button
                        //
                        //                   color: select6 == false
                        //                       ? Colors.white
                        //                       : Colors.black),
                        //               width: 110,
                        //               height: 45,
                        //               child: Center(
                        //                 child: Text(
                        //                   "Module 06",
                        //                   style: TextStyle(
                        //                       fontSize: 14,
                        //                       color: select6 == true
                        //                           ? Colors.white
                        //                           : Colors.black),
                        //                 ),
                        //               ),
                        //             )),
                        //         const SizedBox(
                        //           width: 20,
                        //         ),
                        //         InkWell(
                        //             onTap: weekSelect7,
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //
                        //                   //background color of dropdown button
                        //                   border: Border.all(
                        //                       color: Colors.grey.shade500,
                        //                       width: 1),
                        //                   //border of dropdown button
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   //border raiuds of dropdown button
                        //
                        //                   color: select7 == false
                        //                       ? Colors.white
                        //                       : Colors.black),
                        //               width: 100,
                        //               height: 45,
                        //               child: Center(
                        //                 child: Text(
                        //                   "Module 07",
                        //                   style: TextStyle(
                        //                       fontSize: 14,
                        //                       color: select7 == true
                        //                           ? Colors.white
                        //                           : Colors.black),
                        //                 ),
                        //               ),
                        //             )),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        SizedBox(

                          height: 45,
                          child: ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                               itemCount: _con.moduleList.length,
                              itemBuilder: (context, index) {
                                Modules modules =
                                    _con.moduleList.elementAt(index);
                                bool isSelected =
                                    _con.selectedList.contains(modules);
                                return Row(
                                  children:  [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if(
                                          _con.selectedList.contains(modules)

                                          )
                                          {
                                            _con.selectedList.remove(modules);

                                          }
                                         else{
                                           _con.selectedList.add(modules);
                                          }
                                         if (kDebugMode) {
                                           print(_con.selectedList.length);
                                         }
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(

                                            //background color of dropdown button
                                            border: Border.all(
                                                color: Colors.grey.shade500,
                                                width: 1),
                                            //border of dropdown button
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            //border radius of dropdown button

                                            color: isSelected
                                                ? Colors.black
                                                : Colors.white),
                                        width: 110,
                                        height: 45,
                                        child: Center(
                                          child: Text(
                                            _con.moduleList.elementAt(index).modName??"",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: isSelected
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    )
                                  ],
                                );
                              }),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .049,
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
                                      builder: (ctx) => ExamNameAlert(
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
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context, true);
                                      showDialog(
                                          context: context,
                                          builder: (ctx) => ManualAlert(
                                                controller: _con,
                                              ));
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.grey),
                                      child: const Center(
                                          child: Text(
                                        "Manual",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .013,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context, true);
                                      showDialog(
                                          context: context,
                                          builder: (ctx) => AutomaticAlert(
                                                controller: _con,
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
                                        "Automatic",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                    ),
                                  ),
                                ],
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
}
