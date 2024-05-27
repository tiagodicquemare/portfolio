import 'dart:convert';
import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class ContactMeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactMeWidgetState();
}

class _ContactMeWidgetState extends State<ContactMeWidget> {
  final _formKey = GlobalKey<FormState>();
  final textEmailController = TextEditingController();
  final textNameController = TextEditingController();
  final textMessageController = TextEditingController();
  String email = '';
  String name = '';
  String body = '';
  bool isCaptchaVerified = false;

  void _sendEmail() async {
    if (_formKey.currentState!.validate()) {
      print("Sending email... $email / $name / $body");
      var data = {
        'service_id': 'service_clno53l',
        'template_id': 'template_6lllgqi',
        'user_id': '0Og795QzSkDJfg5gp',
        'template_params': {
          'from_name': name,
          'to_name': "Tiago",
          'message': body,
          'reply_to': email,
        }
      };
      var response = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // Handle successful email sending
        print("Email sent!");
      } else {
        // Handle failure
        print("Failed to send email.");
      }
    }
  }

  @override
  void initState() {
    super.initState();

    textEmailController.text = "estee.desanctis@gmail.com";
    email = textEmailController.text;
    textNameController.text = "Estée";
    name = textNameController.text;
    textMessageController.text = "Test hello worlds";
    body = textMessageController.text;
  }

  // RecaptchaV2Controller recaptchaV2Controller = RecaptchaV2Controller();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        decoration: BoxDecoration(
            color: myLightColorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Contacter",
                  style: AppTextStyles.textTitle32(
                      color: myLightColorScheme.onBackground)),
              const SizedBox(height: 24),
              Text(
                  "Vous pouvez me contacter avec le formulaire ci-dessous ou sinon via email ou téléphone directement. Vous pouvez aussi me suivre sur les réseaux",
                  style: AppTextStyles.textLRegular(
                      color: myLightColorScheme.onBackground)),
              const SizedBox(height: 36),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: textEmailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        print("Email changed: $value");
                        email = value;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: textNameController,
                      decoration: InputDecoration(labelText: 'Name'),
                      onChanged: (value) => name = value!,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: textMessageController,
                      decoration: InputDecoration(
                        labelText: 'Email Body',
                        border:
                            const OutlineInputBorder(), // Adds a border around the text field
                        alignLabelWithHint:
                            true, // Aligns the label at the top when the text field is multi-line
                        fillColor: Colors.blue
                            .withOpacity(0.1), // Transparent highlight color
                      ),
                      maxLines:
                          15, // Allows the text field to grow up to 10 lines
                      minLines: 8, // Sets the minimum number of lines to 5
                      onChanged: (value) => body = value,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _sendEmail,
                      child: Text('Send Email'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
