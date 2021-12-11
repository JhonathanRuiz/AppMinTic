import 'package:appmintic/funcionality/tienda_funcionality.dart';
import 'package:flutter/material.dart';

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
              'Mi Barrio App',
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
      AddShop("fullName", "company", 15)
    ]);
  }
}
