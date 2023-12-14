import 'dart:convert';
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
      padding: const EdgeInsets.all(48),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Contacter", style: TextStyle(fontSize: 32)),
        const SizedBox(height: 32),
        Text(
            "Vous pouvez me contacter avec le formulaire ci-dessous ou sinon via email ou téléphone directement. Vous pouvez aussi me suivre sur les réseaux",
            style: TextStyle(fontSize: 20)),
        const SizedBox(height: 48),
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
              TextFormField(
                controller: textNameController,
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) => name = value!,
              ),
              TextFormField(
                controller: textMessageController,
                decoration: InputDecoration(labelText: 'Body'),
                onChanged: (value) => body = value!,
              ),
              /*RecaptchaV2(
                apiKey:
                    "YOUR_RECAPTCHA_SITE_KEY", // Get this from Google reCAPTCHA
                apiSecret:
                    "YOUR_RECAPTCHA_SECRET_KEY", // Get this from Google reCAPTCHA
                controller: recaptchaV2Controller,
                onVerified: (success) {
                  setState(() {
                    isCaptchaVerified = success;
                  });
                },
              ),*/
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _sendEmail,
                child: Text('Send Email'),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
