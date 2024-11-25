import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ext/date_ext.dart';
import 'package:dicquemare_solution/core/pdf_utils.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:dicquemare_solution/languages/languages.dart';
import 'package:flutter/material.dart';

class ChronologyEvent {
  final String companyName;
  final String titlePost;
  final DateTime startDate;
  final DateTime endDate;
  final String description;

  ChronologyEvent(
      {required this.companyName,
      required this.titlePost,
      required this.startDate,
      required this.endDate,
      required this.description});
}

class MyChronologyWidget extends StatelessWidget {
  bool firstInit = true;
  List<ChronologyEvent> listEvents = [];

  @override
  Widget build(BuildContext context) {
    if (firstInit) {
      firstInit = false;
      listEvents = [
        ChronologyEvent(
            companyName: "Lydia Solutions",
            titlePost: Languages.of(context).chronologyLydia2024Post,
            startDate: DateTime(2024, 1, 3),
            endDate: DateTime(2024, 9, 3),
            description: Languages.of(context).chronologyLydia2024Description),
        ChronologyEvent(
            companyName: "My Jungly",
            titlePost: Languages.of(context).chronologyMyJungly2023Post,
            startDate: DateTime(2023, 1, 15),
            endDate: DateTime(2023, 12, 15),
            description:
                Languages.of(context).chronologyMyJungly2023Description),
        ChronologyEvent(
            companyName: "Pleko",
            titlePost: Languages.of(context).chronologyPleko2021Post,
            startDate: DateTime(2021, 10, 1),
            endDate: DateTime(2023, 7, 1),
            description: Languages.of(context).chronologyPleko2021Description),
        ChronologyEvent(
            companyName: "Lydia Solutions",
            titlePost: Languages.of(context).chronologyLydia2021Post,
            startDate: DateTime(2021, 9, 1),
            endDate: DateTime(2022, 9, 6),
            description: Languages.of(context).chronologyLydia2021Description),
        ChronologyEvent(
            companyName: "Freshdev!",
            titlePost: Languages.of(context).chronologyFreshDev2020Post,
            startDate: DateTime(2020, 9, 1),
            endDate: DateTime(2021, 9, 1),
            description:
                Languages.of(context).chronologyFreshDev2020Description),
        ChronologyEvent(
            companyName: "Freshdev!",
            titlePost: Languages.of(context).chronologyFreshDev2018Post,
            startDate: DateTime(2018, 9, 1),
            endDate: DateTime(2020, 9, 1),
            description:
                Languages.of(context).chronologyFreshDev2018Description),
        ChronologyEvent(
            companyName: "Junior Miage Concept",
            titlePost: Languages.of(context).chronologyJMC2018Post,
            startDate: DateTime(2018, 3, 1),
            endDate: DateTime(2020, 3, 1),
            description: Languages.of(context).chronologyJMC2018Description),
      ];
    }
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width *
              (CoreUtils.isSmallScreen(context) ? 0.05 : 0.07)),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Mon parcours",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textLargeTitleSemiBold(
                          color: myLightColorScheme.tertiary),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        PdfUtils.downloadPdf(
                            MyAssets.frenchCV, MyAssets.frenchCV);
                      },
                      focusColor: myLightColorScheme.primary.withOpacity(0.5),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: myLightColorScheme.primary, width: 2),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              MyAssets.icDownload,
                              width: 18,
                              height: 18,
                              color: myLightColorScheme.primary,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "CV Français",
                              style: AppTextStyles.textMSemiBold(
                                  color: myLightColorScheme.primary),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: InkWell(
                      focusColor: myLightColorScheme.primary.withOpacity(0.5),
                      onTap: () {
                        PdfUtils.downloadPdf(
                            MyAssets.englishCV, MyAssets.englishCV);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: myLightColorScheme.primary, width: 2),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              MyAssets.icDownload,
                              width: 18,
                              height: 18,
                              color: myLightColorScheme.primary,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "CV Anglais",
                              style: AppTextStyles.textMSemiBold(
                                  color: myLightColorScheme.primary),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                "Chronologie",
                style: AppTextStyles.textXLSemiBold(
                    color: myLightColorScheme.outline),
              ),
              const SizedBox(
                height: 12,
              ),
              buildListChronology(context),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListChronology(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return buildChronologyItem(
              context, listEvents[index], index == listEvents.length - 1);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 0,
          );
        },
        itemCount: listEvents.length);
  }

  Widget buildChronologyItem(
      BuildContext context, ChronologyEvent event, bool lastItem) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.2,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: myLightColorScheme.outline),
                  width: 20,
                  height: 20,
                ),
                !lastItem
                    ? Expanded(
                        child: Container(
                          width: 4,
                          color: myLightColorScheme.outline,
                        ),
                      )
                    : const SizedBox()
              ],
            ),
            const SizedBox(
              width: 24,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.companyName,
                    style: AppTextStyles.textXLSemiBold(
                        color: myLightColorScheme.outline),
                  ),
                  Text(
                    event.titlePost,
                    style: AppTextStyles.textMSemiBold(
                        color: myLightColorScheme.outline),
                  ),
                  Text(
                    "${event.startDate.toMonthLiteral(Localizations.localeOf(context))} ${event.startDate.year} - ${event.endDate.toMonthLiteral(Localizations.localeOf(context))} ${event.endDate.year} ",
                    style: AppTextStyles.textMRegular(
                        color: myLightColorScheme.outline),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    event.description,
                    softWrap: true,
                    style: AppTextStyles.textMRegular(
                        color: myLightColorScheme.outline),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
