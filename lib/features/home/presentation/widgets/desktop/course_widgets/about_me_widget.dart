// ignore_for_file: prefer_const_constructors

import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:dicquemare_solution/languages/languages.dart';
import 'package:flutter/material.dart';

class AboutMePoint {
  String title;
  String description;
  String assetPath;

  AboutMePoint(
      {required this.title,
      required this.description,
      required this.assetPath});
}

class AboutMeWidget extends StatelessWidget {
  bool firstInit = true;
  List<AboutMePoint> aboutMePoints = [];
  @override
  Widget build(BuildContext context) {
    if (firstInit) {
      aboutMePoints = [
        AboutMePoint(
            title: Languages.of(context).aboutMeFirstPointTitle,
            description: Languages.of(context).aboutMeFirstPointDescription,
            assetPath: MyAssets.icScroll),
        AboutMePoint(
            title: Languages.of(context).aboutMeSecondPointTitle,
            description: Languages.of(context).aboutMeSecondPointDescription,
            assetPath: MyAssets.icPhone),
        AboutMePoint(
            title: Languages.of(context).aboutMeThirdPointTitle,
            description: Languages.of(context).aboutMeThirdPointDescription,
            assetPath: MyAssets.icWorld),
        AboutMePoint(
            title: Languages.of(context).aboutMeFourthPointTitle,
            description: Languages.of(context).aboutMeFourthPointDescription,
            assetPath: MyAssets.icCog),
      ];
    }
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Languages.of(context).aboutMeTitle,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.textTitle40(
                            color: myLightColorScheme.primary),
                      ),
                      Text(
                        Languages.of(context).aboutMePost,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.textXXXLSemiBold(
                            color: myLightColorScheme.onSurface),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                        child: Text(
                          Languages.of(context).aboutMeDescription,
                          textAlign: TextAlign.justify,
                          style: AppTextStyles.textMRegular(
                              color: myLightColorScheme.onBackground),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.17,
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(MyAssets.profilePhoto),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 3,
            ),
            Row(
              children: [
                buildSkillItem(context, aboutMePoints[0]),
                buildSkillItem(context, aboutMePoints[1]),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                buildSkillItem(context, aboutMePoints[2]),
                buildSkillItem(context, aboutMePoints[3]),
              ],
            ),
            const SizedBox(
              height: 32,
            )
          ],
        ),
      ),
    );
  }

  Widget buildSkillItem(BuildContext context, AboutMePoint entry) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.32,
      child: Row(
        children: [
          Image.asset(
            entry.assetPath,
            width: 80,
          ),
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3 - 96,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.title,
                  style: AppTextStyles.textXXXLSemiBold(
                    color: myLightColorScheme.onTertiaryContainer,
                  ),
                ),
                Flexible(
                  child: Text(
                    entry.description,
                    style: AppTextStyles.textMRegular(
                        color: myLightColorScheme.onBackground),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
