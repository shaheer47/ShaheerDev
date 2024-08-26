import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:shaheer_portfolio_new/Widget/CustomText.dart';
import 'package:shaheer_portfolio_new/Widget/Workbox.dart';
import 'package:shaheer_portfolio_new/utils/colors.dart';

class Work extends StatefulWidget {

  Work();

  @override
  _WorkState createState() => _WorkState();
}

class _WorkState extends State<Work> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const NeonText(
              text: "02.",
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
              text: "Where I've Worked",
              spreadColor: secondaryColor,
              blurRadius: 20,
              fontWeight: FontWeight.w700,
              textSize: 26.0,
              textColor: Colors.white,
            ),

            SizedBox(
              width: size.width * 0.01,
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
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  height: size.height * 1.2,
                  //color: Colors.indigo,
                  child: Stack(
                    children: [
                      const Center(
                        child: VerticalDivider(
                          color: secondaryColor,
                          thickness: 1.75,
                          width: 10,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ),
                      Container(
                        child: const Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.deepOrange,
                              child: Image(
                                fit: BoxFit.contain,
                                image: AssetImage("images/systems_logo.png"),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image(
                                fit: BoxFit.contain,
                                image: AssetImage("images/crewlogix_logo.png"),
                              ),
                            ),  CircleAvatar(
                              backgroundColor: Colors.indigo,
                              child: Image(
                                fit: BoxFit.contain,
                                image: AssetImage("images/horizam.png"),
                              ),
                            ),
                          ],
                        )),
                      )
                    ],
                  )),
            ),
            Expanded(
                flex: 3,
                child: WorkBox())
          ],
        )
      ],
    );
  }
}
