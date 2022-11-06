import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kapkool/Action.dart';
import 'package:kapkool/Actionouverite.dart';
import 'package:kapkool/Ajouterunequestion.dart';
import 'package:kapkool/Cestun10.dart';
import 'package:kapkool/DBConnection.dart';
import 'package:kapkool/Form2.dart';
import 'package:kapkool/Home.dart';
import 'package:kapkool/Jenaijamais.dart';
import 'package:kapkool/Partiefini.dart';
import 'package:kapkool/Question.dart';
import 'package:kapkool/QuiPourrait.dart';
import 'package:kapkool/Roulette.dart';
import 'package:kapkool/Verite.dart';

class Guest extends StatefulWidget {
  Guest({Key? key});
  int compteur = 0;

  @override
  State<Guest> createState() => _GuestState();
}

class _GuestState extends State<Guest> {
  final List<Widget> _widget = [];
  int index = 0;
  List<String> collec = [
    "Cestun10mais",
    "Action",
    "Verite",
    "Jenaijamais",
    "Quipourrait",
    "Cap"
  ];
  String sortie = "";
  List<String> joueur = [];
  String answer = "";
  bool Partiefinie(List<List<String>> lis) {
    bool res = false;
    for (List<String> i in lis) {
      if (i.length == 0) {
        res = true;
      }
    }
    return res;
  }

  List<String> questiondejafaite = [];
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    DBConnection coll = new DBConnection(collec);
    coll.dbconnect.then(((question) => setState(() {
          print(question);
          _widget.addAll([
            Partiefinie(question)
                ? PartieFinie()
                : Home(
                    onChangedStep: (indexx, value) => setState(() {
                          index = indexx;
                          for (String i in value) {
                            joueur.add((i + "  "));
                          }
                        })),
            Cestun10(
                questiondejafait: questiondejafaite,
                Nomjoueur: joueur,
                quest: question.elementAt(0),
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                    })),
            Question(
                questiondejafait: questiondejafaite,
                Nomjoueur: joueur,
                question: question.elementAt(5),
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                    })),
            QuiPourrait(
                questiondejafait: questiondejafaite,
                Nomjoueur: joueur,
                question: question.elementAt(4),
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                    })),
            Jenaijamais(
                questiondejafait: questiondejafaite,
                Nomjoueur: joueur,
                question: question.elementAt(3),
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                    })),
            Actionouverite(
                Nomjoueur: joueur,
                onChangedStep: (indexx) => setState(() {
                      index = indexx;
                    })),
            Roulette(
                onChangedStep: (indexx) => setState(() {
                      index = indexx;
                    })),
            Actionnio(
                questiondejafait: questiondejafaite,
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                    }),
                question: question.elementAt(1)),
            Verite(
                questiondejafait: questiondejafaite,
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                    }),
                question: question.elementAt(2)),
            Form22(
                onChangedStep: (indexx) => setState(() {
                      index = indexx;
                    }))
          ]);
        })));
  }

  @override
  Widget build(BuildContext context) {
    widget.compteur++;
    return Container(
      child: _widget.length == 0
          ? SafeArea(
              child: Scaffold(
              body: Center(
                  child: Text("Loading", style: TextStyle(fontSize: 30))),
            ))
          : _widget.elementAt(index),
    );
  }
}
