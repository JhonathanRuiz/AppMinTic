import 'package:appmintic/screens/Usuarios/Login.dart';
import 'package:appmintic/screens/Usuarios/ModificarUsuario.dart';
import 'package:appmintic/screens/home/home.dart';
import 'package:appmintic/screens/shop/shopsTotal.dart';
import 'package:flutter/material.dart';

import 'Usuarios/RegistroUser.dart';

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
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Iniciar Sesion'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()))
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Registrarte'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegistroUser()))
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Modificar Perfil'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ModificarUsuario()))
            },
          ),
          /*  ListTile(
            leading: Icon(Icons.shop),
            title: Text('Loguearse'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginPage()))
            },
          ), */
        ],
      ),
    );
  }
}
