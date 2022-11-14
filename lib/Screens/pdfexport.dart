
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_management/model/subjects.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../Provider/schoolNameProvider.dart';
import '../model/SecondSheetModel.dart';




  Future<Uint8List> makePdf(List<FirstClass> firstClass,List<secondSheetModel> ss,secondSheetModel sheetModel) async{
    print("SS ========> $ss");

    final imageLogo = MemoryImage((await rootBundle.load('Assets/image3.jpg')).buffer.asUint8List());
    final pdf = Document();
    pdf.addPage(
      Page(build: (context){
        return Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image(imageLogo),
                  )
                ),
                Text(
                  "TELANGANA MINORITIES RESIDENTIAL \n EDUCATIONAL INSTITUTIONS SOCIETY",
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                ),
              ],
            ),

            Column(
                children: [
                  Row(
                    children: [
                      Text('Academic Coordinator :',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text(sheetModel.NameoftheAcademicCoordinator.toString())


                    ],
                  ),
                  Row(
                    children: [
                      Text('School Name :',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text(sheetModel.NameoftheSchool.toString())


                    ],
                  ),
                  Row(
                    children: [
                      Text('District :',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text(sheetModel.District.toString())


                    ],
                  ),
                  Row(
                    children: [
                      Text('Principal Name :',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text(sheetModel.NameofthePrincipal.toString())


                    ],
                  ),
                  Row(
                    children: [
                      Text('No.of teacher presents/Total no.of teachers :',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text(sheetModel.NoOfTeachers.toString())


                    ],
                  ),
                  Row(
                    children: [
                      Text('No.of students presents/Total no.of students :',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text(sheetModel.NoofstudentspresentTotalNoofStudents.toString())


                    ],
                  ),
                  Row(
                    children: [
                      Text('In Time Bell :',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text(sheetModel.InTimeBell.toString())


                    ],
                  ),

                  Row(
                    children: [
                      Text('Lunch Bell :',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text(sheetModel.launchBell.toString())


                    ],
                  ),
                ]
            ),

            SizedBox(height: 10),

            Table(
              border: TableBorder.all(color: PdfColors.black),
              children: [
                // The first row just contains a phrase 'INVOICE FOR PAYMENT'
                TableRow(
                  children: [
                    Padding(
                      child: Text(
                        'S.NO',
                        style: Theme.of(context).header5,
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    Padding(
                      child: Text(
                        'WORKS',
                        style: Theme.of(context).header5,
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    Padding(
                      child: Text(
                        'ENGLISH',
                        style: Theme.of(context).header5,
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    Padding(
                      child: Text(
                        'MATH',
                        style: Theme.of(context).header5,
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(8),
                    ),

                    Padding(
                      child: Text(
                        'EVS',
                        style: Theme.of(context).header5,
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    Padding(
                      child: Text(
                        'SOCIAL',
                        style: Theme.of(context).header5,
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    Padding(
                      child: Text(
                        'SCIENCE',
                        style: Theme.of(context).header5,
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    Padding(
                      child: Text(
                        'HINDI',
                        style: Theme.of(context).header5,
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(8),
                    ),

                    Padding(
                      child: Text(
                        'URUDU',
                        style: Theme.of(context).header5,
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    Padding(
                      child: Text(
                        'TELUGU',
                        style: Theme.of(context).header5,
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                  ],
                ),
        ...firstClass.map(
              (e) => TableRow(
                      children: [
                        Expanded(
                          child: PaddedText(e.sno.toString()),
                          flex: 1,
                        ),
                        Expanded(
                          child: PaddedText(e.works.toString()),
                          flex: 1,
                        ),
                        Expanded(
                          child: PaddedText(e.english.toString()),
                          flex: 1,
                        ),
                        Expanded(
                          child: PaddedText(e.math.toString()),
                          flex: 1,
                        ),
                        Expanded(
                          child: PaddedText(e.evs.toString()),
                          flex: 1,
                        ),
                        Expanded(
                          child: PaddedText(e.socialStudies.toString()),
                          flex: 1,
                        ),
                        Expanded(
                          child: PaddedText(e.science.toString()),
                          flex: 1,
                        ),
                        Expanded(
                          child: PaddedText(e.hindi.toString()),
                          flex: 1,
                        ),
                        Expanded(
                          child: PaddedText(e.urudu.toString()),
                          flex: 1,
                        ),
                        Expanded(
                          child: PaddedText(e.telugu.toString()),
                          flex: 1,
                        ),
                      ],
                    ),



              // After the itemized breakdown of costs, show the tax amount for this invoice
                // In this case, it's just 10% of the invoice amount
               /* TableRow(
                  children: [
                    PaddedText('2'),
                    PaddedText('LP'),
                  ],
                ),
                // Show the total
                TableRow(
                  children: [
                    PaddedText('3'),
                    PaddedText("UA"),
                  ],
                ),
                TableRow(
                  children: [
                    PaddedText('4'),
                    PaddedText('RA'),
                  ],
                ),
                TableRow(
                  children: [
                    PaddedText('5'),
                    PaddedText('WS'),
                  ],
                ),
                TableRow(
                  children: [
                    PaddedText('6'
                        ''),
                    PaddedText('NB'),
                  ],
                ),*/)
              ],
            ),
            Padding(
              child: Text(
                "THANK YOU FOR YOUR BUSINESS!",
                style: Theme.of(context).header2,
              ),
              padding: EdgeInsets.all(20),
            ),
          ]
        );

      }
      )
    );return pdf.save();
  }


  Widget PaddedText(
      final String text, {
        final TextAlign align = TextAlign.left,
      }) =>
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          text,
          textAlign: align,
        ),
      );

