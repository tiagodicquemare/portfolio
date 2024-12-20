import 'package:dicquemare_solution/features/home/presentation/widgets/common/contact_form.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/common/contact_header_widget.dart';
import 'package:dicquemare_solution/features/phone_container/presentation/widgets/contact_additional_info.dart';

import 'package:flutter/material.dart';

class ContactMeMobileWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactMeMobileWidgetState();
}

class _ContactMeMobileWidgetState extends State<ContactMeMobileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContactFormWidget(
          withHeader: true,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
        ContactAdditionalInfoWidget(
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ],
    );
  }
}
