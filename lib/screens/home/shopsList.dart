import 'package:appmintic/funcionality/tiendafuncionality.dart';
import 'package:appmintic/screens/home/components/shopCard.dart';
import 'package:appmintic/screens/shop/details_screen.dart';
import 'package:flutter/material.dart';

import '../../models/tienda.dart';

class Shops extends StatefulWidget {
  @override
  _ShopsState createState() => _ShopsState();
}

class _ShopsState extends State<Shops> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SizedBox(
            height: 200,
            child: FutureBuilder<List>(
                future: getShops(),
                builder: (context, future) {
                  if (!future.hasData) {
                    return const Text("No hay datos");
                  } else {
                    return ListView.builder(
                        itemCount: future.data?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          if (future.data![index].recomendado) {
                            Tienda tienda = Tienda(
                                nombre: future.data![index].nombre,
                                telefono: future.data![index].telefono,
                                imagen: future.data![index].imagen,
                                descripcion: future.data![index].descripcion,
                                website: future.data![index].website,
                                recomendado: future.data![index].recomendado,
                                idTienda: future.data![index].idTienda);
                            return ShopCard(
                                tienda: tienda,
                                press: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsScreen(
                                                tienda: tienda,
                                              )),
                                    ));
                          }
                          return Container();
                        });
                  }
                })));
  }
}
