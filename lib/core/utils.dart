import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class CoreUtils {
  static getPhoneScreenWidth(BuildContext context) {
    return getPhoneScreenHeight(context) / (20 / 9);
  }

  static getPhoneScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height - 64 - 56;
  }

  static void launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  static void copyToClipboard(String textToCopy) {
    Clipboard.setData(ClipboardData(text: textToCopy)).then((_) {
      Fluttertoast.showToast(
        msg: "Text copié !",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[800],
        textColor: Colors.white,
        fontSize: 16.0,
        webPosition: "center",
      );
    });
  }
}

int getRealIndex(int position, int base, int? length) {
  final int offset = position - base;
  return remainder(offset, length);
}

int remainder(int input, int? source) {
  if (source == 0) return 0;
  final int result = input % source!;
  return result < 0 ? source + result : result;
}
