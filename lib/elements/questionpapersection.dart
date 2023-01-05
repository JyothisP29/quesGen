import 'package:enumresponsive/controller/home_controller.dart';
import 'package:enumresponsive/model/question_paper.dart';
import 'package:flutter/material.dart';

import 'delete_alert.dart';
import 'exam_name_alert.dart';
import 'hover_widget.dart';

class QuestionPaperSection extends StatefulWidget {
  final HomeController controller;

  const QuestionPaperSection(
      {Key? key, required this.controller, required this.paper})
      : super(key: key);
  final QuestionPaper paper;

  @override
  State<QuestionPaperSection> createState() => _QuestionPaperSectionState();
}

class _QuestionPaperSectionState extends State<QuestionPaperSection>
    with SingleTickerProviderStateMixin {
  late AnimationController animatedController;
  late Animation animation;
  late HomeController _con;

  @override
  void initState() {
    super.initState();
    animatedController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween<double>(begin: 0, end: 50).animate(animatedController);
    _con = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.paper.qsPaperstatus == 0
            ? showDialog(
                context: context,
                builder: (ctx) => ExamNameAlert(
                      controller: _con,
                    ))
            : Container();
      },
      child: Column(
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return Container(
              height: MediaQuery.of(context).size.height * .3,
              decoration: BoxDecoration(
                  border: widget.paper.qsPaperstatus == 0
                      ? null
                      : Border.all(color: Colors.black),
                  color: widget.paper.qsPaperstatus == 0
                      ? const Color(0xffF4F5F9)
                      : Colors.lime,
                  borderRadius: BorderRadius.circular(10)),
              child: HoverWidget(builder: (isHovering) {
                isHovering
                    ? animatedController.forward()
                    : animatedController.reverse();
                return Stack(
                  children: [
                    widget.paper.qsPaperstatus == 0
                        ? Container()
                        : Positioned(
                            bottom: 0,
                            child: AnimatedBuilder(
                              animation: animation,
                              builder: (c, wi) {
                                // print(
                                //     animation.value);
                                return Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  width: constraints.maxWidth,
                                  height: animation.value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Icon(Icons.copy,
                                            color: Colors.white),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (ctx) =>
                                                    const DeleteAlert(
                                                        // controller: _con,
                                                        ));
                                          },
                                          child: const Icon(Icons.delete,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                    Center(
                        child: widget.paper.qsPaperstatus == 0
                            ? const Icon(
                                Icons.add,
                                size: 125,
                              )
                            : const Text("")),
                  ],
                );
              }),
            );
          }),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              widget.paper.qsPaperstatus == 0
                  ? const Text("")
                  : const Icon(Icons.drive_file_rename_outline),
              const SizedBox(
                width: 5,
              ),
              Text(
                widget.paper.questionPaperName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).textScaleFactor * 18),
              )
            ],
          )
        ],
      ),
    );
  }
}
