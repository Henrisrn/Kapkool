import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kapkool/DBConnection.dart';

class Cestun10 extends StatefulWidget {
  final Function(int) onChangedStep;
  List<String> Nomjoueur;
  final List<String> quest;
  Cestun10(
      {super.key,
      required this.onChangedStep,
      required this.quest,
      required this.Nomjoueur});

  @override
  State<Cestun10> createState() => _Cestun10State();
}

class _Cestun10State extends State<Cestun10> {
  @override
  String res = "";
  Widget build(BuildContext context) {
    if (widget.quest.length == 0) {
      return widget.onChangedStep((Random().nextInt(5) + 1));
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
                  onPressed: () => (widget.onChangedStep(0)),
                ),
                backgroundColor: Colors.yellow[400],
                title: const Center(child: Text("  C'est un 10 mais : ")),
                elevation: 0,
              ),
              body: OrientationBuilder(
                  builder: (BuildContext context, Orientation orientation) {
                return Column(children: [
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                      child: Text(widget.Nomjoueur.elementAt(
                              Random().nextInt(widget.Nomjoueur.length)) +
                          " C'est un 10 MAIS ")),
                  SizedBox(height: 50),
                  Text(widget.quest
                      .elementAt((Random().nextInt(widget.quest.length)))),
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
                                (Random().nextInt(5) + 1),
                              ),
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
                              widget.onChangedStep(6),
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
                ]);
              })));
    }
  }
}
