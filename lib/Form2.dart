import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kapkool/Ajoute.dart';

class Form22 extends StatefulWidget {
  final Function(int) onChangedStep;
  Form22({super.key, required this.onChangedStep});

  @override
  State<Form22> createState() => _Form22State();
}

class _Form22State extends State<Form22> {
  @override
  int counter = 2;
  Ajoute coll = new Ajoute();
  String categorie = "";
  List<String> question = [];
  Color color = Colors.blue;
  Color color1 = Colors.blue;
  Color color2 = Colors.blue;
  Color color3 = Colors.blue;
  Color color4 = Colors.blue;
  Color color5 = Colors.blue;
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => (widget.onChangedStep(0)),
        ),
        backgroundColor: Colors.yellow[400],
        title: const Center(child: Text("  Ajouter une question ")),
        elevation: 0,
      ),
      body: Column(
        children: [
          const Text("Entrer le noms du jeu"),
          ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonHeight: 0,
              buttonMinWidth: 0,
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (color == Colors.red) {
                          color = Colors.blue;
                        }
                        if (color == Colors.blue) {
                          color = Colors.red;
                        }
                      });
                      categorie = "Cestun10mais";
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: color),
                    child: Text("C'est un 10",
                        style: TextStyle(
                          color: Colors.white,
                          backgroundColor: color,
                        ))),
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (color1 == Colors.red) {
                          color1 = Colors.blue;
                        }
                        if (color1 == Colors.blue) {
                          color1 = Colors.red;
                        }
                      });
                      categorie = "Quipourrait";
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: color1),
                    child: Text(
                      "Qui pourrait",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: color1,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (color2 == Colors.red) {
                          color2 = Colors.blue;
                        }
                        if (color2 == Colors.blue) {
                          color2 = Colors.red;
                        }
                      });
                      categorie = "Action";
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: color2),
                    child: Text("Action",
                        style: TextStyle(
                          color: Colors.white,
                          backgroundColor: color2,
                        ))),
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (color3 == Colors.red) {
                          color3 = Colors.blue;
                        }
                        if (color3 == Colors.blue) {
                          color3 = Colors.red;
                        }
                      });
                      categorie = "Verite";
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: color3),
                    child: Text("Verite",
                        style: TextStyle(
                          color: Colors.white,
                          backgroundColor: color3,
                        ))),
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (color4 == Colors.red) {
                          color4 = Colors.blue;
                        }
                        if (color4 == Colors.blue) {
                          color4 = Colors.red;
                        }
                      });
                      categorie = "Jenaijamais";
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: color4),
                    child: Text("Je n'ai jamais",
                        style: TextStyle(
                          color: Colors.white,
                          backgroundColor: color4,
                        ))),
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (color5 == Colors.red) {
                          color5 = Colors.blue;
                        }
                        if (color5 == Colors.blue) {
                          color5 = Colors.red;
                        }
                      });
                      categorie = "Cap";
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: color5),
                    child: Text("Cap",
                        style: TextStyle(
                          color: Colors.white,
                          backgroundColor: color5,
                        )))
              ]),

          const Text("Entrez vos questions à ajouter"),
          const SizedBox(
            height: 10,
          ),
          for (int i = 1; i < counter; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onFieldSubmitted: (value) => question.add(value),
                decoration: InputDecoration(
                  hintText: "Question n°" + i.toString(),
                  border: OutlineInputBorder(
                      gapPadding: 50,
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
            ),
          // displaing the counter
          ButtonBar(alignment: MainAxisAlignment.center, children: [
            TextButton(
              onPressed: () {
                //incrementing counter
                setState(() {
                  counter++;
                });
              },
              child: const Text('+1 question'),
            ),
            TextButton(
              onPressed: () {
                //incrementing counter
                setState(() {
                  counter--;
                });
              },
              child: const Text('-1 question'),
            ),
            TextButton(
              onPressed: () {
                //coll.InjectData(categorie, question);
                print("question : " + question.toString());
                print("Categorie : " + categorie.toString());
                widget.onChangedStep(0);
              },
              child: const Text('Submit'),
            )
          ])
        ],
      ),
    ));
  }
}
