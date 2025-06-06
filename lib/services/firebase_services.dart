import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

/// Obtener todas las marcas
Future<List> getMarcas() async {
  List marcas = [];
  CollectionReference collectionReference = db.collection("marcas");

  QuerySnapshot querySnapshot = await collectionReference.get();
  for (var doc in querySnapshot.docs) {
    final data = doc.data() as Map<String, dynamic>;
    final marca = {
      'uid': doc.id,
      'id_marca': data['id_marca'],
      'nombre': data['nombre'],
      'sucursal': data['sucursal'],
      'correo': data['correo'],
      'telefono': data['telefono'],
      'distribuidores': data['distribuidores'],
      'tipo_producto': data['tipo_producto'],
    };
    marcas.add(marca);
  }

  return marcas;
}


Future<void> addMarca(Map<String, dynamic> data) async {
  await db.collection("marcas").add(data);
}

Future<void> updateMarca(String uid, Map<String, dynamic> data) async {
  await db.collection("marcas").doc(uid).update(data);
}

Future<void> deleteMarca(String uid) async {
  await db.collection("marcas").doc(uid).delete();
}
