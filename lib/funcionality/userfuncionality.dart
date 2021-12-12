import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> getUsers() async {
  CollectionReference tiendas =
      FirebaseFirestore.instance.collection("tiendas");

  QuerySnapshot tiendasQuery = await tiendas.get();
  if (tiendasQuery.docs.isNotEmpty) {
    for (var doc in tiendasQuery.docs) {
      print(doc.data());
    }
  }
}
