import 'package:flutter/material.dart';

import '../constants.dart';
import '../utils/open_url.dart';
import 'default_button.dart';

class HireMeCard extends StatelessWidget {
  const HireMeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      padding: EdgeInsets.all(kDefaultPadding * 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [kDefaultShadow],
      ),
      child: Wrap(
        children: [
          Image.asset(
            "assets/images/email.png",
            height: 80,
            width: 80,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: SizedBox(
              height: 80,
              child: VerticalDivider(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Starting New Project?",
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: kDefaultPadding / 2),
              Text(
                "Get an estimate for the new project",
                style: TextStyle(fontWeight: FontWeight.w200),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(top: 20),
               width: 210,
              child: Center(
                child: DefaultButton(
                  imageSrc: "assets/images/chat.png",
                  text: "Let's Chat!",
                  press: () {

                     launchMailClient();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
