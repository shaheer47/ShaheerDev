import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:potrtfolio/Widget/CustomText.dart';

import '../utils/colors.dart';

class FeatureProject extends StatelessWidget {
  final String? imagePath;
  final String? projectTitle;
  final String? projectDesc;
  final String? tech1;
  final String? tech2;
  final String? tech3;
  final Function? ontabApple;
  final Function? ontabAndroid;

  FeatureProject(
      {this.imagePath,
      this.ontabApple,
      this.ontabAndroid,
      this.projectDesc,
      this.projectTitle,
      this.tech1,
      this.tech2,
      this.tech3});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 0.999,
      width: size.width - 100,
      //color: Colors.tealAccent,
      child: Column(
        children: [
          Container(
            height: size.height - 100,
            width: size.width - 84,
            child: Stack(
              children: [
                //Image
                Positioned(
                  top: size.height * 0.02,
                  left: 20.0,
                  child: Container(
                    height: size.height * 0.60,
                    width: size.width * 0.5,
                    //color: Colors.redAccent,
                    child: Image(
                      fit: BoxFit.contain,
                      image: AssetImage(imagePath ?? ''),
                    ),
                  ),
                ),

                // Short Desc
                Positioned(
                  top: size.height / 6,
                  right: 10.0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        boxShadow: [
                      BoxShadow(
                        color: secondaryColor,
                        offset: Offset(-2, 0),
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        color: secondaryColor,
                        offset: Offset(2, 0),
                        blurRadius: 10,
                      )
                    ]),
                    alignment: Alignment.center,
                    height: size.height * 0.18,
                    width: size.width * 0.35,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomText(
                            text: projectDesc ?? '',
                            textsize: 16.0,
                            color: Colors.white.withOpacity(0.4),
                            letterSpacing: 0.75,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Project Tiitle
                Positioned(
                  top: 16.0,
                  right: 10.0,
                  child: Container(
                    height: size.height * 0.10,
                    width: size.width * 0.25,
                    //color: Colors.indigo,
                    child: Wrap(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      alignment: WrapAlignment.end,
                      children: [
                        NeonText(
                          text: projectTitle ?? '',
                          spreadColor: secondaryColor,
                          blurRadius: 20,
                          fontWeight: FontWeight.w700,
                          textSize: 27.0,
                          textColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),

                // Project Resources
                Positioned(
                  top: size.height * 0.36,
                  right: 10.0,
                  child: Container(
                    height: size.height * 0.08,
                    width: size.width * 0.25,
                    // color: Colors.indigo,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        NeonText(
                          text: tech1 == null ? "" : tech1 ?? '',
                          spreadColor: secondaryColor,
                          blurRadius: 20,
                          fontWeight: FontWeight.w700,
                          textSize: 14.0,
                          textColor: Colors.grey,
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        NeonText(
                          text: tech2 == null ? "" : tech2 ?? '',
                          spreadColor: secondaryColor,
                          blurRadius: 20,
                          fontWeight: FontWeight.w700,
                          textSize: 14.0,
                          textColor: Colors.grey,
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        NeonText(
                          text: tech3 == null ? "" : tech3 ?? '',
                          spreadColor: secondaryColor,
                          blurRadius: 20,
                          fontWeight: FontWeight.w700,
                          textSize: 14.0,
                          textColor: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),

                // Gitub Link
                Positioned(
                  top: size.height * 0.42,
                  right: 10.0,
                  child: Container(
                    height: size.height * 0.08,
                    width: size.width * 0.25,
                    // color: Colors.indigo,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ontabApple!=null?IconButton(
                          icon: FaIcon(FontAwesomeIcons.appStoreIos),
                          color: Colors.white.withOpacity(0.3),
                          onPressed: () => ontabApple == null ? () {} : ontabApple!(),
                        ):SizedBox(),
                        ontabAndroid==null?SizedBox():IconButton(
                          icon: FaIcon(FontAwesomeIcons.android),
                          color: Colors.white.withOpacity(0.3),
                          onPressed: () => ontabAndroid == null ? () {} : ontabAndroid!(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
