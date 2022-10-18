import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kapkool/Cestun10.dart';
import 'package:kapkool/Commonservice.dart';
import 'package:kapkool/Home.dart';
import 'package:kapkool/Question.dart';
import 'package:kapkool/Roulette.dart';

class Guest extends StatefulWidget {
  const Guest({Key? key});

  @override
  State<Guest> createState() => _GuestState();
}

class _GuestState extends State<Guest> {
  final List<Widget> _widget = [];
  Commonservice commonservice = new Commonservice();
  int index = 0;
  String answer = "";
  List<String> joueur = [];
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    commonservice.term.then(((terms) => setState(() => _widget.addAll([
          Home(
              onChangedStep: (indexx, value) => setState(() {
                    index = indexx;
                    joueur = value;
                    print(joueur);
                  })),
          Cestun10(
              onChangedStep: (indexx, res) => setState(() {
                    index = indexx;
                    answer = res;
                  })),
          Question(
              onChangedStep: (indexx, answerr) => setState(() {
                    index = indexx;
                    answer = answerr;
                  })),
          Roulette(
              onChangedStep: (indexx) => setState(() {
                    index = indexx;
                  })),
        ]))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widget.length == 0
          ? SafeArea(
              child: Scaffold(
              body: Center(child: Text("Loading")),
            ))
          : _widget.elementAt(index),
    );
  }
}
