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
  int rewards = 0;

  List<int> items = [100, 200, 500, 1000, 2000];

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
                onPressed: () => (widget.onChangedStep(1)),
              ),
              backgroundColor: Colors.yellow,
              title: const Center(child: Text("Roulette")),
              elevation: 0,
            ),
            body: Center(
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
                          });
                          print(rewards);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("You just won " +
                                  rewards.toString() +
                                  " Points!"),
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
                          child: Text("SPIN"),
                        ),
                      ),
                    ),
                  ]),
            )
            // config the roulette's appearance her
            ));
  }
}
