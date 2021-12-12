import 'package:appmintic/funcionality/tiendafuncionality.dart';
import 'package:appmintic/screens/home/productList.dart';
import 'package:appmintic/screens/home/shopsList.dart';
import 'package:flutter/material.dart';

import '../../dictionary.dart';

class UpBody extends StatelessWidget {
  const UpBody({Key? key}) : super(key: key);

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
            child: const TextField(
              decoration: InputDecoration(
                  labelText: 'Buscar',
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(Icons.search, color: Colors.green),
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
