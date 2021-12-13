import 'package:appmintic/dictionary.dart';
import 'package:appmintic/models/tienda.dart';
import 'package:flutter/material.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.tienda,
  }) : super(key: key);

  final Tienda tienda;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingInk),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Tienda:",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            tienda.nombre,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: paddingInk),
          Row(
            children: <Widget>[
              SizedBox(width: paddingInk),
              Expanded(
                child: Hero(
                  tag: "",
                  child: Image.network(
                    tienda.imagen,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
