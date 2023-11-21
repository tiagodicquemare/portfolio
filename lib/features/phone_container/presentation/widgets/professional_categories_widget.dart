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
  final categories = ['Bio', 'CV', 'Stack technique', 'Recommandation'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        const Text("Dicquemare Solution",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(
          height: 48,
        ),
        ListView.separated(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: ((context, index) {
              return categoryWidget(categories[index], index);
            }),
            separatorBuilder: ((context, index) {
              return const SizedBox(
                height: 24,
              );
            })),
      ],
    );
  }

  Widget categoryWidget(String category, int index) {
    return InkWell(
      onTap: () {
        BlocProvider.of<PhoneContainerBloc>(context)
            .add(ShowProfessionalCategoriesEvent(category: index + 1));
      },
      child: Container(
        height: 100,
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
