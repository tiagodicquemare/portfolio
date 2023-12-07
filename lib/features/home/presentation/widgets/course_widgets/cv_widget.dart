import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/pdf_utils.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CVWidget extends StatefulWidget {
  @override
  _CVWidget createState() => _CVWidget();
}

class _CVWidget extends State<CVWidget> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  bool frenchCVSelected = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double heightDocument = CoreUtils.getPhoneScreenHeight(context) - 48;
    final double widthDocument = heightDocument * 0.707; // ratio A4

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                frenchCVSelected
                    ? MyAssets.screenshotFrenchCV
                    : MyAssets.screenshotEnglishCV,
                width: widthDocument,
                height: heightDocument,
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: InkWell(
                      onTap: () {
                        _showFullScreenModal(context);
                      },
                      child: const Image(
                        image: AssetImage(MyAssets.icZoom),
                        height: 50,
                      )),
                ),
              ),
            ],
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    frenchCVSelected = true;
                  });
                },
                child: Container(
                  height: 100,
                  width: widthDocument,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 4),
                      borderRadius: BorderRadius.circular(15.0),
                      color: frenchCVSelected
                          ? Colors.blue.withOpacity(0.7)
                          : Colors.white),
                  child: Text(
                    "CV en français",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: frenchCVSelected ? Colors.white : Colors.blue),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    frenchCVSelected = false;
                  });
                },
                child: Container(
                  height: 100,
                  width: widthDocument,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 4),
                      borderRadius: BorderRadius.circular(15.0),
                      color: frenchCVSelected
                          ? Colors.white
                          : Colors.blue.withOpacity(0.7)),
                  child: Text(
                    "CV en anglais",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: frenchCVSelected ? Colors.blue : Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () async {
                  PdfUtils.downloadPdf(
                      frenchCVSelected ? MyAssets.frenchCV : MyAssets.englishCV,
                      frenchCVSelected
                          ? MyAssets.frenchCV
                          : MyAssets.englishCV);
                },
                child: Container(
                  height: 80,
                  width: widthDocument / 2,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 4),
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.blueGrey),
                  child: const Text(
                    "Télécharger CV",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  void _showFullScreenModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Full screen semi-transparent background
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )),
              // Centered white blank page
              Container(
                height: MediaQuery.of(context).size.height * 0.95,
                width: MediaQuery.of(context).size.height * 0.95 * 0.707,
                child: SfPdfViewer.asset(
                  frenchCVSelected ? MyAssets.frenchCV : MyAssets.englishCV,
                  key: _pdfViewerKey,
                  onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
                    print(details.description);
                  },
                ),
                // Your content here
              ),
            ],
          ),
        );
      },
    );
  }
}
