import 'package:ShaheerDev/sections/about/about_section.dart';
import 'package:ShaheerDev/sections/contact/contact_section.dart';
import 'package:ShaheerDev/sections/recent_work/recent_work_section.dart';
import 'package:ShaheerDev/sections/service/service_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ShaheerDev/sections/topSection/top_section.dart';

import 'constants.dart';

class HomeScreen extends StatelessWidget {
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();

  bool isScrollingDown = false;

  List<Widget> list = [
    Stack(
      children: [
        TopSection(
          (int position) {
            // changePosition(position);
            // animateToIndex(position);
            print('000-->> ${position.toDouble()}');
            // setState((){
            // controller.jumpTo(position.toDouble());
            // }),
          },
        ),
      ],
    ),
    const SizedBox(height: kDefaultPadding * 2),
    AboutSection(),
    ServiceSection(),
    RecentWorkSection(),
    ContactSection(),
  ];

  // @override
  // void initState() {
  //   // controller  = ScrollController();
  //   // controller.addListener(() {
  //   //   if (controller.position.userScrollDirection == ScrollDirection.reverse) {
  //   //     if (!isScrollingDown) {
  //   //       isScrollingDown = true;
  //   //       setState(() {});
  //   //     }
  //   //   }
  //   // });
  //   //
  //   // if (controller.position.userScrollDirection == ScrollDirection.forward) {
  //   //   if (isScrollingDown) {
  //   //     isScrollingDown = false;
  //   //     setState(() {});
  //   //   }
  //   // }
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        // height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  controller: controller,
                  itemCount: list.length,
                  itemBuilder: (_, i) {
                    // if (i == 0) {
                    //   return Stack(
                    //     children: [
                    //       list[i],
                    //       Menu((int position) {
                    //         final contentSize =
                    //             controller.position.viewportDimension +
                    //                 controller.position.maxScrollExtent;
                    //         final index = position*100;
                    //         final target = contentSize * index / list.length;
                    //         controller.position.animateTo(
                    //           MediaQuery.of(context).size.height*position,
                    //           duration: const Duration(seconds: 1),
                    //           curve: Curves.easeIn,
                    //         );
                    //       })
                    //     ],
                    //   );
                    // }



                    return list[i];
                  }
                  //
                  //   : (context) {
                  //   return ListView(
                  //     controller: controller,
                  //     children: [
                  //       TopSection((int position) {
                  //         print('000-->> ${position.toDouble()}');
                  //         setState(() {
                  //           controller.jumpTo(position.toDouble());
                  //         });
                  //       }),
                  //
                  //       SizedBox(height: kDefaultPadding * 2),
                  //
                  //       AboutSection(),
                  //
                  //       ServiceSection(),
                  //
                  //       RecentWorkSection(),
                  //
                  //       ContactSection(),
                  //       // This SizeBox just for demo
                  //       // SizedBox(
                  //       //   height: 500,
                  //       // )
                  //     ],
                  //   );
                  // }
                  ),
            ],
          ),
        ),
      ),
    );
  }

  static void changePosition(int position) {
    // controller.
  }

// void animateToIndex(int index) {
//   controller.animateTo(
//     index * MediaQuery.of(context).size.height,
//     duration: Duration(seconds: 2),
//     curve: Curves.fastOutSlowIn,
//   );
// }
}
