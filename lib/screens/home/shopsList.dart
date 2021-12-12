import 'package:appmintic/funcionality/tiendafuncionality.dart';
import 'package:appmintic/screens/home/home.dart';
import 'package:appmintic/screens/home/itemCard.dart';
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
                          Tienda tienda = Tienda(
                              nombre: future.data![index].nombre,
                              telefono: future.data![index].telefono,
                              imagen: future.data![index].imagen,
                              descripcion: future.data![index].descripcion,
                              website: future.data![index].website,
                              recomendado: future.data![index].recomendado,
                              idTienda: future.data![index].idTienda);
                          return ItemCard(
                              tienda: tienda,
                              press: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                  ));
                        });
                  }
                })));
  }
}
