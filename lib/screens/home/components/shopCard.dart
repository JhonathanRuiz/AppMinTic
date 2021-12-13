import 'package:appmintic/dictionary.dart';
import 'package:appmintic/models/tienda.dart';
import 'package:appmintic/screens/shop/details_screen.dart';
import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  final Tienda tienda;
  final VoidCallback press;
  const ShopCard({
    Key? key,
    required this.tienda,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            borderOnForeground: false,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                              tienda: tienda,
                            )));
              },
              child: SizedBox(
                width: 250,
                height: 160,
                child: Stack(children: <Widget>[
                  Positioned.fill(
                      child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(tienda.imagen),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.8),
                              BlendMode.softLight),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                  )),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(paddingInk),
                      child: Column(
                        children: [
                          Text(
                            tienda.nombre,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
