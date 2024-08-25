import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';

import '../utils/colors.dart';

class WorkCustomData extends StatelessWidget {
  final String title;
  final String subTitle;
  final String duration;

  const WorkCustomData(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.duration})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        NeonText(
          text: title,
          spreadColor: secondaryColor,
          blurRadius: 20,
          fontWeight: FontWeight.w700,
          textSize: 22.0,
          textColor:  Colors.white,
        ),

        SizedBox(
          height: 6.0,
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          duration,
          style: TextStyle(
            fontSize: 12.0,
            color: Color(0xffCCD6F6).withOpacity(0.5),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
