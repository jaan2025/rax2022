import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_management/ApplicationHelper.dart';
import 'package:flutter_management/Provider/schoolNameProvider.dart';
import 'package:flutter_management/Screens/Alldatascreen.dart';
import 'package:flutter_management/Screens/pdfpreview.dart';
import 'package:flutter_management/api/ApiServises.dart';
import 'package:flutter_management/model/subjects.dart';
import 'package:flutter_management/model/writedata.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import 'package:flutter_svg/svg.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excel;

import '../model/SecondSheetModel.dart';


final checkButton = StateProvider<bool>((ref) => false);

class schooldetails extends ConsumerStatefulWidget {
  final secondSheetModel secondsheetmodel;

   schooldetails({Key? key, required this.secondsheetmodel}) : super(key: key);

  @override
  _schooldetailsState createState() => _schooldetailsState(secondsheetmodel);
}

class _schooldetailsState extends ConsumerState<schooldetails> {
  final secondSheetModel secondsheetmodel;

  List<String> classTypes = ['Class 5', 'Class 6'];
  String selectedClass = 'Class 5';

  bool class5 = true, class6 = false, class7 = false;

  HDTRefreshController _hdtRefreshController = HDTRefreshController();

  _schooldetailsState(this.secondsheetmodel);



  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(schoolNameNotifier);
      ref.read(ClassFiveNotifier);
      ref.read(SubjectNameNotifier);
      ref.read(FistClasssNotifier);
      ref.read(SecondClasssNotifier);


    });
    WidgetsFlutterBinding.ensureInitialized();
    ApiProider.init();

    super.initState();
  }

  String dropdownvalue = "class 5";

  bool ischanged = true;
  String? fir_radiotype;
  String? sec_radiotype ;

  int stateValue = 0;





  @override
  Widget build(BuildContext context) {
    List<FirstClass>? classlist= ref.watch(FistClasssNotifier).value;

    var s5= classlist?.where((element) => element.subjectClass ==5).toList();

    var subcls =  ref.watch(FistClasssNotifier).value;


  var  s6  =  classlist?.where((element) => element.subjectClass == 6).toList();

  final subcls6 =  ref.watch(SecondClasssNotifier).value;




    List<secondSheetModel>? header  = ref.watch(schoolNameNotifier).value;
    ref.read(apiProvider).subjectname();


    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            child: SafeArea(
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration:  BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('Assets/image3.jpg'),
                            fit: BoxFit.fitWidth

                        )
                    ),
                  ),
                ),
                Text(
                  "TELANGANA MINORITIES RESIDENTIAL \n EDUCATIONAL INSTITUTIONS SOCIETY",
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 400,
                height: 400,
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 5,
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('Academic Coordinator :',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  secondsheetmodel.NameoftheAcademicCoordinator.toString(),
                                 /* checkNull(header
                                      .value![0].NameoftheAcademicCoordinator
                                      .toString()),*/
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.indigo,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('School Name :',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  secondsheetmodel.NameoftheSchool.toString(),
                                 /* checkNull(header.value![0].NameoftheSchool
                                      .toString()),*/
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.indigo,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('District :',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  secondsheetmodel.District.toString(),
                               /*   checkNull(
                                      header.value![0].District.toString()),*/
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.indigo,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('Principal Name :',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  secondsheetmodel.NameofthePrincipal.toString(),
                                /*  checkNull(header
                                      .value![0].NameofthePrincipal
                                      .toString()),*/
                                  style: TextStyle(
                                    color: Colors.indigo,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'No.of teacher presents/Total no.of teachers :',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  secondsheetmodel.NoOfTeachers.toString(),
                               /*   checkNull(header.value![0].NoOfTeachers
                                      .toString()),*/
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.indigo,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'No.of students presents/Total no.of students :',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: Text(
                                    secondsheetmodel.NoofstudentspresentTotalNoofStudents.toString(),
                                   /* checkNull(header.value![0]
                                        .NoofstudentspresentTotalNoofStudents
                                        .toString()),*/
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'In Time Bell :',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),

                                    Expanded(
                                      child: RadioListTile(
                                        title: Text("YES", style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.indigo,
                                        ),),
                                        groupValue: fir_radiotype,
                                        value: '01',
                                        //header.value![0].InTimeBell == "YES"? true: false,
                                        onChanged: ( value) {
                                          setState((){
                                              fir_radiotype = value.toString();

                                          });

                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: RadioListTile(
                                        title: Text("NO" , style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.indigo,
                                        ),),
                                        groupValue: fir_radiotype,
                                        value: '02',
                                        //header.value![0].InTimeBell == "NO"? false : true,
                                        onChanged: (value) {
                                          setState((){
                                              fir_radiotype = value.toString();
                                          });

                                        },
                                      ),
                                    ),
                                 /*   Text(
                                      checkNull(
                                          header.value![2].InTimeBell.toString()),
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.indigo,
                                      ),
                                    )*/
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Lunch Bell :',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: RadioListTile(
                                        title: Text("YES", style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.indigo,
                                        ),),
                                        groupValue: sec_radiotype,
                                        value: '01',
                                        onChanged: (value) {
                                            setState((){
                                              sec_radiotype = value.toString();
                                            });



                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: RadioListTile(
                                        title: Text("NO" , style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.indigo,
                                        ),),
                                        groupValue: sec_radiotype,
                                        value:  '02',
                                        onChanged: (value) {
                                          setState((){
                                            sec_radiotype = value.toString();
                                          });

                                        },
                                      ),
                                    ),
                                    /*  Text(
                                  checkNull(
                                      header.value![0].launchBell.toString()),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.indigo,
                                  ),
                                )*/
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                               // mainAxisAlignment: MainAxisAlignment.spaceAround,
                               // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'STANDARD : ',
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: SizedBox(
                                      width: 100,
                                      child: DropdownButton(
                                        icon: Padding(
                                          padding: const EdgeInsets.only(left: 20.0),
                                          child: Icon(Icons.keyboard_arrow_down),
                                        ),
                                        items: classTypes
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                        value: selectedClass,
                                        onChanged: (item) {
                                          setState(() {
                                            selectedClass = item.toString();
                                            switch (selectedClass) {
                                              case "Class 5":
                                                ReadClass5();
                                                print("class5");
                                                break;
                                              case "Class 6":
                                                ReadClass6();
                                                print("class6");
                                                break;
                                              case "Class 7":
                                                print("class 7");
                                                break;
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  /*  Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: MaterialButton(
                            onPressed: () async {
                              List<Datum> values1=[];

                              for(int i = 0; i < subcls!.length; i++ ){
                                var value = Datum(
                                    id: subcls[i].sno.toString() ,
                                    classes: subcls[i].subjectClass.toString(),
                                    works: subcls[i].works.toString(),
                                    english: subcls[i].english.toString(),
                                    math: subcls[i].math.toString(),
                                    evs: subcls[i].evs.toString(),
                                    social: subcls[i].socialStudies.toString(),
                                    science: subcls[i].science.toString(),
                                    hindi: subcls[i].hindi.toString(),
                                    urudu: subcls[i].urudu.toString(),
                                    telugu: subcls[i].telugu.toString());
                                values1.add(value);
                                print("Update index ====>" +i.toString());

                                await ApiProider.update(i, value.toJson());
                              }

                            },
                            //since this is only a UI app
                            child: const Text('Save',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'SFUIDisplay',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Color(0xffff2d55),
                            elevation: 0,
                            minWidth: 100,
                            height: 40,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),

                              )
                        ),*/
                                ],
                              ),
                            ),
                          )
                        ]))),
            /*Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'STANDARD : ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 5,
                            color: Colors.purple[50],
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                width: 150,
                                child: DropdownButton(
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  items: classTypes
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  value: selectedClass,
                                  onChanged: (item) {
                                    setState(() {
                                      selectedClass = item.toString();
                                      switch (selectedClass) {
                                        case "Class 5":
                                          ReadClass5();
                                          print("class5");
                                          break;
                                        case "Class 6":
                                          ReadClass6();
                                          print("class6");
                                          break;
                                        case "Class 7":
                                          print("class 7");
                                          break;
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        */
            /*  Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: MaterialButton(
                                onPressed: () async {
                                  List<Datum> values1=[];

                                  for(int i = 0; i < subcls!.length; i++ ){
                                    var value = Datum(
                                        id: subcls[i].sno.toString() ,
                                        classes: subcls[i].subjectClass.toString(),
                                        works: subcls[i].works.toString(),
                                        english: subcls[i].english.toString(),
                                        math: subcls[i].math.toString(),
                                        evs: subcls[i].evs.toString(),
                                        social: subcls[i].socialStudies.toString(),
                                        science: subcls[i].science.toString(),
                                        hindi: subcls[i].hindi.toString(),
                                        urudu: subcls[i].urudu.toString(),
                                        telugu: subcls[i].telugu.toString());
                                    values1.add(value);
                                    print("Update index ====>" +i.toString());

                                    await ApiProider.update(i, value.toJson());
                                  }

                                },
                                //since this is only a UI app
                                child: const Text('Save',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'SFUIDisplay',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                color: Color(0xffff2d55),
                                elevation: 0,
                                minWidth: 100,
                                height: 40,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),

                              )
                          ),*//*
                        ],
                      ),
                    ]))),*/
            Visibility(
              visible: class5,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.42,
                    child: HorizontalDataTable(
                      leftHandSideColumnWidth: 100,
                      rightHandSideColumnWidth: 600,
                      isFixedHeader: true,
                      headerWidgets: _getTitleWidget(),
                      leftSideItemBuilder: _generateFirstColumnRow1,
                      rightSideItemBuilder: _generateRightHandSideColumnRow1,
                      itemCount: s5?.length ?? 0,
                      rowSeparatorWidget: const Divider(
                        color: Colors.black54,
                        height: 1.0,
                        thickness: 0.0,
                      ),
                      leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
                      rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
                      verticalScrollbarStyle: const ScrollbarStyle(
                        isAlwaysShown: true,
                        thickness: 4.0,
                        radius: Radius.circular(5.0),
                      ),
                      horizontalScrollbarStyle: const ScrollbarStyle(
                        isAlwaysShown: true,
                        thickness: 4.0,
                        radius: Radius.circular(5.0),
                      ),
                      enablePullToRefresh: false,
                      refreshIndicator: const WaterDropHeader(),
                      refreshIndicatorHeight: 60,
                      onRefresh: () async {
                        //Do sth
                        await Future.delayed(const Duration(milliseconds: 500));
                        // _hdtRefreshController.refreshCompleted();
                      },
                      //  htdRefreshController: _hdtRefreshController,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => PdfPreviewPage(firstClass: subcls!,sheet:header!, secondsheet: header[0],)));
                            },
                            icon: Icon(Icons.download_rounded),

                          )
                      ),
                      MaterialButton(
                        onPressed: () async {
                          ApplicationHelper.showProgressDialog(context);
                          List<Datum> values1=[];

                          for(int i = 0; i < subcls!.length; i++ ){
                            var value = Datum(
                                id: subcls[i].sno.toString() ,
                                classes: subcls[i].subjectClass.toString(),
                                works: subcls[i].works.toString(),
                                english: subcls[i].english.toString(),
                                math: subcls[i].math.toString(),
                                evs: subcls[i].evs.toString(),
                                social: subcls[i].socialStudies.toString(),
                                science: subcls[i].science.toString(),
                                hindi: subcls[i].hindi.toString(),
                                urudu: subcls[i].urudu.toString(),
                                telugu: subcls[i].telugu.toString());
                            values1.add(value);
                            await ApiProider.update(subcls[i].sno.toString(), value.toJson());
                          }

                          final snackBar = SnackBar(
                            content: const Text('Saved Successfully'),
                            backgroundColor: (Colors.black),
                            action: SnackBarAction(
                              label: '',
                              onPressed: () {
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          ApplicationHelper.dismissProgressDialog();
/*


                      // insert data into excel!!!!
                   for(int i=0;i<sub!.length;i++){
                          print("print sub   $i ----> ${sub[i].english}");
                          ApiProider.deletebyid(i);
                  List<Map<String, dynamic>> mapList1 = [];
                          mapList1.add({"Class": sub[i].subjectClass});
                          mapList1.add({"Works": sub[i].works});
                          mapList1.add({"English": sub[i].english});
                          mapList1.add({"Math": sub[i].math});
                          mapList1.add({"EVS": sub[i].evs});
                          mapList1.add({"Science": sub[i].science});
                          mapList1.add({"Social Studies": sub[i].socialStudies});
                          mapList1.add({ "Hindi": sub[i].hindi});
                          mapList1.add({"Urudu": sub[i].urudu});
                          mapList1.add({"Telugu": sub[i].telugu});

                          var value= Datum(classes: sub[i].subjectClass.toString(),
                              works: sub[i].works.toString(),
                              english: sub[i].english.toString(),
                              math: sub[i].math.toString(),
                              evs: sub[i].evs.toString(),
                              social: sub[i].socialStudies.toString(),
                              science: sub[i].science.toString(),
                              hindi: sub[i].hindi.toString(),
                              urudu: sub[i].urudu.toString(),
                              telugu: sub[i].telugu.toString());
                          values1.add(value);

                        }
                          final jsonresult = values1.map((e) => e.toJson()).toList();
                          ApiProider.insert(jsonresult);
*/

                        },
                        //since this is only a UI app
                        child: const Text('Save',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SFUIDisplay',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Color(0xffff2d55),
                        elevation: 0,
                        minWidth: 80,
                        height: 40,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),

                      ),
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              visible: class6,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.42,
                    child: HorizontalDataTable(
                      leftHandSideColumnWidth: 100,
                      rightHandSideColumnWidth: 600,
                      isFixedHeader: true,
                      headerWidgets: _getTitleWidget(),
                      leftSideItemBuilder: _generateFirstColumnRow2,
                      rightSideItemBuilder: _generateRightHandSideColumnRow2,
                      itemCount: s6?.length ?? 0,
                      rowSeparatorWidget: const Divider(
                        color: Colors.black54,
                        height: 1.0,
                        thickness: 0.0,
                      ),
                      leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
                      rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
                      verticalScrollbarStyle: const ScrollbarStyle(
                        isAlwaysShown: true,
                        thickness: 4.0,
                        radius: Radius.circular(5.0),
                      ),
                      horizontalScrollbarStyle: const ScrollbarStyle(
                        isAlwaysShown: true,
                        thickness: 4.0,
                        radius: Radius.circular(5.0),
                      ),
                      enablePullToRefresh: false,
                      refreshIndicator: const WaterDropHeader(),
                      refreshIndicatorHeight: 60,
                      onRefresh: () async {
                        //Do sth
                        await Future.delayed(const Duration(milliseconds: 500));
                        // _hdtRefreshController.refreshCompleted();
                      },
                      //  htdRefreshController: _hdtRefreshController,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => PdfPreviewPage(firstClass: subcls!,sheet: header!, secondsheet: header[0],)));
                            },
                            icon: Icon(Icons.download_rounded),

                          )
                      ),

                      MaterialButton(
                        onPressed: () async {
                          ApplicationHelper.showProgressDialog(context);

                          List<Datum> values1=[];

                          for(int i = 0; i < subcls6!.length; i++ ){
                            var value = Datum(
                                id: subcls6[i].sno.toString() ,
                                classes: subcls6[i].subjectClass.toString(),
                                works: subcls6[i].works.toString(),
                                english: subcls6[i].english.toString(),
                                math: subcls6[i].math.toString(),
                                evs: subcls6[i].evs.toString(),
                                social: subcls6[i].socialStudies.toString(),
                                science: subcls6[i].science.toString(),
                                hindi: subcls6[i].hindi.toString(),
                                urudu: subcls6[i].urudu.toString(),
                                telugu: subcls6[i].telugu.toString());
                            values1.add(value);

                            await ApiProider.update(subcls6[i].sno, value.toJson());
                          }
                          final snackBar = SnackBar(
                            content: const Text('Saved Successfully'),
                            backgroundColor: (Colors.black),
                            action: SnackBarAction(
                              label: '',
                              onPressed: () {
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          ApplicationHelper.dismissProgressDialog();
/*

                      // insert data into excel!!!!
                   for(int i=0;i<sub!.length;i++){
                          print("print sub   $i ----> ${sub[i].english}");
                          ApiProider.deletebyid(i);
                  List<Map<String, dynamic>> mapList1 = [];
                          mapList1.add({"Class": sub[i].subjectClass});
                          mapList1.add({"Works": sub[i].works});
                          mapList1.add({"English": sub[i].english});
                          mapList1.add({"Math": sub[i].math});
                          mapList1.add({"EVS": sub[i].evs});
                          mapList1.add({"Science": sub[i].science});
                          mapList1.add({"Social Studies": sub[i].socialStudies});
                          mapList1.add({ "Hindi": sub[i].hindi});
                          mapList1.add({"Urudu": sub[i].urudu});
                          mapList1.add({"Telugu": sub[i].telugu});

                          var value= Datum(classes: sub[i].subjectClass.toString(),
                              works: sub[i].works.toString(),
                              english: sub[i].english.toString(),
                              math: sub[i].math.toString(),
                              evs: sub[i].evs.toString(),
                              social: sub[i].socialStudies.toString(),
                              science: sub[i].science.toString(),
                              hindi: sub[i].hindi.toString(),
                              urudu: sub[i].urudu.toString(),
                              telugu: sub[i].telugu.toString());
                          values1.add(value);

                        }
                          final jsonresult = values1.map((e) => e.toJson()).toList();
                          ApiProider.insert(jsonresult);
*/

                        },
                        //since this is only a UI app
                        child: const Text('Save',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SFUIDisplay',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Color(0xffff2d55),
                        elevation: 0,
                        minWidth: 80,
                        height: 40,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),

                      ),

                    ],
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text("Powered By Smart School ERP"),
            )
          ]),
        )));
  }

/*  getSubjectListClass5(int index){
    var listSub = ref.watch(ClassFiveNotifier).value;
    //var listRef = ref.watch(ClassSixNotifier).value;
    var SubjectName = ref.watch(SubjectNameNotifier).value;
    return  Visibility(
        visible: listSub![index].subjectClass == 5 ? true : false,
        child:  SizedBox(
        width: 400,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  15.0),),
            elevation: 5,
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start,
                              children: [
                                Text(SubjectName![index].subject_name.toString()),
                                Padding(
                                  padding: const EdgeInsets
                                      .fromLTRB(
                                      130, 0, 0, 0),
                                  child: Text(
                                    listSub[index].subjectClass.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight
                                            .bold),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.black,),
                            ListView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:6,
                                itemBuilder: (context,index){
                                  return getClassFiveData(index);

                                })

                          ],
                        ),
                      ),



                    ])))));
  }
  getSubjectListClass6(int index){
     var listSub = ref.watch(ClassSixNotifier).value;
    //var listRef = ref.watch(ClassSixNotifier).value;
     var SubjectName = ref.watch(SubjectNameNotifier).value;
     print(SubjectName);
     print("SUBJECTNAME ========= ${SubjectName![index].subject_name.toString()}");

    return  Visibility(
        visible: listSub![index].subjectClass == 6 ? true : false,
        child:  SizedBox(
            width: 400,
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      15.0),),
                elevation: 5,
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                  children: [
                                    Text(
                                        SubjectName[index].subject_name.toString()),
                                    Text(
                                      listSub[index].subjectClass.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight
                                              .bold),
                                    ),
                                  */
  /*  Checkbox(
                                      value: this.value,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value = value;
                                        });
                                      },
                                    )*/
  /*


                                  ],
                                ),
                                Divider(
                                  color: Colors.black,),
                                ListView.builder(
                                    physics: ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:6,
                                    itemBuilder: (context,index){
                                      return getClassSixData(index);

                                    })

                              ],
                            ),
                          ),



                        ])))));
  }

  getClassFiveData(int index){
    ref.read(apiProvider).getClass5();
    var listSub = ref.watch(ClassFiveNotifier).value;
  //  var listRef = ref.watch(ClassSixNotifier).value;

    print(listSub![index].works.toString());

    return   Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween,
                children: [
                  Text(listSub[index].works.toString(),
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors
                            .black),),
                  Padding(
                      padding: const EdgeInsets
                          .only(
                          left: 29),
                      child: ToggleSwitch(
                        minWidth: 43.3,
                        cornerRadius: 20.0,
                        activeBgColors: [
                          [
                            Colors
                                .green[800]!
                          ],
                          [
                            Colors
                                .red[800]!
                          ]
                        ],
                        activeFgColor: Colors
                            .white,
                        inactiveBgColor: Colors
                            .grey,
                        inactiveFgColor: Colors
                            .white,
                        initialLabelIndex : listSub[index].math.toString() == "YES" ? 0 : 1 ,
                        totalSwitches: 2,
                        labels: [
                          'Yes',
                          'No'],
                        radiusStyle: true,
                        onToggle: (
                            index) {
                          print(
                              'switched to: $index');
                        },
                      ))
                ],
              )
            ]
        )
    );
  }
  getClassSixData(int index){
    ref.read(apiProvider).getClass6();
    var listSub = ref.watch(ClassFiveNotifier).value;
    var ClassSixDatum = ref.watch(ClassSixNotifier).value;

    //  var listRef = ref.watch(ClassSixNotifier).value;

    print(listSub![index].works.toString());

    return   Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween,
                children: [
                  Text(ClassSixDatum![index].works.toString(),
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors
                            .black),),
                  Padding(
                      padding: const EdgeInsets
                          .only(
                          left: 29),
                      child: ToggleSwitch(
                        minWidth: 43.3,
                        cornerRadius: 20.0,
                        activeBgColors: [
                          [
                            Colors
                                .green[800]!
                          ],
                          [
                            Colors
                                .red[800]!
                          ]
                        ],
                        activeFgColor: Colors
                            .white,
                        inactiveBgColor: Colors
                            .grey,
                        inactiveFgColor: Colors
                            .white,
                        initialLabelIndex:ClassSixDatum[index].english.toString() == "YES" ? 0 : 1,
                        totalSwitches: 2,
                        labels: [
                          'Yes',
                          'No'],
                        radiusStyle: true,
                        onToggle: (
                            index) {
                          print(
                              'switched to: $index');
                        },
                      ))
                ],
              )
            ]
        )
    );
  }*/

  ReadClass5() {
    class5 = true;
    class6 = false;
    class7 = false;
  }

  ReadClass6() {
    class5 = false;
    class6 = true;
    class7 = false;
  }

  List<Widget> _getTitleWidget() {
    return [
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
                "S.NO", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Works", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        width: 100,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text("English", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        width: 100,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
      Container(
        child: Text("Math", style: TextStyle(fontWeight: FontWeight.bold)),
        width: 100,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
      Container(
        child: Text("EVS", style: TextStyle(fontWeight: FontWeight.bold)),
        width: 100,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
      Container(
        child: Text("Social", style: TextStyle(fontWeight: FontWeight.bold)),
        width: 100,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
      Container(
        child: Text("Science", style: TextStyle(fontWeight: FontWeight.bold)),
        width: 100,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
      Container(
        child: Text("Hindi", style: TextStyle(fontWeight: FontWeight.bold)),
        width: 100,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
      Container(
        child: Text("Urudu", style: TextStyle(fontWeight: FontWeight.bold)),
        width: 100,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
      Container(
        child: Text("Telugu", style: TextStyle(fontWeight: FontWeight.bold)),
        width: 100,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
    ];
  }

  Widget _generateFirstColumnRow1(BuildContext context, int index) {

    List<FirstClass>? classlist= ref.watch(FistClasssNotifier).value;
    var ss= classlist!.where((element) => element.subjectClass ==5).toList();
    var listRef = ss; //ref.watch(FistClasssNotifier);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text((index + 1).toString(), style: TextStyle(fontWeight: FontWeight.bold)),
          Text(listRef[index].works.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow1(BuildContext context, int index) {
    var sub = ref.watch(ClassFiveNotifier).value;

    var subcls =  ref.watch(FistClasssNotifier).value;

    print(subcls![index].works);

    bool isSelected=false;



    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Center(
              child: Container(
            width: 300,
            height: 52,
            color: Colors.indigo,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: StatefulBuilder(builder: (context, StateSetter setState) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Checkbox(
                    activeColor: Colors.green,
                    checkColor: Colors.black,
                    value: subcls[index].english == "NO"? false : true,
                    onChanged: (state) {

                      setState(() {
                        if(subcls[index].english=="NO"){
                          isSelected = true;
                          subcls[index].english="YES";
                          state = true;
                        }
                        else
                        {
                          subcls[index].english="NO";
                          isSelected = false;
                          state = false;

                        };



                      });
                    }),
              );
            }),
          )),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              child: StatefulBuilder(builder: (context, StateSetter setState) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Checkbox(
                      activeColor: Colors.green,
                      checkColor: Colors.black,
                      value: subcls[index].math == "NO"? false : true,
                      onChanged: (state) {
                        setState(() {
                          if(subcls[index].math=="NO"){
                            isSelected = true;
                            subcls[index].math="YES";
                            state = true;
                          }
                          else
                          {
                            subcls[index].math="NO";
                            isSelected = false;
                            state = false;
                          };
                        });
                      }),
                );
              }),
              width: 500,
              height: 52,
              color: Colors.yellow,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              child: StatefulBuilder(builder: (context, StateSetter setState) {
                return Checkbox(
                    activeColor: Colors.green,
                    checkColor: Colors.black,
                    value: subcls[index].evs == "NO"? false : true,
                    onChanged: (state) {
                      setState(() {
                        if(subcls[index].evs=="NO"){
                          isSelected = true;
                          subcls[index].evs="YES";
                          state = true;
                        }
                        else
                        {
                          subcls[index].evs="NO";
                          isSelected = false;
                          state = false;
                        };
                      });
                    });
              }),
              width: 200,
              height: 52,
              color: Colors.pink,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              child: StatefulBuilder(builder: (context, StateSetter setState) {
                return Checkbox(
                    activeColor: Colors.green,
                    checkColor: Colors.black,
                    value: subcls[index].socialStudies == "NO"? false : true,
                    onChanged: (state) {
                      setState(() {
                        if(subcls[index].socialStudies=="NO"){
                          isSelected = true;
                          subcls[index].socialStudies="YES";
                          state = true;
                        }
                        else
                        {
                          subcls[index].socialStudies="NO";
                          isSelected = false;
                          state = false;
                        };
                      });
                    });
              }),
              width: 200,
              height: 52,
              color: Colors.cyan,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),

        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              child: StatefulBuilder(builder: (context, StateSetter setState) {
                return Checkbox(
                    activeColor: Colors.green,
                    checkColor: Colors.black,
                    value: subcls[index].science == "NO"? false : true,
                    onChanged: (state) {
                      setState(() {
                        if(subcls[index].science=="NO"){
                          isSelected = true;
                          subcls[index].science="YES";
                          state = true;
                        }
                        else
                        {
                          subcls[index].science="NO";
                          isSelected = false;
                          state = false;
                        };
                      });
                    });
              }),
              width: 200,
              height: 52,
              color: Colors.indigoAccent,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              child: StatefulBuilder(builder: (context, StateSetter setState) {
                return Checkbox(
                    activeColor: Colors.green,
                    checkColor: Colors.black,
                    value: subcls[index].hindi == "NO"? false : true,
                    onChanged: (state) {
                      setState(() {
                        if(subcls[index].hindi=="NO"){
                          isSelected = true;
                          subcls[index].hindi="YES";
                          state = true;
                        }
                        else
                        {
                          subcls[index].hindi="NO";
                          isSelected = false;
                          state = false;
                        };
                      });
                    });
              }),
              width: 200,
              height: 52,
              color: Colors.red,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              child: StatefulBuilder(builder: (context, StateSetter setState) {
                return Checkbox(
                    activeColor: Colors.green,
                    checkColor: Colors.black,
                    value: subcls[index].urudu == "NO"? false : true,
                    onChanged: (state) {
                      setState(() {
                        if(subcls[index].urudu=="NO"){
                          isSelected = true;
                          subcls[index].urudu="YES";
                          state = true;
                        }
                        else
                        {
                          subcls[index].urudu="NO";
                          isSelected = false;
                          state = false;
                        };
                      });
                    });
              }),
              width: 200,
              height: 52,
              color: Colors.purple,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              child: StatefulBuilder(builder: (context, StateSetter setState) {
                return Checkbox(
                    activeColor: Colors.green,
                    checkColor: Colors.black,
                    value: subcls[index].telugu == "NO"? false : true,
                    onChanged: (state) {
                      setState(() {
                        if(subcls[index].telugu=="NO"){
                          isSelected = true;
                          subcls[index].telugu="YES";
                          state = true;
                        }
                        else
                        {
                          subcls[index].telugu="NO";
                          isSelected = false;
                          state = false;
                        };
                      });
                    });
              }),
              width: 200,
              height: 52,
              color: Colors.teal,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
      ],
    );
  }



// class 6th
  Widget _generateFirstColumnRow2(BuildContext context, int index) {
    //var listRef = ref.watch(ClassFiveNotifier);

    List<FirstClass>? classlist= ref.watch(FistClasssNotifier).value;

    var ss= classlist!.where((element) => element.subjectClass ==6).toList();

    var listRef = ss; //ref.watch(FistClasssNotifier);
    print("list==>"+ listRef[0].works);

    var subcls =  ref.watch(FistClasssNotifier).value;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text((index + 1).toString(), style: TextStyle(fontWeight: FontWeight.bold)),
          Text(listRef[index].works.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow2(BuildContext context, int index) {

    List<FirstClass>? classlist= ref.watch(FistClasssNotifier).value;

    var ss= classlist!.where((element) => element.subjectClass ==6).toList();

   // var subcls6 =  ref.watch(SecondClasssNotifier).value;
    var subcls6 = ss; //ref.watch(FistClasssNotifier).value;
    // print(subcls6[index].sno);


    bool isSelected=false;



    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Center(
              child: Container(
                width: 300,
                height: 52,
                color: Colors.indigo,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: StatefulBuilder(builder: (context, StateSetter setState) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Checkbox(
                        activeColor: Colors.green,
                        checkColor: Colors.black,
                        value: subcls6[index].english == "NO"? false : true,
                        onChanged: (state) {
                          setState(() {
                            if(subcls6[index].english=="NO"){
                              isSelected = true;
                              subcls6[index].english="YES";
                              state = true;
                            }
                            else
                            {
                              subcls6[index].english="NO";
                              isSelected = false;
                              state = false;

                            };



                          });
                        }),
                  );
                }),
              )),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              child: StatefulBuilder(builder: (context, StateSetter setState) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Checkbox(
                      activeColor: Colors.green,
                      checkColor: Colors.black,
                      value: subcls6[index].math == "NO"? false : true,
                      onChanged: (state) {
                        setState(() {
                          if(subcls6[index].math=="NO"){
                            isSelected = true;
                            subcls6[index].math="YES";
                            state = true;
                          }
                          else
                          {
                            subcls6[index].math="NO";
                            isSelected = false;
                            state = false;
                          };
                        });
                      }),
                );
              }),
              width: 500,
              height: 52,
              color: Colors.yellow,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              child: StatefulBuilder(builder: (context, StateSetter setState) {
                return Checkbox(
                    activeColor: Colors.green,
                    checkColor: Colors.black,
                    value: subcls6[index].evs == "NO"? false : true,
                    onChanged: (state) {
                      setState(() {
                        if(subcls6[index].evs=="NO"){
                          isSelected = true;
                          subcls6[index].evs="YES";
                          state = true;
                        }
                        else
                        {
                          subcls6[index].evs="NO";
                          isSelected = false;
                          state = false;
                        };
                      });
                    });
              }),
              width: 200,
              height: 52,
              color: Colors.pink,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              child: StatefulBuilder(builder: (context, StateSetter setState) {
                return Checkbox(
                    activeColor: Colors.green,
                    checkColor: Colors.black,
                    value: subcls6[index].socialStudies == "NO"? false : true,
                    onChanged: (state) {
                      setState(() {
                        if(subcls6[index].socialStudies=="NO"){
                          isSelected = true;
                          subcls6[index].socialStudies="YES";
                          state = true;
                        }
                        else
                        {
                          subcls6[index].socialStudies="NO";
                          isSelected = false;
                          state = false;
                        };
                      });
                    });
              }),
              width: 200,
              height: 52,
              color: Colors.cyan,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),

        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              child: StatefulBuilder(builder: (context, StateSetter setState) {
                return Checkbox(
                    activeColor: Colors.green,
                    checkColor: Colors.black,
                    value: subcls6[index].science == "NO"? false : true,
                    onChanged: (state) {
                      setState(() {
                        if(subcls6[index].science=="NO"){
                          isSelected = true;
                          subcls6[index].science="YES";
                          state = true;
                        }
                        else
                        {
                          subcls6[index].science="NO";
                          isSelected = false;
                          state = false;
                        };
                      });
                    });
              }),
              width: 200,
              height: 52,
              color: Colors.indigoAccent,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              child: StatefulBuilder(builder: (context, StateSetter setState) {
                return Checkbox(
                    activeColor: Colors.green,
                    checkColor: Colors.black,
                    value: subcls6[index].hindi == "NO"? false : true,
                    onChanged: (state) {
                      setState(() {
                        if(subcls6[index].hindi=="NO"){
                          isSelected = true;
                          subcls6[index].hindi="YES";
                          state = true;
                        }
                        else
                        {
                          subcls6[index].hindi="NO";
                          isSelected = false;
                          state = false;
                        };
                      });
                    });
              }),
              width: 200,
              height: 52,
              color: Colors.red,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              child: StatefulBuilder(builder: (context, StateSetter setState) {
                return Checkbox(
                    activeColor: Colors.green,
                    checkColor: Colors.black,
                    value: subcls6[index].urudu == "NO"? false : true,
                    onChanged: (state) {
                      setState(() {
                        if(subcls6[index].urudu=="NO"){
                          isSelected = true;
                          subcls6[index].urudu="YES";
                          state = true;
                        }
                        else
                        {
                          subcls6[index].urudu="NO";
                          isSelected = false;
                          state = false;
                        };
                      });
                    });
              }),
              width: 200,
              height: 52,
              color: Colors.purple,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              child: StatefulBuilder(builder: (context, StateSetter setState) {
                return Checkbox(
                    activeColor: Colors.green,
                    checkColor: Colors.black,
                    value: subcls6[index].telugu == "NO"? false : true,
                    onChanged: (state) {
                      setState(() {
                        if(subcls6[index].telugu=="NO"){
                          isSelected = true;
                          subcls6[index].telugu="YES";
                          state = true;
                        }
                        else
                        {
                          subcls6[index].telugu="NO";
                          isSelected = false;
                          state = false;
                        };
                      });
                    });
              }),
              width: 200,
              height: 52,
              color: Colors.teal,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
      ],
    );
  }



}

String checkNull(var value) {
  if (value == null) {
    value = "";
  }
  return value;
}


