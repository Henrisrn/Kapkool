import 'package:cloud_firestore/cloud_firestore.dart';

class Commonservice {
  final FirebaseFirestore _auuu = FirebaseFirestore.instance;
  Future<List<String>> get questio async {
    List<String> aa = [];
    await Future.delayed(Duration(seconds: 2));
    DocumentReference res = _auuu.collection("Phrase").doc("C'estun10mais");
    DocumentReference cap = _auuu.collection("Phrase").doc("Cap");
    await FirebaseFirestore.instance.disableNetwork();
    await FirebaseFirestore.instance.enableNetwork();
    aa.add((await res.get()).get("phase1"));
    aa.add((await cap.get()).get("cap"));
    return aa;
  }
}
