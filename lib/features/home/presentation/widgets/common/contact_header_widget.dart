import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:dicquemare_solution/languages/languages.dart';
import 'package:flutter/material.dart';

class ContactHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(Languages.of(context).contactMeTitle,
            style: AppTextStyles.textLargeTitleSemiBold(
                color: myLightColorScheme.onBackground)),
        const SizedBox(height: 24),
        Text(Languages.of(context).contactMeDescription,
            style:
                AppTextStyles.textLRegular(color: myLightColorScheme.outline)),
        const SizedBox(height: 36),
      ],
    );
  }
}
