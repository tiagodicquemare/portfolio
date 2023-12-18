import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:dicquemare_solution/features/phone_container/presentation/bloc/phone_container_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfessionalCategoriesWidget extends StatefulWidget {
  final int category;
  const ProfessionalCategoriesWidget({Key? key, required this.category})
      : super(key: key);

  @override
  _ProfessionalCategoriesWidgetState createState() =>
      _ProfessionalCategoriesWidgetState();
}

class _ProfessionalCategoriesWidgetState
    extends State<ProfessionalCategoriesWidget> {
  int selectedCategory = 0;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.category - 1;
  }

  final categories = [
    'Introduction',
    'Chronologie',
    'Curriculum Vitae',
    'Stack technique',
    'Recommandations'
  ];
  final assets = [
    AssetImage(MyAssets.icProfile),
    AssetImage(MyAssets.icCalendar),
    AssetImage(MyAssets.icScroll),
    AssetImage(MyAssets.icCog),
    AssetImage(MyAssets.icRecommendation)
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 48,
            ),
            Text("Bienvenue !",
                style: AppTextStyles.textTitle26Bold(
                    color: myLightColorScheme.onSurface)),
            const SizedBox(
              height: 24,
            ),
            Text(
                "Voici mon CV interactif, cliquez sur une catégorie pour en savoir plus.",
                style: AppTextStyles.textLRegular(
                    color: myLightColorScheme.onSurface)),
            const SizedBox(
              height: 48,
            ),
            ListView.separated(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: ((context, index) {
                return categoryWidget(
                  categories[index],
                  index,
                  assets[index],
                  selectedCategory == index,
                );
              }),
              separatorBuilder: ((context, index) {
                return const SizedBox(
                  height: 24,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryWidget(
      String category, int index, AssetImage image, bool selected) {
    return InkWell(
      onTap: () {
        BlocProvider.of<PhoneContainerBloc>(context)
            .add(ShowProfessionalCategoriesEvent(category: index + 1));
        selectedCategory = index;
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 12,
            ),
            Image(
              image: image,
              width: 24,
              height: 24,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              category,
              style: AppTextStyles.textLRegular(
                  color: myLightColorScheme.onSurface),
            ),
            const Spacer(),
            selected
                ? Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                  )
                : const SizedBox(),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}
