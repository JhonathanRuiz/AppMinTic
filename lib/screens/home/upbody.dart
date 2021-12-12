import 'package:appmintic/screens/busqueda/buscar.dart';
import 'package:appmintic/screens/home/productList.dart';
import 'package:appmintic/screens/home/shopsList.dart';
import 'package:flutter/material.dart';
import '../../dictionary.dart';

class UpBody extends StatefulWidget {
  const UpBody({Key? key}) : super(key: key);

  @override
  _HomeStart createState() => _HomeStart();
}

class _HomeStart extends State<UpBody> {
  TextEditingController busqueda = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: double.infinity,
        height: 250,
        child: Stack(children: <Widget>[
          Positioned.fill(
              child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/img/hero.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
          )),
          const Center(
            child: Text(
              'Busca tus tiendas',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: busqueda,
              decoration: InputDecoration(
                  labelText: 'Buscar',
                  suffixIcon: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Buscar(busqueda.text)),
                      );
                    },
                    icon: Icon(Icons.search, color: Colors.green),
                  )),
            ),
          )
        ]),
      ),
      Container(
        margin: const EdgeInsets.only(top: paddingInk),
        child: const Text(
          "Tiendas Recomendadas",
          style: TextStyle(fontSize: 30),
        ),
      ),
      Shops(),
      Container(
        margin: const EdgeInsets.only(top: paddingInk),
        child: const Text(
          "Productos Recomendadas",
          style: TextStyle(fontSize: 30),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Products(),
      )
    ]);
  }
}
