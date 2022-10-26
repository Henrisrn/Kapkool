import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Actionnio extends StatefulWidget {
  final Function(int) onChangedStep;
  List<String> question;
  Actionnio({super.key, required this.onChangedStep, required this.question});

  @override
  State<Actionnio> createState() => _ActionnioState();
}

class _ActionnioState extends State<Actionnio> {
  @override
  Widget build(BuildContext context) {
    if (widget.question.length == 0) {
      return widget.onChangedStep((Random().nextInt(5) + 1));
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
                onPressed: () => (widget.onChangedStep(5)),
              ),
              backgroundColor: Colors.yellow[400],
              title: const Center(child: Text("ACTION")),
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
                    child: Text(text),
                  ),
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
                                widget.onChangedStep((Random().nextInt(5) + 1)),
                              }),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                              ),
                              child: Text(
                                "Tu fais l'action".toUpperCase(),
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
                                "Tu NE fais PAS l'action".toUpperCase(),
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
}
