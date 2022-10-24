import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Actionn {
  // Get a location using getDatabasesPath
  Future<List<Map>> get questioo async {
    List<Map> list = [];
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    // Delete the database
    //await deleteDatabase(path);

    // open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db
          .execute('CREATE TABLE Action (id INTEGER PRIMARY KEY, phrase TEXT)');
    });

    // Insert some records in a transaction

    /*await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES("some n ame", 1234, 456.789)');
      print('inserted1: $id1');
      int id2 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
          ['another name', 12345678, 3.1416]);
      print('inserted2: $id2');
    });*/
    // Get the records
    list = await database.rawQuery('SELECT * FROM Action');
    return list;
  }
}
