import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shaheer_portfolio_new/UI/Home.dart';
import '../Widget/animated_loading_text.dart';
import '../Widget/animated_texts_componenets.dart';
import '../utils/const.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: LOADING_TIME), () {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  Home(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF000515),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedImageContainer(width: 100,height: 100,),
            SizedBox(height: 20,),
            AnimatedLoadingText(),
          ],
        ),
      ),
    );
  }
}
