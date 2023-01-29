import 'package:flutter/material.dart';
import 'package:flutter_animations/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animations',
      theme: ThemeData(
   
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomeScreen(),
    );
  }
}

