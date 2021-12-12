import 'package:appmintic/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'upbody.dart';
import '../drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: UpBody(),
      drawer: NavDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0x44000000),
        title: Text('Mi Barrio App'),
      ),
    );
  }
}
