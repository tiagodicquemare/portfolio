import 'package:dicquemare_solution/assets.dart';
import 'package:flutter/material.dart';

class ContactAdditionalInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContactItem(
            "tdicquemare@gmail.com",
            AssetImage(MyAssets.icMail),
          ),
          const SizedBox(height: 16),
          _buildContactItem(
            "+33 6 38 25 92 79",
            AssetImage(MyAssets.icPhone),
          ),
          const SizedBox(height: 8),
          Divider(),
          const SizedBox(height: 8),
          _buildContactItem(
            "Suivez moi sur LinkedIn",
            AssetImage(MyAssets.icLinkedin),
          ),
          const SizedBox(height: 16),
          _buildContactItem(
            "Suivez moi sur Malt",
            AssetImage(MyAssets.icMalt),
          ),
          const SizedBox(height: 16),
          _buildContactItem(
            "Suivez moi sur GitHub",
            AssetImage(MyAssets.icGithub),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(String title, AssetImage image) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Image(
            image: image,
            height: 24,
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
