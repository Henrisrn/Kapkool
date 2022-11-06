import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class QuiPourrait extends StatefulWidget {
  final Function(int, List<String>) onChangedStep;
  List<String> question;
  final List<String> Nomjoueur;
  List<String> questiondejafait;
  QuiPourrait(
      {super.key,
      required this.onChangedStep,
      required this.question,
      required this.Nomjoueur,
      required this.questiondejafait});

  @override
  State<QuiPourrait> createState() => _QuiPourraitState();
}

class _QuiPourraitState extends State<QuiPourrait> {
  String answer = "";

  @override
  Widget build(BuildContext context) {
    print(widget.Nomjoueur);
    if (widget.question.length == 0) {
      return widget.onChangedStep(
          (Random().nextInt(5) + 1), widget.questiondejafait);
    } else {
      String text =
          widget.question.elementAt((Random().nextInt(widget.question.length)));
      widget.question.removeWhere(
        (element) => element == text,
      );
      return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () =>
                    (widget.onChangedStep(0, widget.questiondejafait)),
              ),
              backgroundColor: Colors.yellow[400],
              title: const Center(
                  child: Text(
                "Qui pourrait : ",
              )),
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
                              child: Text("Qui Pourrait " + text,
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white)))),
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
                                    "Roulette".toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      backgroundColor: Colors.yellow,
                                    ),
                                  ),
                                ),
                              ]))
                    ],
                  ));
            })),
      );
    }
  }
}
