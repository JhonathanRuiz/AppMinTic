import 'package:appmintic/models/product.dart';
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

Future<List> getProducts() async {
  List<Product> productList = [];
  CollectionReference tiendas =
      FirebaseFirestore.instance.collection("tiendas");
  QuerySnapshot tiendasQuery = await tiendas.get();
  if (tiendasQuery.docs.isNotEmpty) {
    for (var doc in tiendasQuery.docs) {
      CollectionReference productos = FirebaseFirestore.instance
          .collection("tiendas")
          .doc(doc.id.toString())
          .collection("productos");
      QuerySnapshot productosQuery = await productos.get();

      if (tiendasQuery.docs.isNotEmpty) {
        for (var doc in productosQuery.docs) {
          Product tienda = Product(
              nombre: doc['nombre'],
              precio: doc['precio'],
              imagen: doc['imagen'],
              recomendado: doc['recomendado'],
              descripcion: doc['descripcion'],
              idProducto: doc.id);

          productList.add(tienda);
        }
      }
    }
  }
  return productList;
}

Future<List> getProductsByTienda(String id) async {
  List<Product> productList = [];
  var collection = FirebaseFirestore.instance.collection('tiendas');
  var docSnapshot = await collection.doc(id).get();
  if (docSnapshot.exists) {
    CollectionReference productos = FirebaseFirestore.instance
        .collection("tiendas")
        .doc(id.toString())
        .collection("productos");
    QuerySnapshot productosQuery = await productos.get();
    for (var doc in productosQuery.docs) {
      Product tienda = Product(
          nombre: doc['nombre'],
          precio: doc['precio'],
          imagen: doc['imagen'],
          recomendado: doc['recomendado'],
          descripcion: doc['descripcion'],
          idProducto: doc.id);

      productList.add(tienda);
    }
  }
  return productList;
}
