import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart' show Db, DbCollection;

class Ajoute {
  Ajoute();
  void InjectData(String categorie, List<String> question) async {
    var db = await Db.create(
        "mongodb+srv://test:test@cluster0.pfcsyrs.mongodb.net/Phraseapplication?retryWrites=true&w=majority");
    await db.open();
    inspect(db);
    print("Connected to db");
    var collection = db.collection(categorie);
    int idmax = 0;
    var info = await collection.find().toList();
    for (var i in info) {
      if (i["_id"] > idmax) {
        idmax = i["_id"];
      }
    }
    List<Map<String, dynamic>> envoie = [];
    for (int j = 0; j < question.length; j++) {
      envoie.add({
        '_id': (idmax + j).toString(),
        'phrase': question.elementAt(j).toString()
      });
    }
    await collection.insertMany(envoie);
  }
}
