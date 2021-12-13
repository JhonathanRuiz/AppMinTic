import 'package:appmintic/dictionary.dart';
import 'package:appmintic/models/tienda.dart';
import 'package:appmintic/screens/shop/components/description.dart';
import 'package:appmintic/screens/shop/components/productDetail.dart';
import 'package:appmintic/screens/shop/components/product_title_with_image.dart';
import 'package:flutter/material.dart';

import 'add_to_cart.dart';

class Body extends StatelessWidget {
  final Tienda tienda;
  const Body({Key? key, required this.tienda}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: paddingInk,
                    right: paddingInk,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: paddingInk / 2),
                      Description(tienda: tienda),
                      SizedBox(height: paddingInk / 2),
                      ProductsDetail(
                        id: tienda.idTienda,
                      ),
                      SizedBox(height: paddingInk / 2),
                      AddToCart(tienda: tienda),
                    ],
                  ),
                ),
                ProductTitleWithImage(tienda: tienda)
              ],
            ),
          )
        ],
      ),
    );
  }
}
