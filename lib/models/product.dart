class Product {
  String nombre;
  String precio;
  String imagen;
  String descripcion;
  bool recomendado;
  String idTienda;
  String idProducto;

  Product(
      {required this.nombre,
      required this.precio,
      required this.imagen,
      required this.descripcion,
      required this.recomendado,
      required this.idTienda,
      required this.idProducto});
}
