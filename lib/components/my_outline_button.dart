import 'package:flutter/material.dart';

import '../constants.dart';

class MyOutlineButton extends StatelessWidget {
  const MyOutlineButton({
    Key? key,
    this.imageSrc,
    this.text,
    this.press,
  }) : super(key: key);

  final String? imageSrc, text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: kDefaultPadding,
          horizontal: kDefaultPadding * 2.5,
        ),
        child: GestureDetector(
          onTap: () => press,
          child: Container(
            child: Row(
              children: [
                Image.asset(
                  imageSrc??'',
                  height: 40,
                ),
                SizedBox(width: kDefaultPadding),
                Text(text??'')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
