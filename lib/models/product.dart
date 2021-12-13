import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String nombre;
  String precio;
  String imagen;
  String descripcion;
  bool recomendado;
  String idProducto;

  Product(
      {this.nombre = "",
      this.precio = "",
      this.imagen = "",
      this.descripcion = "",
      required this.recomendado,
      this.idProducto = ""});

  factory Product.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Product(
        nombre: data['nombre'],
        precio: data['precio'],
        imagen: data['imagen'],
        descripcion: data['descripcion'],
        recomendado: data['recomendado'],
        idProducto: doc.id);
  }
}
