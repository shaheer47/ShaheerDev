import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:shaheer_portfolio_new/Widget/CustomText.dart';
import 'package:shaheer_portfolio_new/utils/colors.dart';
import 'dart:ui' as ui;

import '../Widget/common.dart';
import '../utils/calculate_years.dart';
import '../utils/const.dart';

class About extends StatelessWidget {
  bool mobileView=false;

  About(this.mobileView);

  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          Icons.skip_next,
          color: primaryColor.withOpacity(0.6),
          size: 14.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xff717C99),
            letterSpacing: 1.75,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      // height: size.height,
      width:size.width - 100,
      child: Row(
        children: [
          //About me
          Flexible(
            child: Container(
              // height: size.height * 0.9,
              width: size.width,
              child: Column(
                children: [
                  //About me title
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      const NeonText(
                        text: "01.",
                        spreadColor: secondaryColor,
                        blurRadius: 20,
                        fontWeight: FontWeight.w700,
                        textSize: 20.0,
                        textColor: primaryColor,
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      const NeonText(
                        text: "About Myself",
                        spreadColor: secondaryColor,
                        blurRadius: 20,
                        fontWeight: FontWeight.w700,
                        textSize: 26.0,
                        textColor: Colors.white,
                      ),

                      const SizedBox(
                        width: 12.0,
                      ),
                      Container(
                        width: size.width / 4,
                        height: 1.10,
                        decoration: const BoxDecoration(
                            color:secondaryColor,
                            boxShadow: [
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
                  ),

                  SizedBox(
                    height: size.height * 0.07,
                  ),

                  //About me desc
                  Wrap(
                    children: [
                      CustomText(
                        text:
                            "Hello! I'm Shaheer Ahmad Ghori, a Software Engineer.\n\nI’m passionate about crafting mobile experiences, whether it's building innovative applications or solving complex challenges in the digital space. My aim is always to develop solutions that are not only functional but also delightful to use.\n\n",
                        textsize: 16.0,
                        color: const Color(0xff828DAA),
                        letterSpacing: 0.75,
                      ),
                      CustomText(
                        text:
                            "Currently, with over ${calculateYears(DateTime(2019, 1, 1))} years of experience, I specialize in mobile development, particularly with Flutter, working on a diverse range of impactful and exciting projects every day.\n\n",
                        textsize: 16.0,
                        color: const Color(0xff828DAA),
                        letterSpacing: 0.75,
                      ),
                      CustomText(
                        text:
                            "Here are some of the technologies I’ve been working with lately:",
                        textsize: 16.0,
                        color: const Color(0xff828DAA),
                        letterSpacing: 0.75,
                      ),

                    ],
                  ),
                  projectsTree(screenSize: MediaQuery.of(context).size),

                ],
              ),
            ),
          ),

          //Profile Image
          mobileView?const SizedBox():
          Expanded(
            child: Container(
              height: size.height / 1.5,
              width: size.width / 2 - 100,
              // color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Card(
                    color:secondaryColor,
                    child: Container(
                      margin: const EdgeInsets.all(2.75),
                      height: size.height / 2,
                      width: size.width / 5,
                      color: const Color(0xff0A192F),
                    ),
                  ),
                  CustomImageAnimation()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomImageAnimation extends StatefulWidget {
  CustomImageAnimation({Key? key}) : super(key: key);

  @override
  _CustomImageAnimationState createState() => _CustomImageAnimationState();
}

class _CustomImageAnimationState extends State<CustomImageAnimation> {
  Color customImageColor = primaryColor.withOpacity(0.5);
  // ignore: unused_field
  int _enterCounter = 0;
  // ignore: unused_field
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      customImageColor =      primaryColor.withOpacity(0.5);
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      customImageColor = Colors.transparent;
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: _incrementEnter,
      onHover: _updateLocation,
      onExit: _incrementExit,
      child: Stack(
        children: [
          Container(
            height: size.height / 2,
            width: size.width / 5,
            color: Colors.black54,
            child:
            Column(
              children: [
                CachedNetworkImage(imageUrl: My_Photo_PICTURE,),
              ],
            )
          ),
          Container(
            height: size.height / 2,
            width: size.width / 5,
            color: customImageColor,
          ),
        ],
      ),
    );
  }
}
