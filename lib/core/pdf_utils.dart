import 'dart:html' as html;

import 'package:flutter/services.dart';

class PdfUtils {
  static void downloadPdf(String filepath, String fileName) async {
    final pdfData = await loadPdfFromAssets(filepath);
    final blob = html.Blob([pdfData], 'application/pdf');

    final url = html.Url.createObjectUrlFromBlob(blob);

    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", fileName)
      ..click();

    html.Url.revokeObjectUrl(url);
  }

  static Future<Uint8List> loadPdfFromAssets(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);
    return byteData.buffer.asUint8List();
  }
}
