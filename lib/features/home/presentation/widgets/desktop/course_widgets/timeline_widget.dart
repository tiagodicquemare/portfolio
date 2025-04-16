import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/ui/hoverable_horizontal_line.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:flutter/material.dart';

class TimeLineWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TimeLineState();
}

class TimeLineState extends State<TimeLineWidget> {
  var titleBody = "";
  var dateBody = "";
  var descriptionBody = "";
  AssetImage? bodyImage;

  @override
  Widget build(BuildContext context) {
    double availableWidth = MediaQuery.of(context).size.width -
        CoreUtils.getPhoneScreenWidth(context) -
        96 -
        24;

    return Padding(
      padding: const EdgeInsets.all(48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Chronologie",
                style: TextStyle(fontSize: 32),
              ),
              const SizedBox(width: 24),
              const Text(
                "Educatif",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 8),
              buildDot(color: Colors.green),
              buildHorizontalSolidLine(48, color: Colors.green),
              buildDot(color: Colors.green),
              const SizedBox(width: 24),
              const Text(
                "Professionnelle",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 8),
              buildDot(color: Colors.blue),
              buildHorizontalSolidLine(48, color: Colors.blue),
              buildDot(color: Colors.blue),
              const SizedBox(width: 24),
              const Text(
                "Entreprenariale",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 8),
              buildDot(color: Colors.red),
              buildHorizontalSolidLine(48, color: Colors.red),
              buildDot(color: Colors.red),
            ],
          ),
          const SizedBox(height: 32),
          buildCustomTimeline(availableWidth, [
            DotDateEvent(DateTime(2015, 09),
                linkDot: true, color: Colors.green, dotText: "09/2015"),
            DotDateEvent(DateTime(2017, 09),
                linkDot: true,
                color: Colors.green,
                lineText: "DUT Informatique",
                titleBody: "DUT Informatique",
                descriptionBody: "Réalisation de mon DUT avec stage de 3 mois",
                dateBody: "Septembre 2015 à Juillet 2017",
                bodyImage: AssetImage(MyAssets.icLinkedin)),
            DotDateEvent(DateTime(2018, 09),
                linkDot: true, color: Colors.green),
            DotDateEvent(DateTime(2020, 09),
                linkDot: true, color: Colors.green, dotText: "09/2020"),
          ]),
          const SizedBox(height: 24),
          buildCustomTimeline(availableWidth, [
            DotDateEvent(DateTime(2015, 07), linkDot: false, showDot: false),
            DotDateEvent(
              DateTime(2017, 04),
              linkDot: false,
              dotText: "04/2017",
            ),
            DotDateEvent(
              DateTime(2017, 07),
              linkDot: true,
              reverse: true,
              lineText: "Stage BHTech",
            ),
            DotDateEvent(DateTime(2018, 04), linkDot: false),
            DotDateEvent(DateTime(2020, 09), linkDot: true),
            DotDateEvent(DateTime(2021, 09), linkDot: true),
            DotDateEvent(DateTime(2022, 09), linkDot: true),
            DotDateEvent(DateTime(2023, 01), linkDot: false),
            DotDateEvent(DateTime(2024, 01), linkDot: true, dotText: "01/2024"),
          ]),
          const SizedBox(height: 24),
          buildCustomTimeline(availableWidth, [
            DotDateEvent(DateTime(2015, 07),
                linkDot: false, showDot: false, color: Colors.red),
            DotDateEvent(DateTime(2018, 01),
                linkDot: false, color: Colors.red, dotText: "01/2018"),
            DotDateEvent(DateTime(2020, 03),
                linkDot: true, color: Colors.red, dotText: ""),
            DotDateEvent(DateTime(2021, 09),
                linkDot: false, color: Colors.red, dotText: ""),
            DotDateEvent(DateTime(2023, 11),
                linkDot: true, color: Colors.red, dotText: "11/2023"),
          ]),
          const SizedBox(height: 24),
          Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titleBody),
                  const SizedBox(height: 12),
                  Text(dateBody)
                ],
              ),
              const Spacer(),
              bodyImage != null
                  ? Image(
                      image: bodyImage!,
                      width: 32,
                    )
                  : Container(),
            ],
          ),
          const SizedBox(height: 16),
          Text(descriptionBody),
        ],
      ),
    );
  }

  Widget buildCustomTimeline(
    double availableWidth,
    List<DotDateEvent> listImportantDates,
  ) {
    final totalWidth = availableWidth - listImportantDates.length * 18;
    final startDate = DateTime(2015, 07);
    final endDate = DateTime(2024, 01);
    final numberOfMonths =
        (endDate.year - startDate.year) * 12 + endDate.month - startDate.month;
    
    List<Widget> listWidgets = [];
    int index = 0;
    var lastPosition = 0;

    for (DotDateEvent dateEvent in listImportantDates) {
      final positionInTimeline = (dateEvent.date.year - startDate.year) * 12 +
          dateEvent.date.month -
          startDate.month;
      final positionToCalculate = positionInTimeline - lastPosition;
      double widthLine = positionToCalculate * totalWidth / numberOfMonths;
      lastPosition = positionInTimeline;

      if (index != 0 && dateEvent.linkDot) {
        listWidgets.add(buildHorizontalSolidLine(widthLine,
            reverse: dateEvent.reverse,
            text: dateEvent.lineText,
            color: dateEvent.color, onTap: () {
          _updateBody(dateEvent);
        }));
      } else if (!dateEvent.linkDot) {
        listWidgets.add(SizedBox(width: widthLine));
      }

      if (dateEvent.showDot) {
        listWidgets.add(buildDot(color: dateEvent.color, date: dateEvent.dotText));
      } else {
        listWidgets.add(const SizedBox(width: 18));
      }

      index++;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: listWidgets,
    );
  }

  Widget buildDot({Color? color, String? date}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: color ?? Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        if (date != null && date.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              date,
              style: const TextStyle(fontSize: 12),
            ),
          ),
      ],
    );
  }

  Widget buildHorizontalSolidLine(double width,
      {bool reverse = false,
      String? text,
      Color? color,
      VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: HoverContainer(
        width: width,
        color: color ?? Colors.black,
        onTap: onTap,
      ),
    );
  }

  void _updateBody(DotDateEvent dateEvent) {
    setState(() {
      titleBody = dateEvent.titleBody ?? "";
      dateBody = dateEvent.dateBody ?? "";
      descriptionBody = dateEvent.descriptionBody ?? "";
      bodyImage = dateEvent.bodyImage;
    });
  }
}

class DotDateEvent {
  final DateTime date;
  final bool linkDot;
  final bool showDot;
  final bool reverse;
  final Color? color;
  final String? dotText;
  final String? lineText;
  final String? titleBody;
  final String? dateBody;
  final String? descriptionBody;
  final AssetImage? bodyImage;

  DotDateEvent(
    this.date, {
    this.linkDot = true,
    this.showDot = true,
    this.reverse = false,
    this.color,
    this.dotText,
    this.lineText,
    this.titleBody,
    this.dateBody,
    this.descriptionBody,
    this.bodyImage,
  });
}
