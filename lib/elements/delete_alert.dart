import 'package:enumresponsive/controller/home_controller.dart';
import 'package:flutter/material.dart';

import '../model/question_paper.dart';

class DeleteAlert extends StatefulWidget {
  final HomeController controller;
  const DeleteAlert({
    Key? key,
     required this.controller,
  }) : super(key: key);

  @override
  _DeleteAlert createState() => _DeleteAlert();
}

int index = 0;
late HomeController _con;

class _DeleteAlert extends State<DeleteAlert> {

  @override
  void initState() {
    super.initState();
  
    _con = widget.controller;
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
            width: MediaQuery.of(context).size.width * .4,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(blurRadius: 5, offset: Offset(0, 1)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .03,
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
                      left: MediaQuery.of(context).size.width * .03,
                      right: MediaQuery.of(context).size.width * .04,
                      bottom: MediaQuery.of(context).size.height * .01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Do you want to delete this question paper?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
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
                                  _con.questionPaperList.removeAt(index);
                                  Navigator.of(context).pop();
                                  print("object");
                                });
                              },
                              child: Container(
                                width: 150,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey),
                                child: const Center(
                                    child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                )),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                width: 150,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black),
                                child: const Center(
                                    child: Text(
                                  "No",
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
    );
  }
}
