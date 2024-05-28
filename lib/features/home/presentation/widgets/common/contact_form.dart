import 'dart:convert';

import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactFormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactFormWidgeState();
}

class _ContactFormWidgeState extends State<ContactFormWidget> {
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

    textEmailController.text = "";
    email = textEmailController.text;
    textNameController.text = "";
    name = textNameController.text;
    textMessageController.text = "";
    body = textMessageController.text;
  }

  @override
  Widget build(BuildContext context) {
    print("Locale is: ${Localizations.localeOf(context)}");
    var translator = AppLocalizations.of(context)!;
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
              Text(translator.contact_me_title,
                  style: AppTextStyles.textTitle32(
                      color: myLightColorScheme.onBackground)),
              const SizedBox(height: 24),
              Text(translator.contact_me_description,
                  style: AppTextStyles.textLRegular(
                      color: myLightColorScheme.onBackground)),
              const SizedBox(height: 36),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: textEmailController,
                      decoration: InputDecoration(
                          labelText: translator.contact_me_hint_email),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return translator.contact_me_hint_error_email;
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
                      decoration: InputDecoration(
                          labelText: translator.contact_me_hint_name),
                      onChanged: (value) => name = value!,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: textMessageController,
                      decoration: InputDecoration(
                        labelText: translator.contact_me_hint_body,
                        border: const OutlineInputBorder(),
                        alignLabelWithHint: true,
                        fillColor: Colors.blue.withOpacity(0.1),
                      ),
                      maxLines: 15,
                      minLines: 8,
                      onChanged: (value) => body = value,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _sendEmail,
                      child: Text(translator.contact_me_hint_send_button),
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
