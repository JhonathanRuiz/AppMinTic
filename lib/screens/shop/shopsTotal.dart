import 'package:appmintic/dictionary.dart';
import 'package:appmintic/screens/shop/details_screen.dart';
import 'package:flutter/material.dart';

import '../../funcionality/tiendafuncionality.dart';
import '../../models/tienda.dart';
import '../busqueda/shopCard.dart';

class ShopsTotal extends StatelessWidget {
  const ShopsTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///++++++++++++++++++++++++++++
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primary,
        title: const Text('Mi Barrio App'),
      ),
      body: Center(
        child: SizedBox(
            width: double.infinity,
            child: SizedBox(
                child: FutureBuilder<List>(
                    future: getShops(),
                    builder: (context, future) {
                      if (!future.hasData) {
                        return const Text("No hay datos");
                      } else {
                        return ListView.builder(
                            itemCount: future.data?.length,
                            itemBuilder: (BuildContext context, int index) {
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
                                            builder: (context) =>
                                                DetailsScreen(tienda: tienda)),
                                      ));
                            });
                      }
                    }))),
      ),
    );
  }
}
