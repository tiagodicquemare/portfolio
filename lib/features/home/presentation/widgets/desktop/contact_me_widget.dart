import 'package:dicquemare_solution/features/home/presentation/widgets/common/contact_form.dart';

import 'package:flutter/material.dart';

class ContactMeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactMeWidgetState();
}

class _ContactMeWidgetState extends State<ContactMeWidget> {
  @override
  Widget build(BuildContext context) {
    return ContactFormWidget();
  }
}
