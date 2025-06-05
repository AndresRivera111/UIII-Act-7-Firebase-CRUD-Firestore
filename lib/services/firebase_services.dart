import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPeople() async {
  List people = [];
  CollectionReference collectionReferencePeople = db.collection("people");

  QuerySnapshot queryPeople = await collectionReferencePeople.get();
  for (var documento in queryPeople.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final person = {
      "name": data["name"],
      "uid": documento.id,
    };
    people.add(person);
  }

  return people;
}

Future<void> addPeople(String name) async {
  await db.collection("people").add({"name": name});
}

Future<void> updatetPeople(String uid, String newName) async {
  await db.collection("people").doc(uid).update({"name": newName});
}

Future<void> deletePeople(String name) async {
  await db.collection("people").doc(name).delete();
}


