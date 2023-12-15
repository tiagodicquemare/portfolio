import 'package:dicquemare_solution/core/injection.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:dicquemare_solution/features/home/domain/entities/project.dart';
import 'package:dicquemare_solution/features/phone_container/presentation/bloc/phone_container_bloc.dart';
import 'package:dicquemare_solution/features/phone_container/presentation/widgets/contact_additional_info.dart';
import 'package:dicquemare_solution/features/phone_container/presentation/widgets/professional_categories_widget.dart';
import 'package:dicquemare_solution/features/phone_container/presentation/widgets/screenshot_phone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmartphoneWidget extends StatelessWidget {
  Project? project;
  int selectedScreenshot = 0;
  bool selected;

  SmartphoneWidget({this.project, this.selected = true});

  @override
  Widget build(BuildContext context) {
    final widthPhone = CoreUtils.getPhoneScreenWidth(context);
    final heightPhone = CoreUtils.getPhoneScreenHeight(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: widthPhone,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 6, right: 6, top: 6, bottom: 12),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    width: widthPhone - 12,
                    height: heightPhone - 12,
                    color: Colors.white,
                    child: BlocBuilder<PhoneContainerBloc, PhoneContainerState>(
                      builder: (context, state) {
                        if (project != null) {
                          return ScreenshotPhoneWidget(
                              screenshots: project!.screenshots,
                              selected: selected);
                        } else if (state is ShowProfessionalCategoriesState) {
                          return ProfessionalCategoriesWidget(
                            category: state.category,
                          );
                        } else if (state is ShowAdditionalContactInfoState) {
                          return ContactAdditionalInfoWidget();
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    top: 12,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                    ))
              ],
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: heightPhone / 4,
            ),
            Container(
              height: heightPhone / 16,
              width: 3,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4)),
                  color: Colors.black),
            ),
            SizedBox(
              height: heightPhone / 24,
            ),
            Container(
              height: heightPhone / 8,
              width: 3,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4)),
                  color: Colors.black),
            )
          ],
        )
      ],
    );
  }
}
