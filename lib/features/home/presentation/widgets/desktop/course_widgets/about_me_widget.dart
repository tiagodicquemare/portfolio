// ignore_for_file: prefer_const_constructors

import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:flutter/material.dart';

class AboutMeWidget extends StatelessWidget {
  Map<String, AssetImage> mapServices = {
    "Analyse du besoin": AssetImage(MyAssets.icScroll),
    "Développement": AssetImage(MyAssets.icPhone),
    "Déploiement": AssetImage(MyAssets.icWorld),
    "Maintenance": AssetImage(MyAssets.icCog)
  };
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48, vertical: 32),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: myLightColorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Développeur mobile Android \net Flutter Freelance",
                          style: AppTextStyles.textTitle32(
                              color: myLightColorScheme.primary),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          "I am a backend developer with expertise in Node.js. I have experience in building scalable, secure and reliable web applications using various frameworks and technologies. I enjoy solving complex problems and learning new skills. I am passionate about creating high-quality code that follows best practices and industry standards. I am always looking for new challenges and opportunities to grow as a developer.",
                          style: AppTextStyles.textLRegular(
                              color: myLightColorScheme.onBackground),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Container(
                width: 420.0,
                height: 420.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(MyAssets.profilePhoto),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          const Divider(
            thickness: 3,
          ),
          const Spacer(),
          Container(
              height: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildSkillItem(mapServices.entries.elementAt(0)),
                  const SizedBox(width: 8),
                  buildSkillItem(mapServices.entries.elementAt(1)),
                  const SizedBox(width: 8),
                  buildSkillItem(mapServices.entries.elementAt(2)),
                  const SizedBox(width: 8),
                  buildSkillItem(mapServices.entries.elementAt(3)),
                ],
              )),
        ],
      ),
    );
  }

  Widget buildSkillItem(MapEntry<String, AssetImage> entry) {
    return Container(
      width: 170.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: myLightColorScheme.tertiaryContainer),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: entry.value,
              width: 80,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              entry.key,
              textAlign: TextAlign.center,
              style: AppTextStyles.textLSemiBold(
                  color: myLightColorScheme.onTertiaryContainer),
            ),
          ],
        ),
      ),
    );
  }
}
