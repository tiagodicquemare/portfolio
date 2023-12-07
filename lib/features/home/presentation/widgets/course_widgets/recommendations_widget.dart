import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:flutter/material.dart';

class RecommendationsWidget extends StatelessWidget {
  final List<RecommendationItem> items = [
    RecommendationItem(
        MyAssets.lydiaLogo,
        "Michael Fournier",
        "Android manager Lydia",
        "Tiago à su se rendre indispensable à notre équipe pendant toute la durée de sa mission"),
    RecommendationItem(MyAssets.myJunglyLogo, "Tony Casonato", "CEO MyJungly",
        "Tiago à su se rendre indispensable à notre équipe pendant toute la durée de sa mission"),
    RecommendationItem(MyAssets.plekoLogo, "Thomas Gouty", "CEO Pleko",
        "Tiago à su se rendre indispensable à notre équipe pendant toute la durée de sa mission"),
  ];
  @override
  Widget build(BuildContext context) {
    final double heightContainer = CoreUtils.getPhoneScreenHeight(context) - 48;
    return Padding(
        padding: EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: heightContainer / 1.3,
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
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.symmetric(horizontal: 24),
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
          Image.asset(item.imageUrl),
          Text(
            item.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            item.subtitle,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Expanded(
            child: Text(
              item.description,
              style: TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendationItem {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;

  RecommendationItem(
      this.imageUrl, this.title, this.subtitle, this.description);
}
