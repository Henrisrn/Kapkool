//import 'package:flutter/cupertino.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';

class Roulette extends StatefulWidget {
  final Function(int) onChangedStep;
  const Roulette({super.key, required this.onChangedStep});

  @override
  State<Roulette> createState() => _RouletteState();
}

class _RouletteState extends State<Roulette> {
  final selected = BehaviorSubject<int>();
  String rewards = "";
  List<String> items = ["Hello", "World", "C'est", "moi", "le", "Gradk"];
  bool tire = false;
  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () =>
                    (widget.onChangedStep(Random().nextInt(1) + 1)),
              ),
              backgroundColor: Colors.yellow,
              title: const Center(child: Text("Roulette")),
              elevation: 0,
            ),
            body: OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 300,
                      child: FortuneWheel(
                        selected: selected.stream,
                        animateFirst: false,
                        items: [
                          FortuneItem(child: Text("Hello")),
                          FortuneItem(child: Text("Wotld")),
                          FortuneItem(child: Text("C'est")),
                          FortuneItem(child: Text("Moi")),
                          FortuneItem(child: Text("Le")),
                          FortuneItem(child: Text("Grajd")),
                        ],
                        onAnimationEnd: () {
                          setState(() {
                            rewards = items[selected.value];
                            tire = true;
                            print(rewards);
                          });
                          print(rewards);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Tu viens de gagné : " + rewards),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected.add(Fortune.randomInt(0, items.length));
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 120,
                        color: Colors.redAccent,
                        child: Center(
                          child: Text("Spin"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: ElevatedButton(
                          onPressed: tire == false
                              ? null
                              : () => {
                                    (widget.onChangedStep(
                                        (Random().nextInt(2) + 1)))
                                  },
                          child: Text("Next")),
                      padding: EdgeInsets.only(bottom: 0),
                    )
                  ],
                ),
              );
              // config the roulette's appearance her
            })));
  }
}
