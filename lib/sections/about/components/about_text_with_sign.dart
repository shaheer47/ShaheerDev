import 'package:flutter/material.dart';

import '../../../constants.dart';

class AboutTextWithSign extends StatelessWidget {
  const AboutTextWithSign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.only(right: kDefaultPadding ),
      // padding: EdgeInsets.all(kDefaultPadding),
      child: Column(


        children: [
          Text(
            "About Me",
            style: Theme.of(context)
                .textTheme
                .headline2
                ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: kDefaultPadding * 2),
          // Image.asset("assets/images/signature_purple.png",width: 200,height: 200,)
        ],
      ),
    );
  }
}
