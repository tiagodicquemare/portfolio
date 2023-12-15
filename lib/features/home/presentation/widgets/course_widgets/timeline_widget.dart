import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/ui/hoverable_horizontal_line.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

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
    print("First available width -> $availableWidth");
    return Padding(
      padding: const EdgeInsets.all(48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Chronologie",
                style: TextStyle(fontSize: 32),
              ),
              const SizedBox(
                width: 24,
              ),
              Text(
                "Educatif",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                width: 8,
              ),
              buildDot(color: Colors.red),
              buildHorizontalSolidLine(48, color: Colors.red),
              buildDot(color: Colors.red),
              const SizedBox(
                width: 24,
              ),
              Text(
                "Professionnelle",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                width: 8,
              ),
              buildDot(color: Colors.blue),
              buildHorizontalSolidLine(48, color: Colors.blue),
              buildDot(color: Colors.blue),
              const SizedBox(
                width: 24,
              ),
              Text(
                "Entreprenariale",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                width: 8,
              ),
              buildDot(color: Colors.green),
              buildHorizontalSolidLine(48, color: Colors.green),
              buildDot(color: Colors.green),
            ],
          ),
          buildTimeline(availableWidth, [
            DotDateEvent(DateTime(2015, 09),
                linkDot: true, color: Colors.green, textToShow: "09/2015"),
            DotDateEvent(DateTime(2017, 09),
                linkDot: true,
                color: Colors.green,
                titleBody: "DUT Informatique",
                descriptionBody: "Réalisation de mon DUT avec stage de 3 mois",
                dateBody: "Septembre 2015 à Juillet 2017",
                bodyImage: AssetImage(MyAssets.icLinkedin)),
            DotDateEvent(DateTime(2018, 09),
                linkDot: true, color: Colors.green),
            DotDateEvent(DateTime(2020, 09),
                linkDot: true, color: Colors.green, textToShow: "09/2020"),
          ]),
          buildTimeline(availableWidth, [
            DotDateEvent(DateTime(2015, 07), linkDot: false, showDot: false),
            DotDateEvent(DateTime(2017, 04),
                linkDot: false, textToShow: "04/2017"),
            DotDateEvent(DateTime(2017, 07), linkDot: true),
            DotDateEvent(DateTime(2018, 04), linkDot: false),
            DotDateEvent(DateTime(2020, 09), linkDot: true),
            DotDateEvent(DateTime(2021, 09), linkDot: true),
            DotDateEvent(DateTime(2022, 09), linkDot: true),
            DotDateEvent(DateTime(2023, 01), linkDot: false),
            DotDateEvent(DateTime(2024, 01),
                linkDot: true, textToShow: "01/2024"),
          ]),
          const SizedBox(height: 24),
          buildTimeline(availableWidth, [
            DotDateEvent(DateTime(2015, 07),
                linkDot: false, showDot: false, color: Colors.red),
            DotDateEvent(DateTime(2018, 01),
                linkDot: false, color: Colors.red, textToShow: "01/2018"),
            DotDateEvent(DateTime(2020, 03),
                linkDot: true, color: Colors.red, textToShow: ""),
            DotDateEvent(DateTime(2021, 09),
                linkDot: false, color: Colors.red, textToShow: ""),
            DotDateEvent(DateTime(2023, 11),
                linkDot: true, color: Colors.red, textToShow: "11/2023"),
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
              Spacer(),
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

  Widget buildTimeline(
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
    print("Available width -> $availableWidth //// Total width -> $totalWidth");
    var lastPosition = 0;
    for (DotDateEvent dateEvent in listImportantDates) {
      final positionInTimeline = (dateEvent.date.year - startDate.year) * 12 +
          dateEvent.date.month -
          startDate.month;
      final positionToCalculate = positionInTimeline - lastPosition;
      double widthLine = positionToCalculate * totalWidth / numberOfMonths;
      lastPosition = positionInTimeline;
      print(
          "positionInTimeline -> $positionInTimeline /// widthLine -> $widthLine");
      if (index != 0 && dateEvent.linkDot) {
        listWidgets.add(buildHorizontalSolidLine(widthLine,
            color: dateEvent.color, onTap: () {
          setState(() {
            titleBody = dateEvent.titleBody;
            dateBody = dateEvent.dateBody;
            descriptionBody = dateEvent.descriptionBody;
            bodyImage = dateEvent.bodyImage;
          });
        }));
      } else if (!dateEvent.linkDot) {
        listWidgets.add(SizedBox(
          width: widthLine,
        ));
      }

      if (dateEvent.showDot) {
        listWidgets
            .add(buildDot(color: dateEvent.color, date: dateEvent.textToShow));
      } else {
        listWidgets.add(const SizedBox(
          width: 18,
        ));
      }

      index++;
    }
    return SizedBox(
      width: availableWidth,
      child: Row(
        children: [...listWidgets],
      ),
    );
  }

  Widget buildDot({String date = "", Color color = Colors.blue}) {
    return SizedBox(
      width: 18,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UnconstrainedBox(
            child: Text(
              date,
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            date,
            maxLines: 1,
            overflow: TextOverflow.visible,
            style: TextStyle(color: Colors.transparent),
          ),
        ],
      ),
    );
  }

  Widget buildHorizontalSolidLine(double width,
      {String text = "",
      Color color = Colors.blue,
      bool textOnTop = true,
      Function()? onTap}) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: Text(text)),
          HoverContainer(
            width: width,
            color: color,
            onTap: onTap,
          ),
          Flexible(
              child: Text(
            text,
            style: TextStyle(color: Colors.transparent),
          )),
        ],
      ),
    );
  }
}

class DotDateEvent {
  DateTime date;
  String textToShow = "";
  bool linkDot = true;
  bool showDot = true;
  Color color = Colors.blue;
  String titleBody = "";
  String dateBody = "";
  String descriptionBody = "";
  AssetImage? bodyImage;

  DotDateEvent(this.date,
      {this.textToShow = "",
      this.linkDot = true,
      this.showDot = true,
      this.color = Colors.blue,
      this.titleBody = "",
      this.dateBody = "",
      this.descriptionBody = "",
      this.bodyImage});
}
