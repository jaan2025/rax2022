import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_management/Screens/pdfexport.dart';
import 'package:printing/printing.dart';

import '../model/SecondSheetModel.dart';
import '../model/subjects.dart';

class PdfPreviewPage extends StatelessWidget {
  final secondSheetModel secondsheet;
  final List<FirstClass> firstClass;
  final List<secondSheetModel> sheet;
  const PdfPreviewPage({Key? key, required this.firstClass,required this.sheet,required this.secondsheet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(firstClass,sheet,secondsheet),
      ),
    );
  }

}