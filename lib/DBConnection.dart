import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart' show Db, DbCollection;

class DBConnection {
  String aa = "";
  DBConnection(String a) {
    aa = a;
  }
  Future<List<String>> get dbconnect async {
    var db = await Db.create(
        "mongodb+srv://test:test@cluster0.pfcsyrs.mongodb.net/Phraseapplication?retryWrites=true&w=majority");
    await db.open();
    inspect(db);
    print("Connected to db");

    var collection = db.collection(aa);
    List<String> sortie = [];

    var information = await collection.find().toList();
    for (var i in information) {
      sortie.add(i["phrase"]);
    }

    /*
    await collection.insertMany([
      {'_id': '1', 'phrase': "fait une tier liste des gens présent"},
      {
        '_id': '2',
        'phrase': "As tu déjà à la prostitution (client ou travailleur)"
      },
      {'_id': '3', 'phrase': "Qui est la personne la plus attirante"},
      {
        '_id': '4',
        'phrase':
            "As tu déjà essayé de draguer un membre de la famille de un de tes potes"
      },
      {'_id': '5', 'phrase': "Dit les pires moments avec ton premier crush"},
      {'_id': '6', 'phrase': "As tu déjà acheter des sextoys, si oui lesquels"},
      {'_id': '7', 'phrase': "Donne ta catégorie porno préf"},
      {'_id': '8', 'phrase': "Pour combien tu te ferais enculer"},
      {'_id': '9', 'phrase': "Dit ta pire expérience au lit"},
      {'_id': '10', 'phrase': "Qui est le plus baisable dans la salle"},
      {
        '_id': '12',
        'phrase': "D'échanger de vêtements avec la personne de ton choix"
      },
      {'_id': '13', 'phrase': "Rajoute 2 shots dans ton verres"},
      {'_id': '14', 'phrase': "Pris de rateau"},
      {'_id': '15', 'phrase': "Aller dans un sex shop"},
    ]);*/
    // Fluent way

    // or Standard way
    await db.close();
    return sortie;
  }
}
