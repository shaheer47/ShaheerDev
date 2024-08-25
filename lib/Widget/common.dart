import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/data_file.dart';

Widget projectsTree({double padding = 20, required Size screenSize}) {
  return Container(
    padding: EdgeInsets.all(padding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          height: 40,
        ),
        // added a sized box at the end and start so that it don't disturb(push down the bottom widgets) the other widgets on hover( icon size changes from 50 to 70). put at both ends for the cases when Icons take two rows
        SizedBox(
          width: screenSize.width,
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              ...PortfolioDetails.skillsList
                  .map((e) => Tooltip(
                child: ExpandOnHover(skillIcon: e.imageAddress),
                message: e.link,
              ))
                  .toList(),
              const SizedBox(
                height: 70,
              )
            ],
          ),
        ),

      ],
    ),
  );
}

class ExpandOnHover extends StatefulWidget {
  const ExpandOnHover({Key? key, required this.skillIcon}) : super(key: key);

  final String skillIcon;

  @override
  State<StatefulWidget> createState() {
    return ExpandOnHoverState();
  }
}

class ExpandOnHoverState extends State<ExpandOnHover> {
  double iconSize = 50;
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        InkWell(
            onTap: () {},
            onHover: (value) {
              if (value) {
                setState(() {
                  scale = 1.4;
                });
              } else {
                setState(() {
                  scale = 1.0;
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Transform.scale(
                scale: scale,
                child: SvgPicture.network(
                  widget.skillIcon,
                  height: iconSize,
                  width: iconSize,
                ),
              ),
            )),
      ],
    );
  }
}
