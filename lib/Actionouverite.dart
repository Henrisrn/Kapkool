import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Actionouverite extends StatefulWidget {
  final Function(int) onChangedStep;
  List<String> Nomjoueur;
  Actionouverite(
      {super.key, required this.onChangedStep, required this.Nomjoueur});

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
              onPressed: () => (widget.onChangedStep(0)),
            ),
            backgroundColor: Colors.yellow[400],
            title: const Center(child: Text("Action ou verité")),
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
                            child: Text("Action ou verité ",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white)))),
                    SizedBox(height: 50),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            widget.Nomjoueur.elementAt(
                                    Random().nextInt(widget.Nomjoueur.length)) +
                                "  Choisi ACTION ou VERITE",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white))),
                    SizedBox(
                      height: 250,
                    ),
                    Align(
                        alignment: Alignment(100, 0),
                        child: ButtonBar(
                            alignment: MainAxisAlignment.center,
                            overflowDirection: VerticalDirection.down,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () => ({
                                  widget.onChangedStep(7),
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
                                  widget.onChangedStep(8),
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
                ));
          })),
    );
  }
}
