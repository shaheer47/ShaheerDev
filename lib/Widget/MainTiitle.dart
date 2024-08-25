import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:potrtfolio/Widget/CustomText.dart';

import '../utils/colors.dart';

class MainTiitle extends StatelessWidget {
  final String number, text;
  MainTiitle({required this.number,required this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NeonText(
          text: number,
          spreadColor: secondaryColor,
          blurRadius: 20,
          fontWeight: FontWeight.w700,
          textSize: 20.0,
          textColor: primaryColor,
        ),
        SizedBox(
          width: 12.0,
        ),
        NeonText(
          text:text,
          spreadColor: secondaryColor,
          blurRadius: 20,
          fontWeight: FontWeight.w700,
          textSize: 26.0,
          textColor: Colors.white,
        ),

        SizedBox(
          width: 26.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 0.75,
          decoration: BoxDecoration(
              color:secondaryColor,
              boxShadow: const [
                BoxShadow(
                  color: secondaryColor,
                  offset: Offset(-10, 0),
                  blurRadius: 20,
                ),
                BoxShadow(
                  color: primaryColor,
                  offset: Offset(10, 0),
                  blurRadius: 20,
                )]
          ),
        ),
      ],
    );
  }
}
