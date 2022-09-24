import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/hireme_card.dart';
import '../../components/section_title.dart';
import '../../constants.dart';
import '../../models/RecentWork.dart';
import 'components/recent_work_card.dart';

class RecentWorkSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding * 6),
      width: double.infinity,
      // just for demo
      // height: 600,
      decoration: BoxDecoration(
        color: Color(0xFFF7E8FF).withOpacity(0.3),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/recent_work_bg.png"),
        ),
      ),
      child: Container(
        child: Column(
          children: [
            Transform.translate(
              offset: const Offset(0, -80),
              child: const HireMeCard(),
            ),
            const SectionTitle(
              title: "Recent Works",
              subTitle: "My recent developed apps",
              color: Color(0xFFFFB100),
            ),
            const SizedBox(height: kDefaultPadding * 1.5),
            Wrap(
              children: List.generate(
                recentWorks.length,
                (index) => Container(
                  margin: const EdgeInsets.all(10),
                  child: RecentWorkCard(
                    index: index,
                    press: () async {
                      try {
                        await launchUrl(Uri.parse(recentWorks[index].url));
                      } catch (e) {
                        print('=----> $e');
                      }
                    },
                  ),
                ),
              ),
            ),

            // Wrap(
            //   spacing: kDefaultPadding,
            //   runSpacing: kDefaultPadding * 2,
            //   children:

            // List.generate(
            //   recentWorks.length,
            //   (index) => RecentWorkCard(
            //     index: index,
            //     press: () async {
            //       try {
            //         await launch('${recentWorks[index].url}');
            //       } catch (e) {
            //         print('=----> $e');
            //       }
            //     },
            //   ),
            // ),
            // ),
            const SizedBox(height: kDefaultPadding * 5),
          ],
        ),
      ),
    );
  }
}
