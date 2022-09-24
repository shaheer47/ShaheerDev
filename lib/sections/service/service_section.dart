import 'package:flutter/material.dart';
import '../../components/section_title.dart';
import '../../models/Service.dart';
import 'components/service_card.dart';

class ServiceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      const SectionTitle(
        color: Color(0xFFFF0000),
        title: "My Expertise",
        subTitle: "My Strong Areas",
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Wrap(
          children: List.generate(
            services.length,
            (index) => Container(
              margin: const EdgeInsets.all( 10),
              child: ServiceCard(index: index),
            ),
          ),
        ),
      )
    ],
      );
  }
}
