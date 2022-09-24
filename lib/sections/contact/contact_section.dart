import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/default_button.dart';
import '../../components/section_title.dart';
import '../../constants.dart';
import 'components/socal_card.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // this height only for demo
      // height: 500,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xFFE8F0F9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg_img_2.png"),
        ),
      ),
      child: Column(
        children: const [
          SizedBox(height: kDefaultPadding * 2.5),
          SectionTitle(
            title: "Contact Me",
            subTitle: "For Project inquiry and information",
            color: Color(0xFF07E24A),
          ),
          ContactBox()
         ],
      ),
    );
  }
}

class ContactBox extends StatelessWidget {
  const ContactBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: kDefaultPadding * 2,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          bottom: MediaQuery.of(context).size.width * 0.05),
      padding: const EdgeInsets.all(kDefaultPadding * 3),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Wrap(
          //   children: [
          //     SocalCard(
          //       color: Color(0xFFD9FFFC),
          //       iconSrc: "assets/images/skype.png",
          //       name: 'TheFlutterWay',
          //       press: () {},
          //     ),
          //     SocalCard(
          //       color: Color(0xFFE4FFC7),
          //       iconSrc: "assets/images/whatsapp.png",
          //       name: 'TheFlutterWay',
          //       press: () {},
          //     ),
          //     SocalCard(
          //       color: Color(0xFFE8F0F9),
          //       iconSrc: "assets/images/messanger.png",
          //       name: 'TheFlutterWay',
          //       press: () {},
          //     ),
          //   ],
          // ),
          // SizedBox(height: kDefaultPadding * 2),
          ContactForm(),
        ],
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  ContactForm({
    Key? key,
  }) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController projectTypeController = TextEditingController();
  TextEditingController projectBudgeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.75,
            child: TextFormField(
              controller: nameController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onChanged: (value) {},
              decoration: const InputDecoration(
                labelText: "Your Name",
                hintText: "Enter Your Name",
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.75,
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {},
              decoration: const InputDecoration(
                labelText: "Email Address",
                hintText: "Enter your email address",
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.75,
            child: TextFormField(
              controller: projectTypeController,
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Project Type",
                hintText: "Select Project Type",
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.75,
            child: TextFormField(
              controller: projectBudgeController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Project Budget",
                hintText: "Select Project Budget",
              ),
            ),
          ),
          SizedBox(
            height: 300,
            // TextField by default cover the height, i tryed to fix this problem but i cant
            child: TextFormField(
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              textAlign: TextAlign.start,
              maxLines: null,
              controller: descriptionController,
              minLines: null,
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Description",
                hintText: "Write some description",
                alignLabelWithHint: true,
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding * 2),
          Center(
            child: FittedBox(
              child: DefaultButton(
                imageSrc: "assets/images/contact_icon.png",
                text: "Contact Me!",
                press: () async {
                  final mailtoLink = Mailto(
                      to: ['shaheerahmedghori@gmail.com'],
                      subject: 'Via Contact Form',
                      body:
                          'Name: ${nameController.text}\nEmail: ${emailController.text}\nProject Type: ${projectTypeController.text}\nProject Budget: ${projectBudgeController.text}\n\n${descriptionController.text}');
                  // Convert the Mailto instance into a string.
                  // Use either Dart's string interpolation
                  // or the toString() method.
                  try {
                    await launch('$mailtoLink');
                  } catch (e) {
                    print('=----> $e');
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
