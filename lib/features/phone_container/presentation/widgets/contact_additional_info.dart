import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:flutter/material.dart';

class ContactAdditionalInfoWidget extends StatelessWidget {
  CrossAxisAlignment crossAxisAlignment;

  ContactAdditionalInfoWidget(
      {this.crossAxisAlignment = CrossAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            _buildContactItem(
                "tdicquemare@gmail.com", AssetImage(MyAssets.icMail), () {
              CoreUtils.copyToClipboard("tdicquemare@gmail.com");
            }),
            const SizedBox(height: 16),
            _buildContactItem("+33 6 38 25 92 79", AssetImage(MyAssets.icPhone),
                () {
              CoreUtils.launchURL(
                  "https://api.whatsapp.com/send/?phone=33638259279&text&type=phone_number&app_absent=0");
            }),
            const SizedBox(height: 8),
            Divider(),
            const SizedBox(height: 8),
            _buildContactItem(
                "Suivez moi sur LinkedIn", AssetImage(MyAssets.icLinkedin), () {
              CoreUtils.launchURL("https://www.linkedin.com/in/tdicquemare/");
            }),
            const SizedBox(height: 16),
            _buildContactItem(
                "Suivez moi sur Malt", AssetImage(MyAssets.icMalt), () {
              CoreUtils.launchURL("https://www.malt.fr/profile/tdicquemare");
            }),
            const SizedBox(height: 16),
            _buildContactItem(
                "Suivez moi sur GitHub", AssetImage(MyAssets.icGithub), () {
              CoreUtils.launchURL("https://github.com/tiagodicquemare");
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(String title, AssetImage image, Function() onTap) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
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
