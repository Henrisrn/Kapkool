import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kapkool/DBConnection.dart';

class Tuprefere extends StatefulWidget {
  final Function(int, List<String>) onChangedStep;
  List<String> Nomjoueur;
  final List<String> quest;
  List<String> questiondejafait;
  Tuprefere(
      {super.key,
      required this.onChangedStep,
      required this.quest,
      required this.Nomjoueur,
      required this.questiondejafait});

  @override
  State<Tuprefere> createState() => _TuprefereState();
}

class _TuprefereState extends State<Tuprefere> {
  @override
  String res = "";
  Widget build(BuildContext context) {
    if (widget.quest.length == 0) {
      return widget.onChangedStep(
          (Random().nextInt(6) + 1), widget.questiondejafait);
    } else {
      String text =
          widget.quest.elementAt((Random().nextInt(widget.quest.length)));
      widget.quest.removeWhere(
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
                title: const Center(child: Text("  Tu préfère : ")),
                elevation: 0,
              ),
              body: OrientationBuilder(
                  builder: (BuildContext context, Orientation orientation) {
                return Container(
                    color: Colors.yellow[400],
                    child: Column(children: [
                      SizedBox(
                        height: 100,
                      ),
                      Center(
                          child: Text(
                        widget.Nomjoueur.elementAt(
                                Random().nextInt(widget.Nomjoueur.length)) +
                            " Tu préfère ",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      )),
                      SizedBox(height: 50),
                      Text(text,
                          style: TextStyle(fontSize: 30, color: Colors.white)),
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
                                  widget.questiondejafait.add(text),
                                  widget.onChangedStep(
                                      (Random().nextInt(5) + 1),
                                      widget.questiondejafait),
                                }),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellow,
                                ),
                                child: Text(
                                  "Je prends".toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.yellow,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () => ({
                                  widget.onChangedStep(
                                      6, widget.questiondejafait),
                                }),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow),
                                child: Text(
                                  "Je prends pas".toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.yellow,
                                  ),
                                ),
                              )
                            ]),
                      )
                    ]));
              })));
    }
  }
}
