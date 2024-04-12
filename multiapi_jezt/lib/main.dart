import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multiapi_jetz/Home%20Screen/home_screen.dart';

Future<void> main() async{
  {
    runApp(const MyApp());}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

