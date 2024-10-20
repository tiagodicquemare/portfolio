import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/pdf_utils.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:flutter/material.dart';

class ChronologyEvent {
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final String description;

  ChronologyEvent(
      {required this.title,
      required this.startDate,
      required this.endDate,
      required this.description});
}

class MyChronologyWidget extends StatelessWidget {
  List<ChronologyEvent> listEvents = [
    ChronologyEvent(
        title: "Développeur Android Lydia Freelance",
        startDate: DateTime(2024, 1, 3),
        endDate: DateTime(2024, 9, 3),
        description:
            "Participer activement dans le développement de l'application bancaire Lydia au sein d'une des équipes de l'entreprise"),
    ChronologyEvent(
        title: "Développeur Android MyJungly Freelance",
        startDate: DateTime(2023, 1, 15),
        endDate: DateTime(2023, 12, 15),
        description:
            "Participer activement dans le développement de l'application bancaire Delupay au sein d'une des équipes de l'entreprise"),
    ChronologyEvent(
        title: "Développeur Android Lydia Freelance",
        startDate: DateTime(2021, 9, 1),
        endDate: DateTime(2022, 9, 3),
        description:
            "Participer activement dans le développement de l'application bancaire Lydia au sein d'une des équipes de l'entreprise")
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.1),
      child: SingleChildScrollView(
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
            const SizedBox(height: 32),
            Text(
              "Chronologie",
              style: AppTextStyles.textXLSemiBold(
                  color: myLightColorScheme.outline),
            ),
            const SizedBox(
              height: 24,
            ),
            buildListChronology(context)
          ],
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
              context, listEvents[index], index != listEvents.length - 1);
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
      height: 150,
      width: MediaQuery.sizeOf(context).width * 0.2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: myLightColorScheme.outline),
                width: 24,
                height: 24,
              ),
              lastItem
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${event.startDate.year} ${event.title}",
                  style: AppTextStyles.textXLSemiBold(
                      color: myLightColorScheme.outline),
                ),
                const SizedBox(
                  height: 8,
                ),
                Flexible(
                  child: Text(
                    event.description,
                    style: AppTextStyles.textMRegular(
                        color: myLightColorScheme.outline),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
