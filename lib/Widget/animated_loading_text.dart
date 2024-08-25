import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/const.dart';

class AnimatedLoadingText extends StatelessWidget {
  const AnimatedLoadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20 * 5,
      child: TweenAnimationBuilder(duration: const Duration(seconds: LOADING_TIME),builder: (context, value, child) => Column(
        children: [
          LinearProgressIndicator(
            minHeight:8,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            backgroundColor: Colors.black,
            color: primaryColor,
            value: value,
          ),
          const SizedBox(height: 20/2,),
          Text(
            '${(value * 100).toInt()}%',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,shadows: [
            Shadow(color: primaryColor,blurRadius: 10 , offset: Offset(2,2)),
            Shadow(color: secondaryColor,blurRadius: 10 , offset: Offset(-2,-2)),
          ]),)
        ],
      ), tween: Tween(begin: 0.0,end: 1.0),),
    );
  }
}
