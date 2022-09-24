import 'package:flutter/material.dart';

class Service {
  final int id;
  final String title, image;
  final Color color;

  Service({required this.id,required this.title,required this.image,required this.color});
}

// For demo list of service


List<Service> services = [
  Service(
    id: 1,
    title: "Flutter",
    image: "assets/images/flutter.svg",
    // color: Color(0xFFD9FFFC),
    color: Color(0xFF40c4ff),
  ),
  Service(
    id: 2,
    title: "Dart",
    image: "assets/images/dart.svg",
    // color: Color(0xFFE4FFC7),
    color: Color(0xFF85cbf8),
  ),
  Service(
    id: 3,
    title: "Java",
    image: "assets/images/java.svg",
    // color: Color(0xFFFFF3DD),
    color: Color(0x7A1565C0),
  ),
  Service(
    id: 4,
    title: "Kotlin",
    image: "assets/images/kotlin.svg",
    // color: Color(0xFFFFE0E0),
    color: Color(0xFF806ee3),
  ),Service(
    id: 5,
    title: "Android",
    image: "assets/images/android.svg",
    // color: Color(0xFFFFE0E0),
    color: Color(0xFF30dc80),
  ),
];
