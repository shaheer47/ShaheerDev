import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/RecentWork.dart';

class RecentWorkCard extends StatefulWidget {
  // just press "Command + ."
  const RecentWorkCard({
    Key? key,
    required this.index,
    required this.press,
  }) : super(key: key);

  final int index;
  final Function press;

  @override
  _RecentWorkCardState createState() => _RecentWorkCardState();
}

class _RecentWorkCardState extends State<RecentWorkCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: InkWell(
        onTap: () => widget.press(),
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: 320,
          // width: 600,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [if (isHover) kDefaultCardShadow],
          ),
          child: Row(
            children: [
              Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(recentWorks[widget.index].image),
                    fit: BoxFit.fill,
                  ),
                ),
                // child: Image.asset()
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(recentWorks[widget.index].category.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.width*0.03 )),
                      const SizedBox(height: kDefaultPadding / 2),
                      Text(
                        recentWorks[widget.index].title,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            height: 1.2,
                            // the height between text, default is null
                            letterSpacing: 1.0,
                            // the white space between letter, default is 0.0
                            fontSize:
                            ( MediaQuery.of(context).size.height *   MediaQuery.of(context).size.width )* 0.00004),
                      ),
                      const SizedBox(height: kDefaultPadding),
                      const Text(
                        "View Details",
                        style: TextStyle(decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
