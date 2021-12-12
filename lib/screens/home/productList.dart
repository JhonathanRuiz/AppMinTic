import 'package:appmintic/funcionality/productsFuncionality.dart';
import 'package:appmintic/models/product.dart';
import 'package:appmintic/screens/home/components/productCard.dart';
import 'package:appmintic/screens/home/home.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ShopsState createState() => _ShopsState();
}

class _ShopsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SizedBox(
            height: 200,
            child: FutureBuilder<List>(
                future: getProducts(),
                builder: (context, future) {
                  if (!future.hasData) {
                    return const Text("No hay datos");
                  } else {
                    return ListView.builder(
                        itemCount: future.data?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          if (future.data![index].recomendado) {
                            Product product = Product(
                                nombre: future.data![index].nombre,
                                precio: future.data![index].precio,
                                imagen: future.data![index].imagen,
                                descripcion: future.data![index].descripcion,
                                recomendado: future.data![index].recomendado,
                                idTienda: future.data![index].idTienda,
                                idProducto: future.data![index].idProducto);
                            return ProductCard(
                                product: product,
                                press: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()),
                                    ));
                          }
                          return Container();
                        });
                  }
                })));
  }
}
