import 'dart:ui';

import 'package:flutter/material.dart';

import '../../background_animation_utils/AnimatedBackground.dart';
import 'components/logo_blur_box.dart';
import 'components/menu.dart';
import 'components/person_pic.dart';

class TopSection extends StatefulWidget {
  Function onChangeMenu;

  TopSection(this.onChangeMenu);

  @override
  State<TopSection> createState() => _TopSectionState(this.onChangeMenu);
}

class _TopSectionState extends State<TopSection>
    with SingleTickerProviderStateMixin {
  _TopSectionState(Function onChangeMenu);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
      width: double.infinity,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     fit: BoxFit.cover,
      //     image: AssetImage("assets/images/background.png"),
      //   ),
      // ),
      child: Container(
        // margin: EdgeInsets.only(top: kDefaultPadding),
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                width: MediaQuery.of(context).size.width,
                child: AnimatedGradient()

                // Image(
                //   fit: BoxFit.cover,
                //   image: AssetImage("assets/images/background.png"),
                // ),
                ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
            LogoAndBlurBox(size: size),

            // Positioned(
            //   // bottom: 0,
            //   right: 0,
            //   child: Container(
            //     child: Lottie.asset('assets/lottie/person.json',
            //     height: 700),
            //   ),
            // ),
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   child: Menu(widget.onChangeMenu),
            // ),
          ],
        ),
      ),
    );
  }
}
