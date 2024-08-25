import 'dart:core';

class PortfolioDetails {
  static List<IconLinkModel> skillsList = [
    IconLinkModel(
        "https://www.vectorlogo.zone/logos/flutterio/flutterio-icon.svg",
        "flutter"),
    IconLinkModel(
        "https://www.vectorlogo.zone/logos/dartlang/dartlang-icon.svg", "dart"),
    IconLinkModel(
        "https://raw.githubusercontent.com/devicons/devicon/master/icons/java/java-original.svg",
        "java"),
    IconLinkModel(
        "https://upload.wikimedia.org/wikipedia/commons/3/37/Kotlin_Icon_2021.svg",
        "Kotlin"),
    IconLinkModel(
        "https://raw.githubusercontent.com/devicons/devicon/master/icons/android/android-original-wordmark.svg",
        "android"),
    IconLinkModel(
        "https://www.vectorlogo.zone/logos/figma/figma-icon.svg", "figma"),
    IconLinkModel(
        "https://raw.githubusercontent.com/get-icon/geticon/fc0f660daee147afb4a56c64e12bde6486b73e39/icons/adobe-xd.svg",
        "Adobe Xd"),
    IconLinkModel(
        "https://www.vectorlogo.zone/logos/firebase/firebase-icon.svg",
        "firebase"),
    IconLinkModel(
        "https://www.vectorlogo.zone/logos/git-scm/git-scm-icon.svg", "git"),
    IconLinkModel(
        "https://raw.githubusercontent.com/devicons/devicon/master/icons/python/python-original.svg",
        "python"),

  ];}
class IconLinkModel {
  String imageAddress;
  String link;

  IconLinkModel(this.imageAddress, this.link);
}
