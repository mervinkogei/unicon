import 'package:firstsplashscreenview/firstsplashscreenview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unicon/screens/sign.dart';

void main() {  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 3),
        nextPage: const Sign(),
        iconBackgroundColor: Colors.white,
        circleHeight: 200,
        text: const Text(
          "",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Image.asset('images/logo.png', scale: 0.2,),
    ),
    );
  }
}


