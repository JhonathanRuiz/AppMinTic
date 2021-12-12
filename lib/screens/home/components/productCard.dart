import 'package:appmintic/dictionary.dart';
import 'package:appmintic/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback press;
  const ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(children: [
            Container(
              width: 200,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(paddingInk),
              height: 200,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        // products is out demo list
                        product.nombre,
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "\$${product.precio}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Image(
                        width: 150,
                        height: 120,
                        image: NetworkImage(product.imagen),
                      ),
                    ]),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
