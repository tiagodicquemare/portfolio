import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:dicquemare_solution/features/home/domain/entities/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDescriptionWidget extends StatelessWidget {
  final Project project;
  const ProjectDescriptionWidget({super.key, required this.project});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(project.assetLogo),
            height: 48,
          ),
          const SizedBox(height: 16),
          project.websiteUrl != null
              ? InkWell(
                  onTap: () {
                    if (project.websiteUrl != null) {
                      CoreUtils.launchURL(project.websiteUrl!);
                    }
                  },
                  child: Text(
                    project.websiteUrl ?? "",
                    style: AppTextStyles.textMSemiBold(color: Colors.blue),
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 24),
          Text(
            project.description,
            style: AppTextStyles.textMRegular(color: Colors.black),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 12,
            runSpacing: 4.0,
            children: project.technologies
                .map(
                  (tech) => ActionChip(
                    backgroundColor: myLightColorScheme.primaryContainer,
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        tech.name,
                        style: AppTextStyles.textMSemiBold(
                            color: myLightColorScheme.onPrimaryContainer),
                      ),
                    ),
                    onPressed: () => CoreUtils.launchURL(tech.url),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 48),
          project.playStoreUrl != null
              ? buttonStore(context, "Play Store", MyAssets.icPlayStore, () {
                  CoreUtils.launchURL(project.playStoreUrl!);
                })
              : const SizedBox(),
          const SizedBox(height: 16),
          project.appStoreUrl != null
              ? buttonStore(context, "App Store", MyAssets.icAppStore, () {
                  CoreUtils.launchURL(project.playStoreUrl!);
                })
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget buttonStore(
      BuildContext context, String label, String assetPath, Function() onTap) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      focusColor: myLightColorScheme.primary.withOpacity(0.5),
      child: Align(
        child: FittedBox(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.09,
                vertical: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: myLightColorScheme.primary, width: 2),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8)),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SvgPicture.asset(
                  assetPath,
                  width: 28,
                  height: 28,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  label,
                  style: AppTextStyles.textMSemiBold(
                      color: myLightColorScheme.primary),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
