import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class QuiPourrait extends StatefulWidget {
  final Function(int, String, int) onChangedStep;
  final List<String> question;
  final int compteur;
  const QuiPourrait(
      {super.key,
      required this.onChangedStep,
      required this.question,
      required this.compteur});

  @override
  State<QuiPourrait> createState() => _QuiPourraitState();
}

class _QuiPourraitState extends State<QuiPourrait> {
  String answer = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () =>
                  (widget.onChangedStep(0, answer, widget.compteur)),
            ),
            backgroundColor: Colors.yellow[400],
            title: const Center(child: Text("Qui pourrait : ")),
            elevation: 0,
          ),
          body: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
            return Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Center(
                    child: Text("Qui Pourrait " +
                        widget.question.elementAt(
                            (Random().nextInt(widget.question.length))))),
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
                                  3, answer = "Pas Cap", widget.compteur + 1),
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
                                  6, answer = "Cap", widget.compteur + 1),
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
