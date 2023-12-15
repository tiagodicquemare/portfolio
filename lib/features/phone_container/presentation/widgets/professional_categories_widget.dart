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
  final categories = [
    'Introduction',
    'Chronologie',
    'Curriculum Vitae',
    'Stack technique',
    'Recommandations'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 48,
          ),
          Text(" Catégories",
              style: AppTextStyles.textXXLSemiBold(color: Colors.black)),
          const SizedBox(
            height: 24,
          ),
          ListView.separated(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: ((context, index) {
              return newCategoryWidget(categories[index], index);
            }),
            separatorBuilder: ((context, index) {
              return const SizedBox(
                height: 24,
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget newCategoryWidget(String category, int index) {
    return InkWell(
      onTap: () {
        BlocProvider.of<PhoneContainerBloc>(context)
            .add(ShowProfessionalCategoriesEvent(category: index + 1));
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
              width: 32,
            ),
            Text(
              category,
              style: AppTextStyles.textLRegular(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }

  Widget categoryWidget(String category, int index) {
    return InkWell(
      onTap: () {
        BlocProvider.of<PhoneContainerBloc>(context)
            .add(ShowProfessionalCategoriesEvent(category: index + 1));
      },
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(
            top: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
            bottom: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            const SizedBox(
              width: 32,
            ),
            Text(
              category,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
