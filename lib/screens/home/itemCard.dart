import 'package:appmintic/dictionary.dart';
import 'package:appmintic/models/tienda.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Tienda tienda;
  final VoidCallback press;
  const ItemCard({
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
          Expanded(
            child: Container(
              padding: EdgeInsets.all(paddingInk),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${tienda.idTienda}",
                child: Image.asset(tienda.imagen),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: paddingInk / 4),
            child: Text(
              // products is out demo list
              tienda.nombre,
              style: TextStyle(color: primary),
            ),
          ),
          Text(
            "\$${tienda.descripcion}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
