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
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.05, vertical: 32),
      child: Column(
        children: [
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
                      "Tiago Dicquemare",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textTitle40(
                          color: myLightColorScheme.primary),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Développeur mobile freelance\nAndroid & Flutter",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textXXXLSemiBold(
                          color: myLightColorScheme.onSurface),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur hendrerit scelerisque turpis at aliquet. Curabitur egestas sem sit amet massa bibendum, at consequat nisl gravida. Nulla sed mollis velit. Fusce interdum interdum mi, at vehicula mauris porta sed.",
                        textAlign: TextAlign.justify,
                        style: AppTextStyles.textMRegular(
                            color: myLightColorScheme.onBackground),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 180.0,
                height: 262.0,
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
          Container(
              height: MediaQuery.sizeOf(context).height * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      buildSkillItem(context, mapServices.entries.elementAt(0)),
                      buildSkillItem(context, mapServices.entries.elementAt(1)),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      buildSkillItem(context, mapServices.entries.elementAt(2)),
                      buildSkillItem(context, mapServices.entries.elementAt(3)),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget buildSkillItem(
      BuildContext context, MapEntry<String, AssetImage> entry) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Row(
        children: [
          Image(
            image: entry.value,
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
                  entry.key,
                  style: AppTextStyles.textXXXLSemiBold(
                    color: myLightColorScheme.onTertiaryContainer,
                  ),
                ),
                Flexible(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur hendrerit, nisl vel consequat dignissim, nulla nunc viverra enim, nec tincidunt nunc quam non mauris.",
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
