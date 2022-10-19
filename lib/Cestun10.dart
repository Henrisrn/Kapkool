import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Cestun10 extends StatefulWidget {
  final Function(int, String, int) onChangedStep;
  final int compteur;
  final String quest;
  Cestun10(
      {super.key,
      required this.onChangedStep,
      required this.quest,
      required this.compteur});

  @override
  State<Cestun10> createState() => _Cestun10State();
}

class _Cestun10State extends State<Cestun10> {
  @override
  String res = "";

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () =>
                    (widget.onChangedStep(0, res, widget.compteur)),
              ),
              backgroundColor: Colors.yellow[400],
              title: const Center(child: Text("C'est un 10 mais : ")),
              elevation: 0,
            ),
            body: OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) {
              return Column(children: [
                SizedBox(
                  height: 100,
                ),
                Center(child: Text("C'est un 10 MAIS ")),
                SizedBox(height: 50),
                Text(widget.quest),
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
                                3, res = "Je prends", widget.compteur + 1),
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
                                3, res = "Je prends pas", widget.compteur + 1),
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
