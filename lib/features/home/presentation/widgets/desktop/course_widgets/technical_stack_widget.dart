import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:dicquemare_solution/features/home/domain/entities/category_section_skills.dart';
import 'package:dicquemare_solution/features/home/domain/entities/project.dart';
import 'package:dicquemare_solution/features/home/presentation/projects.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/course_widgets/skill_section_widget.dart';
import 'package:flutter/material.dart';

class TechnicalStackWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TechnicalStackWidgetState();
}

class TechnicalStackWidgetState extends State<TechnicalStackWidget> {
  int _expandedContainer = -1;
  int _lastExpandedContainer = -1;
  bool expandContent = false;

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

    List<Widget> containers = [
      _buildContainer(0, firstContainerExpanded, true, true, false),
      _buildContainer(1, secondContainerExpanded, false, true, false),
      _buildContainer(2, thirdContainerExpanded, true, false, true),
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

    return Stack(
      children: containers,
    );
  }

  Widget _buildContainer(int index, bool isExpanded, bool left, bool top,
      bool unexpandedWitdhFull) {
    double availableWidth = MediaQuery.of(context).size.width -
        CoreUtils.getPhoneScreenWidth(context) -
        24;
    double availableHeight = CoreUtils.getPhoneScreenHeight(context) + 72;
    double spacingHorizontal = 144;
    double spacingVertical = 64;

    double heightContainerUnexpanded =
        availableHeight / 2 - spacingVertical / 2 - 16;
    double heightContainerExpanded = availableHeight - spacingVertical;

    double widthContainerUnexpanded = unexpandedWitdhFull
        ? availableWidth - spacingHorizontal
        : availableWidth / 2 - spacingHorizontal / 2 - 16;
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
          padding: const EdgeInsets.all(32),
          alignment: isExpanded ? Alignment.topCenter : Alignment.center,
          onEnd: () {
            setState(() {
              expandContent = isExpanded;
            });
          },
          decoration: BoxDecoration(
              color: myLightColorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: myLightColorScheme.primary, width: 2)
              /*image: DecorationImage(
                  image: section.backgroundImage, fit: BoxFit.cover)*/
              ),
          height:
              isExpanded ? heightContainerExpanded : heightContainerUnexpanded,
          width: isExpanded ? widthContainerExpanded : widthContainerUnexpanded,
          child: expandContent && isExpanded
              ? CategorySkillsSectionWidget(
                  categorySkillsSection: mySkillsCategories[index],
                )
              : Text(mySkillsCategories[index].title,
                  style: AppTextStyles.textXXLBold(
                      color: myLightColorScheme.primary)),
        ),
      ),
    );
  }
}
