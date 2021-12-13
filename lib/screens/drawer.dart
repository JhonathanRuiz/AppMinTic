import 'package:appmintic/screens/home/home.dart';
import 'package:appmintic/screens/shop/shopsTotal.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Mi barrio app',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()))
            },
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Tiendas'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShopsTotal()))
            },
          ),
        ],
      ),
    );
  }
}
