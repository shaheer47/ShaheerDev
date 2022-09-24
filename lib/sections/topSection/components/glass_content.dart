import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constants.dart';

class GlassContent extends StatelessWidget {
  const GlassContent({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    print('--:${MediaQuery.of(context).size.width}');
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 2, vertical: kDefaultPadding * 2),
          width: double.infinity,
          color: Colors.red.withOpacity(0),
          child: Wrap(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: Text(
                            "Hello There!",
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Lottie.asset('assets/lottie/hand_hi.json',
                            width: 100, height: 100),
                      ],
                    ),
                  ),
                  // Text(
                  //   "Hello There!",
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .headline5
                  //       .copyWith(color: Colors.white),
                  // ),
                  Text(
                    "Shaheer \nGhouri",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.09,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    "Software Engineer",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: Colors.white),
                  )
                ],
              ),
              Container(
                child: Lottie.asset('assets/lottie/person.json',
                    height: MediaQuery.of(context).size.width >= 1200
                        ? 700
                        : MediaQuery.of(context).size.width * 0.6,
                    width: MediaQuery.of(context).size.width >= 1200
                        ? 700
                        : MediaQuery.of(context).size.width * 0.4),
              )
            ],
          ),
        ),
      ),
    );
  }
}
