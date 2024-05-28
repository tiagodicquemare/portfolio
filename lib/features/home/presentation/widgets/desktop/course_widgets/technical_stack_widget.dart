import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:dicquemare_solution/features/home/domain/entities/project.dart';
import 'package:dicquemare_solution/features/home/presentation/projects.dart';
import 'package:flutter/material.dart';

class TechnicalStackWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TechnicalStackWidgetState();
}

class TechnicalStackWidgetState extends State<TechnicalStackWidget> {
  int _expandedContainer = -1;
  int _lastExpandedContainer = -1;

  int _getContainerIndex(Widget container) {
    if (container.key != null && container.key is ValueKey<String>) {
      return int.parse((container.key as ValueKey<String>).value);
    }
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    bool firstContainerExpanded = _expandedContainer == 0;
    bool secondContainerExpanded = _expandedContainer == 1;
    bool thirdContainerExpanded = _expandedContainer == 2;
    bool fourthContainerExpanded = _expandedContainer == 3;

    List<Widget> containers = [
      _buildContainer(
        0,
        firstContainerExpanded,
        true,
        true,
        ContentSection("Développement Android",
            const AssetImage(MyAssets.androidContentBackground),
            description:
                "Je développe des applications Android depuis 2015. J'ai commencé avec Java et Kotlin, puis j'ai découvert Flutter en 2019. J'ai développé plusieurs applications Android natives, et je développe actuellement une application Flutter pour une startup. J'ai également développé des applications Android pour des clients en freelance.",
            listTechnologies: [
              mapOfTechnologies["Android"]!,
              mapOfTechnologies["Android"]!,
              mapOfTechnologies["Android"]!,
            ]),
      ),
      _buildContainer(
          1,
          secondContainerExpanded,
          false,
          true,
          ContentSection("Développement Flutter",
              const AssetImage(MyAssets.flutterContentBackground),
              description:
                  "Je développe des applications Android depuis 2015. J'ai commencé avec Java et Kotlin, puis j'ai découvert Flutter en 2019. J'ai développé plusieurs applications Android natives, et je développe actuellement une application Flutter pour une startup. J'ai également développé des applications Android pour des clients en freelance.",
              listTechnologies: [
                mapOfTechnologies["Android"]!,
              ])),
      _buildContainer(
          2,
          thirdContainerExpanded,
          true,
          false,
          ContentSection(
              "UI/UX Design", const AssetImage(MyAssets.uiUxContentBackground),
              description:
                  "Je développe des applications Android depuis 2015. J'ai commencé avec Java et Kotlin, puis j'ai découvert Flutter en 2019. J'ai développé plusieurs applications Android natives, et je développe actuellement une application Flutter pour une startup. J'ai également développé des applications Android pour des clients en freelance.",
              listTechnologies: [
                mapOfTechnologies["Android"]!,
              ])),
      _buildContainer(
          3,
          fourthContainerExpanded,
          false,
          false,
          ContentSection("Compétences managériales",
              const AssetImage(MyAssets.softSkillsContentBackground),
              description:
                  "Je développe des applications Android depuis 2015. J'ai commencé avec Java et Kotlin, puis j'ai découvert Flutter en 2019. J'ai développé plusieurs applications Android natives, et je développe actuellement une application Flutter pour une startup. J'ai également développé des applications Android pour des clients en freelance.",
              listTechnologies: [
                mapOfTechnologies["Android"]!,
              ])),
    ];

    containers.sort((a, b) {
      int indexA = _getContainerIndex(a);
      int indexB = _getContainerIndex(b);
      int indexToUse = _expandedContainer != -1
          ? _expandedContainer
          : _lastExpandedContainer;
      if (indexA == indexToUse) return 1;
      if (indexB == indexToUse) return -1;
      return indexA.compareTo(indexB);
    });

    if (_lastExpandedContainer != _expandedContainer) {
      _lastExpandedContainer = _expandedContainer;
      setState(() {});
    }

    print('last expanded container: $_lastExpandedContainer');
    print("Last widget container: ${_getContainerIndex(containers.first)}");
    return Stack(
      children: containers,
    );
  }

  Widget _buildContainer(
      int index, bool isExpanded, bool left, bool top, ContentSection section) {
    double availableWidth = MediaQuery.of(context).size.width -
        CoreUtils.getPhoneScreenWidth(context) -
        24;
    double availableHeight = CoreUtils.getPhoneScreenHeight(context) + 72;
    double spacingHorizontal = 144;
    double spacingVertical = 64;

    double heightContainerUnexpanded =
        availableHeight / 2 - spacingVertical / 2 - 16;
    double heightContainerExpanded = availableHeight - spacingVertical;

    double widthContainerUnexpanded =
        availableWidth / 2 - spacingHorizontal / 2 - 16;
    double widthContainerExpanded = availableWidth - spacingHorizontal;
    return Positioned(
      key: Key(index.toString()),
      left: left ? spacingHorizontal / 2 : null,
      right: left ? null : spacingHorizontal / 2,
      top: top ? spacingVertical / 2 : null,
      bottom: top ? null : spacingVertical / 2,
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (isExpanded)
              _expandedContainer = -1;
            else
              _expandedContainer = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: section.backgroundImage, fit: BoxFit.cover)),
          height:
              isExpanded ? heightContainerExpanded : heightContainerUnexpanded,
          width: isExpanded ? widthContainerExpanded : widthContainerUnexpanded,
          child: isExpanded
              ? expandedSectionItem(section)
              : Text(section.title,
                  style: TextStyle(color: Colors.white, fontSize: 24)),
        ),
      ),
    );
  }

  Widget expandedSectionItem(ContentSection section) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 32),
          Text(
            section.description,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView.builder(
                itemCount: section.listTechnologies.length,
                itemBuilder: (context, index) {
                  return Text(
                    section.listTechnologies[index].name,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class ContentSection {
  String title;
  String description;
  AssetImage backgroundImage;
  List<Technologie> listTechnologies;

  ContentSection(this.title, this.backgroundImage,
      {this.description = "", this.listTechnologies = const []});
}
