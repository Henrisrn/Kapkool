import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kapkool/Ajoute.dart';

class Ajouterquestion extends StatefulWidget {
  //Function(int) onChangedStep;
  Ajouterquestion({super.key});

  @override
  State<Ajouterquestion> createState() => _AjouterquestionState();
}

class _AjouterquestionState extends State<Ajouterquestion> {
  @override
  Widget build(BuildContext context) {
    String categorie = "";
    List<String> question = [];
    Ajoute db = new Ajoute();
    int compteur = 2;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => ( //widget.onChangedStep(0)
              print("On change normalement")),
        ),
        backgroundColor: Colors.yellow[400],
        title: const Center(child: Text("  C'est un 10 mais : ")),
        elevation: 0,
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Column(children: [
            Form(
                child: Column(children: [
              SizedBox(
                height: 10,
              ),
              const Text("Entrez vos questions à ajouter"),
              const SizedBox(
                height: 10,
              ),
              Column(children: [
                Text(compteur.toString()),
                for (int i = 0; i < compteur; i++)
                  TextFormField(
                    onFieldSubmitted: (value) => question.add(value),
                    decoration: InputDecoration(
                      hintText: "Question n°" + i.toString(),
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
                const SizedBox(
                  height: 10,
                ),
                ButtonBar(
                    alignment: MainAxisAlignment.center,
                    overflowDirection: VerticalDirection.down,
                    children: [
                      ElevatedButton(
                        onPressed: () => ({
                          //db.InjectData(categorie, question),
                          //widget.onChangedStep(0),
                        }),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow),
                        child: Text(
                          "Submit".toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.yellow,
                          ),
                        ),
                      )
                    ]),
              ]),
            ])),
            ElevatedButton(
              onPressed: () => ({
                setState(() {
                  compteur++;
                })
              }),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),
              child: Text(
                "Rajouter une question en plus dans le form".toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.yellow,
                ),
              ),
            ),
          ]);
        },
      ),
    ));
  }
}
