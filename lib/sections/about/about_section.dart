import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/default_button.dart';
import '../../constants.dart';
import '../../utils/open_url.dart';
import 'components/about_section_text.dart';
import 'components/about_text_with_sign.dart';
import 'components/experience_card.dart';
import 'package:flutter/foundation.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2,horizontal: MediaQuery.of(context).size.width*0.05),
      // constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                vertical: kDefaultPadding,
                horizontal: MediaQuery.of(context).size.width * 0.05),
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const AboutTextWithSign(),
                    MediaQuery.of(context).size.width > 844
                        ? const ExperienceCard(numOfExp: "3+")
                        : SizedBox(),
                  ],
                ),
                Container(
                  // width: MediaQuery.of(context).size.width * 0.35,
                  constraints:
                      const BoxConstraints(maxWidth: 600, minWidth: 500),
                  width: 300,
                  child: const AboutSectionText(
                    text:
                        'I’m a software engineer specializing in building mobile applications in IOS and Android. I have a solid background in creating complex mobile applications for iPhone and Android. I can work independently and respect a deadline. I feel comfortable working with a good team of developers. I am working for more than 3 years as an application developer. I have developed many applications using REST APIS for many clients. My Expertise is with Android (native) and Flutter. Work over 20 applications and successfully delivered. I have diverse experience working on different types of applications like POS systems, NFC tags, Social Media platforms, Food Delivery, and many more.',
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                    child: MediaQuery.of(context).size.width < 1090
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: listOfStackIcons(context),
                          )
                        : Column(
                            children: listOfStackIcons(context),
                          )
                    //     Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     SizedBox(
                    //       height: MediaQuery.of(context).size.height / 3.5,
                    //       width: 190,
                    //       // width: MediaQuery
                    //       //     .of(context)
                    //       //     .size
                    //       //     .width *0.15,
                    //       child: Lottie.asset('assets/lottie/android.json'),
                    //     ),
                    //     SizedBox(
                    //       height: MediaQuery.of(context).size.height / 3.5,
                    //       width: 190,
                    //       child: const RiveAnimation.asset(
                    //         'assets/rive/flutter_rive.riv',
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    ),
              ],
            ),
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(
          //       vertical: kDefaultPadding,
          //       horizontal: MediaQuery.of(context).size.width * 0.05),
          //   width: MediaQuery.of(context).size.width,
          //   child: Wrap(
          //     // mainAxisSize: MainAxisSize.max,
          //     children: [
          //       SizedBox(
          //         height: MediaQuery.of(context).size.height / 3,
          //         width: MediaQuery.of(context).size.width / 3,
          //         child: const RiveAnimation.asset(
          //           'assets/rive/flutter_rive.riv',
          //         ),
          //       ),
          //       const ExperienceCard(numOfExp: "3+"),
          //       Container(
          //         width: 300,
          //         constraints:
          //             const BoxConstraints(maxWidth: 600, minWidth: 500),
          //         child: const AboutSectionText(
          //           text:
          //               "I have more then 3 years of experience in mobile development. I have developed many applications using REST APIS for many clients. I have experience in Android (native) and Flutter. Work over 20 applications and successfully delivered on time. I have experience with working on different types of applications like POS systems, NFC tags, Social Media Platform, Food Delivery and many more.",
          //         ),
          //       ),
          //       // Spacer(),
          //     ],
          //   ),
          // ),
          const SizedBox(height: kDefaultPadding * 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultButton(
                imageSrc: "assets/images/chat.png",
                text: "Lets Chat!",
                press: () {
                  launchMailClient();
                },
              ),
              SizedBox(width: kDefaultPadding * 1.5),
              DefaultButton(
                imageSrc: "assets/images/download.png",
                text: "Download CV",
                press: () async {
                  String url =
                      'https://drive.google.com/file/d/1lHmZ50-hbugQIFnTQ0r7DsrXhhOMKVdi/view';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    print("test url3");
                    throw 'Could not launch $url';
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> listOfStackIcons(BuildContext context) {
    final isWebMobile = kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android);
    return [
      SizedBox(
        height: MediaQuery.of(context).size.height / 3.5,
        width: 190,
        // width: MediaQuery
        //     .of(context)
        //     .size
        //     .width *0.15,
        child: isWebMobile
            ? Image.asset('assets/images/android.png')
            : Lottie.asset('assets/lottie/android.json'),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 3.5,
        width: 190,
        child: isWebMobile
            ? Image.asset('assets/images/flutter.png')
            : const RiveAnimation.asset(
                'assets/rive/flutter_rive.riv',
              ),
      )
    ];
  }
}
