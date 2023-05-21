import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getClientes() async {
  List clientes = [];
  CollectionReference collectionReference = db.collection('MD_Clientes');

  QuerySnapshot queryCliente = await collectionReference.get();

  queryCliente.docs.forEach((documento) {
    clientes.add(documento.data());
  });
  return clientes;
}

Future<void> addClientes(String name, String apellido, String direccion) async {
  await db.collection("MD_Clientes").add({
    "sNombreCliente": name,
    "sApellidoCliente": apellido,
    "sDireccionCliente": direccion
  });
}

Future<void> editClientes(
    String uid, String name, String apellido, String direccion) async {
  await db.collection("MD_Clientes").doc(uid).set({
    "sNombreCliente": name,
    "sApellidoCliente": apellido,
    "sDireccionCliente": direccion
  });
}

Future<void> deleteClientes(
    String uid, String name, String apellido, String direccion) async {
  await db.collection("MD_Clientes").doc(uid).delete();
}
