import 'package:appmintic/dictionary.dart';
import 'package:appmintic/screens/home/home.dart';
import 'package:flutter/material.dart';

import '../../models/tienda.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Tienda tienda;
  const DetailsScreen({Key? key, required this.tienda}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: primary,
      appBar: buildAppBar(context),
      body: Body(
        tienda: tienda,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primary,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
        SizedBox(width: paddingInk / 2)
      ],
    );
  }
}
