import 'package:appmintic/dictionary.dart';
import 'package:appmintic/models/tienda.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.tienda,
  }) : super(key: key);

  final Tienda tienda;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: paddingInk),
      child: Text(
        tienda.descripcion,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
