import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:shaheer_portfolio_new/Widget/CustomText.dart';

import '../utils/colors.dart';

class FeatureProjectMobile extends StatelessWidget {
  final String? imagePath;
  final String? projectTitle;
  final String? projectDesc;
  final String? tech1;
  final String? tech2;
  final String? tech3;
  final Function? ontabApple;
  final Function? ontabAndroid;

  FeatureProjectMobile(
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
      margin: const EdgeInsets.only(bottom: 30),
      // height: size.height / 0.999,
      width: size.width - 100,
      //color: Colors.tealAccent,
      child: Column(
        children: [
          // Project Title
          NeonText(
            text: projectTitle ?? '',
            spreadColor: secondaryColor,
            blurRadius: 20,
            fontWeight: FontWeight.w700,
            textSize: 27.0,
            textColor: Colors.white,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: size.width * 0.8,
            //color: Colors.redAccent,
            // child: CachedNetworkImage(
            //     fit: BoxFit.contain, imageUrl: (imagePath ?? '')),

            child: Image(
              fit: BoxFit.contain,
              image: AssetImage(imagePath ?? ''),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          // Short Desc
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: secondaryColor,
                    offset: Offset(-10, 0),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: secondaryColor,
                    offset: Offset(10, 0),
                    blurRadius: 10,
                  )
                ]),
            alignment: Alignment.center,
            // height: size.height * 0.18,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomText(
                text: projectDesc ?? '',
                textsize: 16.0,
                color: Colors.white.withOpacity(0.4),
                letterSpacing: 0.75,
              ),
            ),
          ),

          // Project Resources
          Container(
            height: size.height * 0.08,
            width: size.width * 0.25,
            // color: Colors.indigo,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeonText(
                  text: tech1 == null ? "" : tech1 ?? '',
                  spreadColor: secondaryColor,
                  blurRadius: 20,
                  fontWeight: FontWeight.w700,
                  textSize: 14.0,
                  textColor: Colors.grey,
                ),
                const SizedBox(
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
                const SizedBox(
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

          // Gitub Link
          Container(
            height: size.height * 0.08,
            width: size.width * 0.25,
            // color: Colors.indigo,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ontabApple != null
                    ? IconButton(
                        icon: const FaIcon(FontAwesomeIcons.appStoreIos),
                        color: Colors.white.withOpacity(0.3),
                        onPressed: () =>
                            ontabApple == null ? () {} : ontabApple!(),
                      )
                    : const SizedBox(),
                ontabAndroid == null
                    ? const SizedBox()
                    : IconButton(
                        icon: const FaIcon(FontAwesomeIcons.android),
                        color: Colors.white.withOpacity(0.3),
                        onPressed: () =>
                            ontabAndroid == null ? () {} : ontabAndroid!(),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
