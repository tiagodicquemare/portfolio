import 'package:dicquemare_solution/core/injection.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:dicquemare_solution/features/home/domain/entities/project.dart';
import 'package:dicquemare_solution/features/phone_container/presentation/bloc/phone_container_bloc.dart';
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
    return Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(38.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(38.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                    width: widthPhone,
                    color: Colors.white,
                    child: BlocBuilder<PhoneContainerBloc, PhoneContainerState>(
                        builder: (context, state) {
                      if (project != null) {
                        return ScreenshotPhoneWidget(
                            screenshots: project!.screenshots,
                            selected: selected);
                      } else if (state is ShowScreenshotState) {
                        return ScreenshotPhoneWidget(
                            screenshots: state.screenshots, selected: selected);
                      } else {
                        return const SizedBox();
                      }
                    })),
              ),
            ],
          ),
        ));
  }
}
