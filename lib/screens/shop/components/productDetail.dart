import 'package:appmintic/funcionality/tiendafuncionality.dart';
import 'package:appmintic/models/product.dart';
import 'package:appmintic/screens/home/components/productCard.dart';
import 'package:appmintic/screens/home/home.dart';

import 'package:flutter/material.dart';

import '../../Carrito/Carrito.dart';
import '../../Usuarios/Login.dart';
import '../../Usuarios/Token.dart';

class ProductsDetail extends StatefulWidget {
  final String id;
  const ProductsDetail({Key? key, required this.id}) : super(key: key);

  @override
  _ProductDetail createState() => _ProductDetail();
}

class _ProductDetail extends State<ProductsDetail> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SizedBox(
            height: 200,
            child: FutureBuilder<List>(
                future: getProductsByTienda(widget.id),
                builder: (context, future) {
                  if (!future.hasData) {
                    return const Text("No hay datos");
                  } else {
                    return ListView.builder(
                        itemCount: future.data?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          if (future.data![index].recomendado) {
                            Product tienda = Product(
                                nombre: future.data![index].nombre,
                                precio: future.data![index].precio,
                                imagen: future.data![index].imagen,
                                descripcion: future.data![index].descripcion,
                                recomendado: future.data![index].recomendado,
                                idProducto: future.data![index].idProducto);
                            return ProductCard(
                                product: tienda,
                                press: () async {
                                  Token tk = new Token();
                                  String idUser = await tk.validarToken("");
                                  print(idUser);
                                  if (idUser == "vacio") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Login()));
                                  } else {
                                    Carrito carrito = new Carrito();
                                  }
                                });
                          }
                          return Container();
                        });
                  }
                })));
  }
}
