import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kapkool/Action.dart';
import 'package:kapkool/Actionouverite.dart';
import 'package:kapkool/Cestun10.dart';
import 'package:kapkool/Commonservice.dart';
import 'package:kapkool/DBConnection.dart';
import 'package:kapkool/Home.dart';
import 'package:kapkool/Jenaijamais.dart';
import 'package:kapkool/Question.dart';
import 'package:kapkool/QuiPourrait.dart';
import 'package:kapkool/Roulette.dart';
import 'package:kapkool/Verite.dart';
import 'package:kapkool/classaction.dart';

class Guest extends StatefulWidget {
  Guest({Key? key});
  int compteur = 0;
  List<String> joueur = <String>[];
  @override
  State<Guest> createState() => _GuestState();
}

class _GuestState extends State<Guest> {
  final List<Widget> _widget = [];
  Commonservice commonservice = new Commonservice();
  int index = 0;
  List<String> collec = [
    "Cestun10mais",
    "Action",
    "Verite",
    "Jenaijamais",
    "Quipourrait",
    "Cap"
  ];

  String answer = "";
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    DBConnection coll = new DBConnection(collec);
    coll.dbconnect.then(((question) => setState(() => _widget.addAll([
          Home(
              onChangedStep: (indexx, value) => setState(() {
                    index = indexx;
                    widget.joueur = value;
                    print("Ce que je reçois : " + widget.joueur.toString());
                  })),
          Cestun10(
              compteur: widget.compteur,
              quest: question.elementAt(0),
              onChangedStep: (indexx, res, cpp) => setState(() {
                    index = indexx;
                    answer = res;
                    widget.compteur = cpp + 1;
                  })),
          Question(
              compteur: widget.compteur,
              question: question.elementAt(5),
              onChangedStep: (indexx, answerr, cpp) => setState(() {
                    index = indexx;
                    answer = answerr;
                    widget.compteur = cpp + 1;
                  })),
          QuiPourrait(
              compteur: widget.compteur,
              question: question.elementAt(4),
              onChangedStep: (indexx, answerr, cpp) => setState(() {
                    index = indexx;
                    answer = answerr;
                    widget.compteur = cpp + 1;
                  })),
          Jenaijamais(
              compteur: widget.compteur,
              question: question.elementAt(3),
              onChangedStep: (indexx, answerr, cpp) => setState(() {
                    index = indexx;
                    answer = answerr;
                    widget.compteur = cpp + 1;
                  })),
          Actionouverite(
              compteur: widget.compteur,
              onChangedStep: (indexx, answerr, cpp) => setState(() {
                    index = indexx;
                    answer = answerr;
                    widget.compteur = cpp + 1;
                  })),
          Roulette(
              onChangedStep: (indexx) => setState(() {
                    index = indexx;
                  })),
          Actionnio(
              onChangedStep: (indexx) => setState(() {
                    index = indexx;
                  }),
              question: question.elementAt(1)),
          Verite(
              onChangedStep: (indexx) => setState(() {
                    index = indexx;
                  }),
              question: question.elementAt(2)),
        ]))));
  }

  @override
  Widget build(BuildContext context) {
    widget.compteur++;
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
