import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RecommendationsWidget extends StatelessWidget {
  final List<RecommendationItem> items = [
    RecommendationItem(
        MyAssets.onlyLydiaLogo,
        "Michael Fournier",
        "Android manager Lydia",
        "Tiago à su se rendre indispensable à notre équipe pendant toute la durée de sa mission",
        "https://www.linkedin.com/in/tdicquemare/"),
    RecommendationItem(
        MyAssets.onlyMyJunglyLogo,
        "Tony Casonato",
        "CEO MyJungly",
        "Tiago à su se rendre indispensable à notre équipe pendant toute la durée de sa mission",
        "https://www.linkedin.com/in/tdicquemare/"),
    RecommendationItem(
        MyAssets.onlyPlekoLogo,
        "Thomas Gouty",
        "CEO Pleko",
        "Tiago à su se rendre indispensable à notre équipe pendant toute la durée de sa mission",
        "https://www.linkedin.com/in/tdicquemare/"),
  ];
  @override
  Widget build(BuildContext context) {
    final double heightContainer = CoreUtils.getPhoneScreenHeight(context) - 48;
    return Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: heightContainer / 1.6,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return recommendationItem(items[index]);
                },
              ),
            )
          ],
        ));
  }

  Widget recommendationItem(RecommendationItem item) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            item.imageUrl,
            width: 120,
          ),
          const SizedBox(height: 24),
          Text(
            item.title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            item.subtitle,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          InkWell(
            onTap: () {
              _launchURL(item.linkedinUrl);
            },
            child: Text(
              "Linkedin",
              style: TextStyle(fontSize: 14, color: Colors.blueAccent),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                "${item.description}",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }
}

class RecommendationItem {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;
  final String linkedinUrl;

  RecommendationItem(this.imageUrl, this.title, this.subtitle, this.description,
      this.linkedinUrl);
}
