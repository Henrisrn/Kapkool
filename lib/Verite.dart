import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Verite extends StatefulWidget {
  final Function(int, List<String>) onChangedStep;
  final List<String> question;
  List<String> questiondejafait;
  Verite(
      {super.key,
      required this.onChangedStep,
      required this.question,
      required this.questiondejafait});

  @override
  State<Verite> createState() => _VeriteState();
}

class _VeriteState extends State<Verite> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () =>
                  (widget.onChangedStep(5, widget.questiondejafait)),
            ),
            backgroundColor: Colors.yellow[400],
            title: const Center(child: Text("VERITE")),
            elevation: 0,
          ),
          body: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
            return Container(
                color: Colors.yellow[400],
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          widget.question.elementAt(
                              (Random().nextInt(widget.question.length))),
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                    )),
                    SizedBox(height: 50),
                    SizedBox(
                      height: 250,
                    ),
                    Align(
                        alignment: Alignment(100, 0),
                        child: ButtonBar(
                            alignment: MainAxisAlignment.center,
                            overflowDirection: VerticalDirection.down,
                            children: [
                              ElevatedButton(
                                onPressed: () => ({
                                  widget.onChangedStep(
                                      6, widget.questiondejafait),
                                }),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellow,
                                ),
                                child: Text(
                                  "Flemme de dire la vérité".toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.yellow,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () => ({
                                  widget.onChangedStep(
                                      (Random().nextInt(5) + 1),
                                      widget.questiondejafait),
                                }),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow),
                                child: Text(
                                  "Tu dis la vérité".toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.yellow,
                                  ),
                                ),
                              )
                            ]))
                  ],
                ));
          })),
    );
  }
}
