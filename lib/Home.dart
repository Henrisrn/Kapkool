import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  final Function(int, List<String>) onChangedStep;

  const Home({
    Key? key,
    required this.onChangedStep,
  }) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> joueur = [];
  String joueur1 = "";
  String joueur3 = "";
  String joueur2 = "";
  String joueur4 = "";
  String joueur5 = "";
  String joueur6 = "";
  String joueur7 = "";
  String joueur8 = "";
  String joueur9 = "";
  String joueur10 = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.yellow[400],
              title: const Center(child: Text("Welcome")),
              elevation: 0,
            ),
            body: OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) {
              return Center(
                  child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            const Text("Entrez vos joueurs"),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              onChanged: (value) =>
                                  setState(() => joueur1 = value),
                              decoration: InputDecoration(
                                hintText: "Joueur n°1",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              //onEditingComplete: (value) => setState(() => joueur.add(value)) ,
                              onChanged: (value) =>
                                  setState(() => joueur2 = value),

                              decoration: InputDecoration(
                                hintText: "Joueur n°2",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              onChanged: (value) =>
                                  setState(() => joueur3 = value),
                              decoration: InputDecoration(
                                hintText: "Joueur n°3",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              //onEditingComplete: (value) => setState(() => joueur.add(value)) ,
                              onChanged: (value) =>
                                  setState(() => joueur4 = value),

                              decoration: InputDecoration(
                                hintText: "Joueur n°4",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              //onEditingComplete: (value) => setState(() => joueur.add(value)) ,
                              onChanged: (value) =>
                                  setState(() => joueur5 = value),

                              decoration: InputDecoration(
                                hintText: "Joueur n°5",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              //onEditingComplete: (value) => setState(() => joueur.add(value)) ,
                              onChanged: (value) =>
                                  setState(() => joueur2 = value),

                              decoration: InputDecoration(
                                hintText: "Joueur n°2",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              //onEditingComplete: (value) => setState(() => joueur.add(value)) ,
                              onChanged: (value) =>
                                  setState(() => joueur6 = value),

                              decoration: InputDecoration(
                                hintText: "Joueur n°6",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              //onEditingComplete: (value) => setState(() => joueur.add(value)) ,
                              onChanged: (value) =>
                                  setState(() => joueur7 = value),

                              decoration: InputDecoration(
                                hintText: "Joueur n°7",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              //onEditingComplete: (value) => setState(() => joueur.add(value)) ,
                              onChanged: (value) =>
                                  setState(() => joueur8 = value),

                              decoration: InputDecoration(
                                hintText: "Joueur n°8",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              //onEditingComplete: (value) => setState(() => joueur.add(value)) ,
                              onChanged: (value) =>
                                  setState(() => joueur9 = value),

                              decoration: InputDecoration(
                                hintText: "Joueur n°9",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              //onEditingComplete: (value) => setState(() => joueur.add(value)) ,
                              onChanged: (value) =>
                                  setState(() => joueur10 = value),

                              decoration: InputDecoration(
                                hintText: "Joueur n°10",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                          ]),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () => ({
                          joueur.add(joueur1),
                          joueur.add(joueur2),
                          joueur.add(joueur3),
                          joueur.add(joueur4),
                          joueur.add(joueur5),
                          joueur.add(joueur6),
                          joueur.add(joueur7),
                          joueur.add(joueur8),
                          joueur.add(joueur9),
                          joueur.add(joueur10),
                          joueur.removeWhere((element) => element.length == 0),
                          widget.onChangedStep(
                              (Random().nextInt(5) + 1), joueur),
                        }),
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            )),
                        child: Center(
                          child: Text(
                            "Continue".toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
            })));
  }
}
