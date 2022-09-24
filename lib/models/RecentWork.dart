class RecentWork {
  final String image, category, title,url;
  final int id;

  RecentWork({required this.id,required this.image,required this.category,required this.title,required this.url});
}

// Demo List of my works
List<RecentWork> recentWorks = [
  RecentWork(
    id: 1,
    title: "Textile Platform for Buying/Selling from Raw Materials to Finished Goods",
    category: "Hello Textile",
    image: "assets/images/hello_textile.png",
    url: 'https://play.google.com/store/apps/details?id=com.textilechat.ingenious.textilechat'
  ),
  // https://play.google.com/store/apps/details?id=com.textilechat.ingenious.textilechat

  RecentWork(
    id: 2,
    title: "Bumpdate is the first-ever app to help expecting parents privately share their pregnancies with their loved ones.",
    category: "Bumpdate",
    image: "assets/images/bumpdate.png",
    url: 'https://play.google.com/store/apps/details?id=com.bumpdate'
  ),
  // https://play.google.com/store/search?q=bumpdate&c=apps


  RecentWork(
    id: 3,
    title: "The tap-o immediately shares your social media profiles to any NFC compatible smartphone with one tap.",
    category: "Tap-o",
    image: "assets/images/tap-o.jpeg",
    url: 'https://play.google.com/store/apps/details?id=com.devprotocols.tap_o'
  ),
  // https://play.google.com/store/apps/details?id=com.devprotocols.tap_o

  RecentWork(
    id: 4,
    title: "AnxietyEase is a platform that aims to provide for users to work on easing their anxieties",
    category: "AnxietyEase",
    image: "assets/images/anxietyease.png",
    url: 'https://play.google.com/store/apps/details?id=com.anxietyease'
  ),
  // https://play.google.com/store/apps/details?id=com.anxietyease
];
