import 'package:appmintic/screens/home/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _goToHome(context);
    return const Scaffold(
      backgroundColor: Color(0xff27ae60),
      body: Center(
        child: Image(image: AssetImage('assets/img/logo.png')),
      ),
    );
  }

  void _goToHome(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const Home();
      }));
    });
  }
}
