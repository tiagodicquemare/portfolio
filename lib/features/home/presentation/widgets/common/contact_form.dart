import 'dart:convert';

import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/common/contact_header_widget.dart';
import 'package:dicquemare_solution/languages/languages.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactFormWidget extends StatefulWidget {
  bool withHeader;

  ContactFormWidget({this.withHeader = true});

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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: CoreUtils.isSmallScreen(context) ? 16 : 32,
            horizontal: MediaQuery.sizeOf(context).width *
                (CoreUtils.isSmallScreen(context) ? 0.02 : 0.08)),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.withHeader ? ContactHeaderWidget() : const SizedBox(),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: textEmailController,
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: myLightColorScheme.outline,
                                    width: 2),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8))),
                            labelText:
                                Languages.of(context).contactMeHintEmail),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return Languages.of(context)
                                .contactMeHintErrorEmail;
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
                            labelText: Languages.of(context).contactMeHintName,
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: myLightColorScheme.outline,
                                    width: 2),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8)))),
                        onChanged: (value) => name = value!,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: textMessageController,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          labelText: Languages.of(context).contactMeHintBody,
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
                        style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(MediaQuery.sizeOf(context).width * 0.25, 56),
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              MyAssets.icSend,
                              width: 20,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              Languages.of(context).contactMeHintSendButton,
                              style:
                                  AppTextStyles.textLBold(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
