import 'package:flutter/material.dart';

class AnimatedGradient extends StatefulWidget {
  @override
  _AnimatedGradientState createState() => _AnimatedGradientState();
}

class _AnimatedGradientState extends State<AnimatedGradient> {
  List<Color> colorList = [
    Colors.blue,
    Colors.blue.shade100,
    Colors.blue.shade500,
    Colors.blue.shade800,
    Color(0xFFEDD2FC),
    Color(0xFFA600FF),
    Color(0xFF806ee3),
    Colors.green,
    Colors.green.shade100,
    Colors.green.shade500,
    Colors.green.shade800,
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.greenAccent;
  Color topColor = Colors.blueAccent;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        start(),
        AnimatedContainer(
          duration: Duration(milliseconds: 800),
          onEnd: () {
            if (mounted) {
              setState(() {
                index = index + 1;
                // animate the color
                bottomColor = colorList[index % colorList.length];
                topColor = colorList[(index + 1) % colorList.length];

                //// animate the alignment
                begin = alignmentList[index % alignmentList.length];
                end = alignmentList[(index + 2) % alignmentList.length];
              });
            }
          },
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: begin,
              end: end,
              colors: [bottomColor, topColor],
            ),
          ),
        ),
      ],
    ));
  }

  Widget start() {
    Future.delayed(const Duration(milliseconds: 0), () {
      if (mounted) {
        setState(() {
          bottomColor = Colors.blue;
        });
      }
    });
    return SizedBox();
  }
}
