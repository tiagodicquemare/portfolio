import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:dicquemare_solution/features/home/domain/entities/category_section_skills.dart';
import 'package:flutter/material.dart';

class CategorySkillsSectionWidget extends StatelessWidget {
  CategorySkillsSection categorySkillsSection;

  CategorySkillsSectionWidget({required this.categorySkillsSection});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            categorySkillsSection.title,
            textAlign: TextAlign.center,
            style:
                AppTextStyles.textXXXLBold(color: myLightColorScheme.primary),
          ),
          const SizedBox(
            height: 32,
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                SkillsSection skillsSection =
                    categorySkillsSection.skillsSection[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage(skillsSection.assetPath),
                          width: 40,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          skillsSection.title,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.textXLSemiBold(
                              color: myLightColorScheme.outline),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Wrap(
                      runSpacing: 12,
                      spacing: 24,
                      children: [
                        ...skillsSection.skills.map((item) {
                          return buildSkillItem(context, item);
                        })
                      ],
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 32,
                );
              },
              itemCount: categorySkillsSection.skillsSection.length)
        ],
      ),
    );
  }

  Widget buildSkillItem(BuildContext context, SkillItem item) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: myLightColorScheme.outline),
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: AppTextStyles.textXLSemiBold(
                color: myLightColorScheme.onTertiaryContainer,
              ),
            ),
            Flexible(
              child: Text(
                item.description,
                style: AppTextStyles.textMRegular(
                    color: myLightColorScheme.outline),
              ),
            )
          ],
        ),
      ],
    );
  }
}
