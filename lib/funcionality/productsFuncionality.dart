import 'package:appmintic/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> getProducts() async {
  List<Product> productList = [];
  CollectionReference tiendas =
      FirebaseFirestore.instance.collection("productos");

  QuerySnapshot tiendasQuery = await tiendas.get();
  if (tiendasQuery.docs.isNotEmpty) {
    for (var doc in tiendasQuery.docs) {
      Product product = Product(
          nombre: doc['nombre'],
          precio: doc['precio'],
          imagen: doc['imagen'],
          descripcion: doc['descripcion'],
          recomendado: doc['recomendada'],
          idTienda: doc['idTienda'],
          idProducto: doc.id);

      productList.add(product);
    }
  }
  return productList;
}
