import 'package:flutter/material.dart';

import '../constants.dart';

class DefaultButton extends StatefulWidget {
  const DefaultButton({
    Key? key,
    this.imageSrc,
    this.text,
    this.press,
  }) : super(key: key);

  final String? imageSrc, text;
  final Function? press;

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  bool isHover = false;
  Duration duration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
        widget.press!(),
      onHover: (value) {
        setState(
          () {
            isHover = value;
          },
        );
      },
      hoverColor: Colors.transparent,
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01),
        // height: MediaQuery.of(context).size.height*0.1,
        duration: duration,
        // margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
        decoration: BoxDecoration(
          color: Color(0xFFE8F0F9),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [if (isHover) kDefaultCardShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                children: [
                  Image.asset(widget.imageSrc??'', height: 40),
                  SizedBox(width: kDefaultPadding),
                  Text(widget.text??''),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Material(
      child: InkWell(
        onTap: () => widget.press,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        hoverColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: kDefaultPadding,
            horizontal: kDefaultPadding * 2.5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xFFE8F0F9),
          ),
          child: Row(
            children: [
              Image.asset(widget.imageSrc??'', height: 40),
              SizedBox(width: kDefaultPadding),
              Text(widget.text??''),
            ],
          ),
        ),
      ),
    );
  }
}
