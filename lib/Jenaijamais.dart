import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Jenaijamais extends StatefulWidget {
  final Function(int, List<String>) onChangedStep;
  List<String> question;
  final List<String> Nomjoueur;
  List<String> questiondejafait;
  Jenaijamais(
      {super.key,
      required this.onChangedStep,
      required this.question,
      required this.Nomjoueur,
      required this.questiondejafait});
  @override
  State<Jenaijamais> createState() => _JenaijamaisState();
}

class _JenaijamaisState extends State<Jenaijamais> {
  String answer = "";
  @override
  Widget build(BuildContext context) {
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
              title: const Center(child: Text("  Je n'ai jamais :")),
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
                            widget.Nomjoueur.elementAt(
                                    Random().nextInt(widget.Nomjoueur.length)) +
                                " tu n'as jamais " +
                                text,
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
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
                                    "J'ai déjà".toUpperCase(),
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
                                    "Je n'ai jamais".toUpperCase(),
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
}
