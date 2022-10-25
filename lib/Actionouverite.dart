import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Actionouverite extends StatefulWidget {
  final Function(int, String, int) onChangedStep;
  final List<String> Nomjoueur;
  final int compteur;
  const Actionouverite(
      {super.key,
      required this.onChangedStep,
      required this.compteur,
      required this.Nomjoueur});

  @override
  State<Actionouverite> createState() => _ActionouveriteState();
}

class _ActionouveriteState extends State<Actionouverite> {
  String answer = "";
  @override
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
            title: const Center(child: Text("Action ou verité")),
            elevation: 0,
          ),
          body: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
            return Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Center(child: Text("Action ou verité ")),
                SizedBox(height: 50),
                Text("Choisi ACTION ou VERITE"),
                SizedBox(
                  height: 250,
                ),
                Align(
                    alignment: Alignment(100, 0),
                    child: ButtonBar(
                        alignment: MainAxisAlignment.center,
                        overflowDirection: VerticalDirection.down,
                        children: [
                          Text(widget.Nomjoueur.elementAt(
                                  Random().nextInt(widget.Nomjoueur.length)) +
                              " action ou vérité "),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () => ({
                              widget.onChangedStep(
                                  7, answer = "Action", widget.compteur + 1),
                            }),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow,
                            ),
                            child: Text(
                              "Action".toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors.yellow,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => ({
                              widget.onChangedStep(
                                  8, answer = "Vérité", widget.compteur + 1),
                            }),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow),
                            child: Text(
                              "Vérité".toUpperCase(),
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
