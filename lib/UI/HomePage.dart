import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:potrtfolio/Model/Method.dart';
import 'package:potrtfolio/UI/About.dart';
import 'package:potrtfolio/UI/FeatureProject.dart';
import 'package:potrtfolio/UI/Work.dart';
import 'package:potrtfolio/Widget/AppBarTitle.dart';
import 'package:potrtfolio/Widget/CustomText.dart';
import 'package:potrtfolio/Widget/MainTiitle.dart';
import 'package:potrtfolio/Widget/OSImages.dart';
import 'package:potrtfolio/utils/colors.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../utils/const.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Method method = Method();
  AutoScrollController _autoScrollController = AutoScrollController();
  final scrollDirection = Axis.vertical;

  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
        () => _isAppBarExpanded
            ? isExpaned != false
                ? setState(
                    () {
                      isExpaned = false;
                      print('setState is called');
                    },
                  )
                : {}
            : isExpaned != true
                ? setState(() {
                    print('setState is called');
                    isExpaned = true;
                  })
                : {},
      );
    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({required int index, required Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
    );
  }

  bool onHoverResume = false;
  bool onHoverGetInTouch = false;
  bool onHoverSayHello = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          primary: true,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //Mavigation Bar
              Container(
                margin: EdgeInsets.only(top: 20),
                // height: size.height * 0.14,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Image(
                        fit: BoxFit.fill,
                        image: AssetImage('images/favicon.png'),
                      ),
                      // IconButton(
                      //     icon: Icon(
                      //       Icons.change_history,
                      //       size: 32.0,
                      //       color: Color(0xff64FFDA),
                      //     ),
                      //     onPressed: () {}),
                      Spacer(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DefaultTabController(
                            length: 4,
                            child: TabBar(
                              dividerColor: primaryColor,
                              indicatorColor: Colors.transparent,
                              onTap: (index) async {
                                _scrollToIndex(index);
                              },
                              tabs: [
                                Tab(
                                  child: AppBarTitle(
                                    text: ABOUT,
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: EXPERIENCE,
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: WORK,
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: ABOUT,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          method.launchURL('https://drive.google.com/file/d/1JNdleclKTOckG7h6dQmaH_Gmu1D1KEu7/view?usp=sharing');
                        },
                        onHover: (value) {
                          setState(() {
                            onHoverResume = value;
                          });
                        },
                        hoverColor:
                            // primaryColor.withOpacity(0.2),
                            secondaryColor,
                        borderRadius: BorderRadius.circular(4.0),
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(0.85),
                          height: size.height * 0.07,
                          width: size.height * 0.20,
                          decoration: BoxDecoration(
                            color: onHoverResume
                                ? secondaryColor
                                : backgroundColor,
                            boxShadow: onHoverResume
                                ? const [
                                    BoxShadow(
                                      color: primaryColor,
                                      offset: Offset(-2, 0),
                                      blurRadius: 20,
                                    ),
                                    BoxShadow(
                                      color: primaryColor,
                                      offset: Offset(2, 0),
                                      blurRadius: 20,
                                    )
                                  ]
                                : null,
                            border: Border.all(
                              color: (primaryColor),
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            RESUME,
                            style: TextStyle(
                              color: primaryColor,
                              letterSpacing: 2.75,
                              wordSpacing: 1.0,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                children: [
                  //Social Icon
                  Container(
                    width: size.width * 0.09,
                    height: size.height - 82,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.github),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchURL("https://github.com/shaheer47");
                            }),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.linkedin),
                          color: Color(0xffffA8B2D1),
                          onPressed: () {
                            method.launchURL(
                                "https://www.linkedin.com/in/shaheerghouri");
                          },
                          iconSize: 16.0,
                        ),
                        IconButton(
                            icon: Icon(Icons.mark_email_read),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchEmail();
                            }),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: primaryColor,
                                boxShadow: const [
                                  BoxShadow(
                                    color: primaryColor,
                                    offset: Offset(-2, 0),
                                    blurRadius: 20,
                                  ),
                                  BoxShadow(
                                    color: primaryColor,
                                    offset: Offset(2, 0),
                                    blurRadius: 20,
                                  )
                                ]),
                            height: size.height * 0.20,
                            width: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: size.height - 82,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomScrollView(
                          controller: _autoScrollController,
                          slivers: <Widget>[
                            SliverList(
                                delegate: SliverChildListDelegate([
                              Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: size.height * .06,
                                      ),
                                      CustomText(
                                        text: MY_NAME_IS,
                                        textsize: 16.0,
                                        color: whiteColor,
                                        letterSpacing: 3.0,
                                      ),
                                      SizedBox(
                                        height: 6.0,
                                      ),

                                      ShaderMask(
                                        shaderCallback: (bounds) {
                                          return const LinearGradient(colors: [
                                            primaryColor,
                                            secondaryColor,
                                          ]).createShader(bounds);
                                        },
                                        child: Text(
                                          SHAHEER_AHMAD_GHORI,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge!
                                              .copyWith(
                                                color: Colors.white,
                                                height: 0,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 68.0,
                                              ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      AnimatedTextKit(
                                        animatedTexts: List.generate(
                                          TAG_LINES_LISTS.length,
                                          (index) => TyperAnimatedText(
                                            TAG_LINES_LISTS[index],
                                            speed: const Duration(
                                                milliseconds: 50),
                                            textStyle: TextStyle(
                                              fontSize: 56.0,
                                              color: lightGreyColor
                                                  .withOpacity(0.6),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        isRepeatingAnimation: true,
                                      ),

                                      SizedBox(
                                        height: size.height * .04,
                                      ),
                                      Wrap(
                                        children: [
                                          Text(
                                            SHORT_DESCRIPTION,
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16.0,
                                              letterSpacing: 2.75,
                                              wordSpacing: 0.75,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * .12,
                                      ),

                                      //get in tuch text
                                      Container(
                                        margin: EdgeInsets.only(left: 25),
                                        child: InkWell(
                                          onTap: () {
                                            method.launchEmail();
                                          },
                                          onHover: (value) {
                                            setState(() {
                                              onHoverGetInTouch = value;
                                            });
                                          },
                                          hoverColor:
                                              // primaryColor.withOpacity(0.2),
                                              secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: size.height * 0.09,
                                            width: size.width * 0.14,
                                            decoration: BoxDecoration(
                                              color: onHoverGetInTouch
                                                  ? secondaryColor
                                                  : backgroundColor,
                                              boxShadow: onHoverGetInTouch
                                                  ? const [
                                                      BoxShadow(
                                                        color: primaryColor,
                                                        offset: Offset(-2, 0),
                                                        blurRadius: 20,
                                                      ),
                                                      BoxShadow(
                                                        color: primaryColor,
                                                        offset: Offset(2, 0),
                                                        blurRadius: 20,
                                                      )
                                                    ]
                                                  : null,
                                              border: Border.all(
                                                color: (primaryColor),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: Text(
                                              "Get In Touch",
                                              style: TextStyle(
                                                color: primaryColor,
                                                letterSpacing: 2.75,
                                                wordSpacing: 1.0,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: size.height * 0.20,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    color: Colors.grey,
                                  )
                                ],
                              ),

                              //About Me
                              _wrapScrollTag(
                                index: 0,
                                child: About(false),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),

                              //Where I've Worked
                              _wrapScrollTag(index: 1, child: Work()),
                              SizedBox(
                                height: size.height * 0.10,
                              ),

                              //Some Things I've Built Main Project
                              _wrapScrollTag(
                                  index: 2,
                                  child: Column(
                                    children: [
                                      MainTiitle(
                                        number: "0.3",
                                        text: "Some Things I've Built",
                                      ),
                                      SizedBox(
                                        height: size.height * 0.04,
                                      ),
                                      FeatureProject(
                                        imagePath: "images/pic9.png",
                                        ontabAndroid: () {
                                          method.launchURL(
                                              "https://play.google.com/store/apps/details?id=com.origami.nebulum&hl=en_US");
                                        },
                                        ontabApple: () {
                                          method.launchURL(
                                              "https://apps.apple.com/pk/app/nebulum/id1667818613");
                                        },
                                        projectDesc:
                                            "Discover local influencers across multiple platforms, link and promote content from multiple social media accounts all in one place, make the top influencer leaderboards and find out who’s who near you!",
                                        projectTitle: "Nebulum",
                                        tech1: "Flutter",
                                        tech2: "Dart",
                                      ),

                                      FeatureProject(
                                        imagePath: "images/pic2.png",
                                        ontabApple: () {
                                          method.launchURL(
                                              "https://apps.apple.com/vn/app/fanbladz/id6443621706");
                                        },
                                        ontabAndroid: () {
                                          method.launchURL(
                                              "https://play.google.com/store/apps/details?id=com.origamistudios.fanbladz&hl=en_US");
                                        },
                                        projectDesc:
                                            "Fanbladz is an online service that allows high student-athletes (SA) the ability to build resumes and player performance profiles (PPP) of their academic and sports performance history in a centralized web-based location for sharing with family and fans and being discovered by college recruiters with advanced analytical search and discover capabilities.",
                                        projectTitle: "Fanbladz",
                                        tech1: "Dart",
                                        tech2: "Flutter",
                                      ),

                                      FeatureProject(
                                        imagePath: "images/pic3.png",
                                        ontabApple: () {
                                          method.launchURL(
                                              "https://apps.apple.com/us/app/bumpdate/id1592506191");
                                        },
                                        ontabAndroid: () {
                                          method.launchURL(
                                              "https://play.google.com/store/apps/details?id=com.bumpdate&hl=en");
                                        },
                                        projectDesc:
                                            "Bumpdate is the first-ever app to help expecting parents privately share key details about their pregnancies and growing families with their loved onesFinally, expected due dates, baby names and genders, gift registry links, must-have product lists, and more – all in one place and only accessible by your selected friends and family. ",
                                        projectTitle: "Bumpdate",
                                        tech1: "Dart",
                                        tech2: "Flutter",
                                      ),

                                      FeatureProject(
                                        imagePath: "images/pic4.png",
                                        ontabApple: () {
                                          method.launchURL(
                                              "https://apps.apple.com/bg/app/anxietyease/id1609414463");
                                        },
                                        ontabAndroid: () {
                                          method.launchURL(
                                              "https://play.google.com/store/apps/details?id=com.anxietyease&hl=en_US");
                                        },
                                        projectDesc:
                                            "AnxietyEase is a mobile application designed to help individuals manage their anxiety levels and improve their overall mental wellbeing The app offers a variety of features, including guided meditations, breathing exercises, and cognitive behavioral therapy (CBT) techniques that are proven to reduce anxiety symptoms.",
                                        projectTitle: "AnxietyEase",
                                        tech1: "Dart",
                                        tech2: "Flutter",
                                      ),
                                      //ff
                                      FeatureProject(
                                        imagePath: "images/pic5.png",
                                        ontabAndroid: () {
                                          method.launchURL(
                                              "https://play.google.com/store/apps/details?id=com.master.pos");
                                        },
                                        projectDesc:
                                            "The Master's POS system is built to make the life of the dealerships of Master easier. A dealer can log in to the system to access the whole world of the products of Master Molty Foam. The dealer can choose a product based on its category, quality, and sizes.\nThat's not it; every sale can be done by two ways, either manually or by scanning the barcode/QR code of the product.",
                                        projectTitle: "MoltyFoam POS",
                                        tech1: "Dart",
                                        tech2: "Flutter",
                                      ),

                                      FeatureProject(
                                        imagePath: "images/pic6.png",
                                        ontabApple: () {
                                          method.launchURL(
                                              "https://play.google.com/store/apps/details?id=com.textilechat.ingenious.textilechat&hl=en_US");
                                        },
                                        projectDesc:
                                            "HELLO TEXTILE is the first ever B2B cum social media portal for Textile Industry. This App is all about Sales & Purchase of Textile products; it helps you to find Thousands of buyers and suppliers of Textile products, from raw materials to finished goods worldwide. ",
                                        projectTitle: "HELLO TEXTILE",
                                        tech1: "Android",
                                        tech2: "Kotlin",
                                        tech3: "JAVA",
                                      ),

                                      FeatureProject(
                                        imagePath: "images/pic7.png",
                                        projectDesc:
                                            "Application for Restaurant with multiple roles like Cashier, Counter, Mobile, Kitchen and multiple scales of business. Application include offline functionality with Sunmi and thermal printer integration.",
                                        projectTitle: "Real Spice",
                                        tech1: "Android",
                                        tech2: "Kotlin",
                                      ),

                                      FeatureProject(
                                        imagePath: "images/pic8.png",
                                        ontabApple: () {
                                          method.launchURL(
                                              "https://apps.apple.com/in/app/master-affiliate/id1594362538");
                                        },
                                        ontabAndroid: () {
                                          method.launchURL(
                                              "https://play.google.com/store/apps/details?id=com.master.affiliate&hl=en_US");
                                        },
                                        projectDesc:
                                            "The Master Affiliate app lets users earn incentives by promoting products from the leading mattress brand, MoltyFoam. By joining the app, users can engage in promotional activities and earn rewards. It's an easy way to make money while supporting a well-known brand.",
                                        projectTitle: "Master Affiliate",
                                        tech1: "Dart",
                                        tech2: "Flutter",
                                        tech3: "API",
                                      ),

                                      FeatureProject(
                                        imagePath: "images/pic10.png",
                                        ontabAndroid: () {
                                          method.launchURL(
                                              "https://play.google.com/store/apps/details?id=com.app.livewave&hl=en_US");
                                        },
                                        projectDesc:
                                            "LiveWaves is an easy-to-use, all-in-one social network that gives users the ability to create and monetize their own live streams, posts, pictures, videos, sound recordings as well as in-person ticketed events. LiveWaves also gives users the ability to set up subscriptions to specific, or all parts of their content.",
                                        projectTitle: "Livewaves",
                                        tech1: "Android",
                                        tech2: "Java",
                                        tech3: "Kotlin",
                                      ),

                                      FeatureProject(
                                        imagePath: "images/pic11.png",
                                        ontabAndroid: () {
                                          method.launchURL(
                                              "https://play.google.com/store/apps/details?id=com.horizam.tikl&hl=en_US");
                                        },
                                        projectDesc:
                                            "TIKL is the quickest method to share your Social media and contact information! By tapping your TIKL to another person's telephone you can in a split second offer your whole TIKL profile with anybody you meet. They needn't bother with an application or a TIKL to get your information.",
                                        projectTitle: "TIKL",
                                        tech1: "Android",
                                        tech2: "JAVA",
                                        tech3: "Kotlin",
                                      ),
                                      FeatureProject(
                                        imagePath: "images/pic12.png",
                                        ontabAndroid: () {
                                          method.launchURL(
                                              "https://play.google.com/store/apps/details?id=com.devprotocols.blacklink&hl=en_US");
                                        },
                                        ontabApple: () {
                                          method.launchURL(
                                              "https://apps.apple.com/pl/app/blacklink-cards/id6444130223");
                                        },
                                        projectDesc:
                                            "BLACKLINK Cards is a digital business card platform that allows you to create, share, and scan business cards easily. It's a convenient and eco-friendly alternative to traditional paper cards.",
                                        projectTitle: "BLACKLINK Cards",
                                        tech1: "Dart",
                                        tech2: "Flutter",
                                      ),
                                    ],
                                  )),

                              SizedBox(
                                height: 6.0,
                              ),

                              //Get In Touch
                              _wrapScrollTag(
                                index: 3,
                                child: Column(
                                  children: [
                                    Container(
                                      height: size.height * 0.68,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      // color: Colors.orange,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          NeonText(
                                            text: "What's Next?",
                                            spreadColor: secondaryColor,
                                            blurRadius: 20,
                                            fontWeight: FontWeight.w700,
                                            textSize: 16.0,
                                            textColor: Colors.white,
                                          ),
                                          SizedBox(
                                            height: 16.0,
                                          ),
                                          CustomText(
                                            text: "Get In Touch",
                                            textsize: 42.0,
                                            color: Colors.white,
                                            letterSpacing: 3.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          SizedBox(
                                            height: 16.0,
                                          ),
                                          Wrap(
                                            children: [
                                              Text(
                                                "I am always open to connecting. If you have any questions or simply wish to reach out, please feel free to message me, and I will make every effort to respond promptly!",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.4),
                                                  letterSpacing: 0.75,
                                                  fontSize: 17.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 32.0,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              method.launchEmail();
                                            },
                                            onHover: (value) {
                                              setState(() {
                                                onHoverSayHello = value;
                                              });
                                            },
                                            hoverColor:
                                                // primaryColor.withOpacity(0.2),
                                                secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.all(0.85),
                                              height: size.height * 0.07,
                                              width: size.height * 0.20,
                                              decoration: BoxDecoration(
                                                color: onHoverSayHello
                                                    ? secondaryColor
                                                    : backgroundColor,
                                                boxShadow: onHoverSayHello
                                                    ? const [
                                                        BoxShadow(
                                                          color: primaryColor,
                                                          offset: Offset(-2, 0),
                                                          blurRadius: 20,
                                                        ),
                                                        BoxShadow(
                                                          color: primaryColor,
                                                          offset: Offset(2, 0),
                                                          blurRadius: 20,
                                                        )
                                                      ]
                                                    : null,
                                                border: Border.all(
                                                  color: (primaryColor),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              child: Text(
                                                'Say Hello',
                                                style: TextStyle(
                                                  color: primaryColor,
                                                  letterSpacing: 2.75,
                                                  wordSpacing: 1.0,
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    //Footer
                                    Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      //color: Colors.white,
                                      child: Text(
                                        "Designed & Built by Shaheer 💙 Flutter",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.4),
                                          letterSpacing: 1.75,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ])),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.height - 82,
                    //color: Colors.orange,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            method.launchEmail();
                          },
                          child: RotatedBox(
                            quarterTurns: 45,
                            child: Row(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    NeonText(
                                      text: 'shaheerahmedghori@gmail.com',
                                      spreadColor: secondaryColor,
                                      blurRadius: 20,
                                      fontWeight: FontWeight.w700,
                                      textColor: Colors.white,
                                      textSize: 14,
                                    ),
                                    SizedBox(
                                      width: 26.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            boxShadow: const [
                                              BoxShadow(
                                                color: primaryColor,
                                                offset: Offset(-2, 0),
                                                blurRadius: 20,
                                              ),
                                              BoxShadow(
                                                color: primaryColor,
                                                offset: Offset(2, 0),
                                                blurRadius: 20,
                                              )
                                            ]),
                                        height: 1.5,
                                        width: 200,
                                      ),
                                    ),
                                  ],
                                ),
                                // Text(
                                //   "shaheerahmedghori@gmail.com",
                                //   style: TextStyle(
                                //     color: Colors.grey.withOpacity(0.6),
                                //     letterSpacing: 3.0,
                                //     fontWeight: FontWeight.w700,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 16.0),
                        //   child: Container(
                        //     height: 100,
                        //     width: 2,
                        //     color: Colors.grey.withOpacity(0.4),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
