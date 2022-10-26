import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Verite extends StatefulWidget {
  final Function(int) onChangedStep;
  final List<String> question;
  const Verite(
      {super.key, required this.onChangedStep, required this.question});

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
              onPressed: () => (widget.onChangedStep(5)),
            ),
            backgroundColor: Colors.yellow[400],
            title: const Center(child: Text("VERITE")),
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
                  child: Text(widget.question
                      .elementAt((Random().nextInt(widget.question.length)))),
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
                              "Flemme de dire la vérité".toUpperCase(),
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
                              "Tu dis la vérité".toUpperCase(),
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
