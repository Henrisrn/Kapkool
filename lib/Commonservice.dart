import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class Commonservice {
  final ref = FirebaseDatabase.instance.ref();

  final FirebaseFirestore _auuu = FirebaseFirestore.instance;
  Future<List<String>> get questio async {
    /*final snapshot = await ref.child('Cap/Phrase1').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }

    List<String> aa = [];
    await Future.delayed(Duration(seconds: 2));
    DocumentReference res = _auuu.collection("Phrase").doc("C'estun10mais");
    DocumentReference cap = _auuu.collection("Phrase").doc("Cap");
    await FirebaseFirestore.instance.disableNetwork();
    await FirebaseFirestore.instance.enableNetwork();
    aa.add((await res.get()).get("phase1"));
    aa.add((await cap.get()).get("cap"));*/
    List<String> aa = ["Hello", "World"];
    return aa;
  }
}
