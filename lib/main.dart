import 'package:flutter/material.dart';
import 'package:potrtfolio/UI/Home.dart';

import 'UI/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shaheer Ahmad Ghori',
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
