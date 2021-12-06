import 'package:appmintic/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    _goToHome(context);
      return const Scaffold(
          backgroundColor: Color(0xff27ae60),
          body: Center(
            child: Image(image: AssetImage('lib/assets/img/logo.png')),
          ),
      );
  }
  void _goToHome(BuildContext context){
    Future.delayed(Duration(seconds: 1), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return Home();
      }));
    });

  }

}