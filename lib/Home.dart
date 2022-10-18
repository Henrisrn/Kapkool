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
  List<String> joueur = <String>[];
  String jj = " ";
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
                            const Text("Entrez vos joueurs"),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              onFieldSubmitted: (value) =>
                                  setState(() => joueur.add(value)),
                              onChanged: (value) =>
                                  setState(() => joueur.add(value)),
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
                                  setState(() => joueur.add(value)),
                              onFieldSubmitted: (value) =>
                                  setState(() => joueur.add(value)),
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
                                  setState(() => joueur.add(value)),
                              onFieldSubmitted: (value) =>
                                  setState(() => joueur.add(value)),
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
                          ]),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () => ({
                          widget.onChangedStep(
                              (Random().nextInt(2) + 1), joueur),
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
