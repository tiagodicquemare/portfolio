import 'package:flutter/material.dart';

class ContactMeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactMeWidgetState();
}

class _ContactMeWidgetState extends State<ContactMeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Contacter contenu")],
      ),
    );
  }
}
