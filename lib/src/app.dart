// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:survey/src/pages/login_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Stima",
      theme: ThemeData(primaryColor: Colors.blue[400], fontFamily: 'Open Sans'),
      home: LoginPage(),
    );
  }
}
