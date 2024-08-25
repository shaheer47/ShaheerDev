import 'package:flutter/material.dart';
import 'package:shaheer_portfolio_new/Widget/work_custom_data.dart';

class WorkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkCustomData(
          title: "Systems Limited",
          subTitle:
              "I have extensive experience in training and mentoring, having led a team of interns in Flutter development by organizing workshops and code reviews to strengthen their understanding of both fundamentals and advanced topics. I've work with a real-time online currency and stock market application with live market data and interactive features. My collaboration with a leading fintech company involved creating a secure mobile application with digital wallets and biometric authentication, ensuring compliance with industry standards. Additionally, I have played a key role in establishing coding standards and optimizing app performance, which contributed to successful project outcomes and long-term client partnerships.",
          duration: "Nov - 2023 - Present",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        WorkCustomData(
          title: "Crewlogix",
          subTitle:
              "At Crewlogix, I contributed significantly to several high-impact projects as a Software Engineer. I developed POS systems for restaurants and businesses, including a notable project for Molty Foam that is now operational in over 2,500 stores, enhancing transaction efficiency and inventory management. I also led the creation of innovative AI and AR applications that used facial recognition and augmented reality to deliver unique, interactive experiences. In the health sector, I worked on applications for pregnancy monitoring and anxiety support, offering features like symptom tracking and personalized health tips. My role involved applying my technical expertise in Flutter, collaborating with cross-functional teams to deliver high-quality, user-centric applications.",
          duration: "May 2021 to Nov - 2023",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        WorkCustomData(
          title: "Horizam",
          subTitle:
              "As a Software Engineer Android at Horizam, I have been instrumental in developing applications tailored to meet diverse user needs. I worked on a freelance application, focusing on intuitive interfaces and seamless user experiences to help freelancers and clients connect more effectively. I also developed a social media app with live streaming capabilities, which achieved over 5,000 downloads on both Android and iOS platforms, providing a smooth and engaging user experience for live interactions. Additionally, I contributed to the development of NFC-enabled applications used at over 20 shows across the UK and US, enhancing the check-in process with NFC bands and reducing wait times. These projects reflect my ability to create impactful, user-focused applications that leverage the latest technologies.",
          duration: "Jun - 2019 to May - 2021",
        ),
      ],
    );
  }
}
