import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kapkool/Actionouverite.dart';
import 'package:kapkool/Cestun10.dart';
import 'package:kapkool/Commonservice.dart';
import 'package:kapkool/DBConnection.dart';
import 'package:kapkool/Home.dart';
import 'package:kapkool/Jenaijamais.dart';
import 'package:kapkool/Question.dart';
import 'package:kapkool/QuiPourrait.dart';
import 'package:kapkool/Roulette.dart';
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

  String answer = "";
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    List<List<String>> ques = [];
    DBConnection cestun10 = new DBConnection("Cestun10mais");
    cestun10.dbconnect.then((value) => print(value));
    DBConnection action = new DBConnection("Action");
    action.dbconnect.then((value) => print(value));
    DBConnection verite = new DBConnection("Verite");
    verite.dbconnect.then((value) => print(value));
    DBConnection jenaijamais = new DBConnection("Jenaijamais");
    jenaijamais.dbconnect.then((value) => print(value));
    DBConnection quipourrait = new DBConnection("Quipourrait");
    quipourrait.dbconnect.then((value) => print(value));
    DBConnection cap = new DBConnection("Cap");
    cap.dbconnect.then((value) => print(value));
    commonservice.questio.then(((question) => setState(() => _widget.addAll([
          Home(
              onChangedStep: (indexx, value) => setState(() {
                    index = indexx;
                    widget.joueur = value;
                    print("Ce que je reçois : " + widget.joueur.toString());
                  })),
          Cestun10(
              compteur: widget.compteur,
              quest: question,
              onChangedStep: (indexx, res, cpp) => setState(() {
                    index = indexx;
                    answer = res;
                    widget.compteur = cpp + 1;
                  })),
          Question(
              compteur: widget.compteur,
              question: question,
              onChangedStep: (indexx, answerr, cpp) => setState(() {
                    index = indexx;
                    answer = answerr;
                    widget.compteur = cpp + 1;
                  })),
          QuiPourrait(
              compteur: widget.compteur,
              question: question,
              onChangedStep: (indexx, answerr, cpp) => setState(() {
                    index = indexx;
                    answer = answerr;
                    widget.compteur = cpp + 1;
                  })),
          Jenaijamais(
              compteur: widget.compteur,
              question: question,
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
