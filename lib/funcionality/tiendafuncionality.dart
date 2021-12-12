import 'dart:convert';

import 'package:appmintic/models/tienda.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> getShops() async {
  List<Tienda> tiendasList = [];
  CollectionReference tiendas =
      FirebaseFirestore.instance.collection("tiendas");

  QuerySnapshot tiendasQuery = await tiendas.get();
  if (tiendasQuery.docs.isNotEmpty) {
    for (var doc in tiendasQuery.docs) {
      Tienda tienda = Tienda(
          nombre: doc['nombre'],
          telefono: doc['telefono'],
          imagen: doc['imagen'],
          descripcion: doc['descripcion'],
          website: doc['website'],
          recomendado: doc['recomendada'],
          idTienda: doc.id);

      tiendasList.add(tienda);
    }
  }
  return tiendasList;
}
