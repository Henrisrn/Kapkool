import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Question extends StatefulWidget {
  final Function(int, String, int) onChangedStep;
  final List<String> question;
  final int compteur;
  final List<String> Nomjoueur;
  const Question(
      {super.key,
      required this.onChangedStep,
      required this.question,
      required this.compteur,
      required this.Nomjoueur});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  String answer = "";
  Widget build(BuildContext context) {
    print(widget.Nomjoueur);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () =>
                  (widget.onChangedStep(0, answer, widget.compteur)),
            ),
            backgroundColor: Colors.yellow[400],
            title: const Center(child: Text("CAP OU PAS CAP")),
            elevation: 0,
          ),
          body: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
            return Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Center(child: Text("  CAP OU PAS CAP  ")),
                SizedBox(height: 50),
                Text(widget.Nomjoueur.elementAt(
                        Random().nextInt(widget.Nomjoueur.length)) +
                    " tu n'as jamais " +
                    widget.question
                        .elementAt((Random().nextInt(widget.question.length)))),
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
                                  6, answer = "Pas Cap", widget.compteur + 1),
                            }),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow,
                            ),
                            child: Text(
                              "Pas Cap".toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors.yellow,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => ({
                              widget.onChangedStep(
                                  3, answer = "Cap", widget.compteur + 1),
                            }),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow),
                            child: Text(
                              "Cap".toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors.yellow,
                              ),
                            ),
                          )
                        ]))
              ],
            );
          })),
    );
  }
}
