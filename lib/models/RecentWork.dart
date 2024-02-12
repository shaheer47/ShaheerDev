class RecentWork {
  final String image, category, title,url;
  final int id;

  RecentWork({required this.id,required this.image,required this.category,required this.title,required this.url});
}

// Demo List of my works
List<RecentWork> recentWorks = [
  RecentWork(
    id: 1,
    title: "A SAAS base multi-vendor / single store with rider & vendor app (flutter/laravel/nuxt)",
    category: "Nictus Store",
    image: "assets/images/inctus_ecommerce.png",
    url: 'https://play.google.com/store/apps/details?id=com.textilechat.ingenious.textilechat'
  ),
  // https://play.google.com/store/apps/details?id=com.textilechat.ingenious.textilechat

  RecentWork(
    id: 2,
    title: "A SAAS base online appointment booking solution with flutter mobile app & laravel.",
    category: "Nictus Consultation",
    image: "assets/images/inctus_consultant.png",
    url: 'https://codecanyon.net/item/nictus-consultation-complete-online-consultation-solution-with-flutter-mobile-app-and-laravel/37515853'
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
    title: "Share your digital business card from NFC Card or Ring",
    category: "BLACKLINK Cards",
    image: "assets/images/blacklink_card.png",
    url: 'https://blacklink.cc'
  ),
  // https://play.google.com/store/apps/details?id=com.anxietyease
];
