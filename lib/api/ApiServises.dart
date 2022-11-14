import 'dart:convert';

import 'package:flutter_management/model/subjects.dart';
import 'package:gsheets/gsheets.dart';
import 'package:http/http.dart' as http;

import '../model/SecondSheetModel.dart';
import '../model/login_model.dart';
import 'package:riverpod/riverpod.dart';

import '../model/ref.dart';
import '../model/writedata.dart';


 Provider<ApiProider> apiProvider = Provider<ApiProider>((ref) => ApiProider());


class ApiProider {

/* final Ref ref;
 ApiProider(this.ref);*/
  static Future<List<Datum>> alldata =[] as Future<List<Datum>>;
  List<SubjectName> subjectnames = [];
  Future<dynamic> getDataFromGs () async {

    List<Loginform> finalData = [];

    final response = await http.get(Uri.parse("https://script.google.com/macros/s/AKfycbyQNdDHICZJ0v4pl6OZn_eSiLh9Y3RBWy2TStKnEwPhVRa3LyLwUnBzjoOQ4Sb7j2HH/exec"),headers: {'Content-Type': 'application/json','Charset': 'utf-8'});
    print(response);

    dynamic result = jsonDecode(response.body);

    print("total ==== ${result[0]}");
    print(result[0]["Login"]);
    print("RESULT ======= $result");
    for(int i=0;i<result.length;i++){
      Loginform loginform = Loginform(
          coordinatorName: result[i]["Coordinator_Name"],
          coordinatorCode: result[i]["Coordinator_Code"],
          login: result[i]["Login"],
          password: result[i]["Password"]);

      finalData.add(loginform);
      print("FINAL ---------- $finalData");

    }
    return finalData;
  }
  
  Future<dynamic> getSchoolNames()async{

    List<secondSheetModel> secondSheetData = [];
    //final response = await http.get(Uri.parse("https://script.google.com/macros/s/AKfycbzeaB0FEvv8HOPHDv1a81UbhWy1PNLLhjGlKDGNqX7XBN0KOGA2K3Wc069IwY-8lzmQlg/exec"));

    final response = await http.get(Uri.parse("https://script.google.com/macros/s/AKfycbzAdULfjEnwn8NNz3HTmEmy-j2t_9Oysy6k12BacFJ1Tz65IRwSxwQ_xM3LO32qnHJ-aA/exec"));

    dynamic resultSheetTwo = jsonDecode(response.body);

    for(int i =0;i<resultSheetTwo.length;i++){

      secondSheetModel schoolData = secondSheetModel(

          NameoftheAcademicCoordinator: resultSheetTwo[i]["Name of the Academic Coordinator"],
          NameoftheSchool: resultSheetTwo[i]["Name of the School"],
          District: resultSheetTwo[i]["District"],
          NoOfTeachers: resultSheetTwo[i]["No of the Teachers"],
          NoofstudentspresentTotalNoofStudents: resultSheetTwo[i]["No. of students present/Total No. of Students"],
          NameofthePrincipal: resultSheetTwo[i]["Name of Principal"],
          launchBell:  resultSheetTwo[i]["Lunch Bell"],
          InTimeBell:   resultSheetTwo[i]["In Time Bell"]

      );

      secondSheetData.add(schoolData);


    }
    return secondSheetData;
  }

  Future<dynamic> subjectname()async{


    final response = await http.get
      (Uri.
    parse("https://script.google.com/macros/s/AKfycbwz40pPgCSprP5vzfqiVdbkEF9Up99Rj2qZdrSJrTyzYA3B7wXDaR-bdFKOoUri8c6Z/exec"));

    print(response);

    dynamic subjects = jsonDecode(response.body);

    print(subjects);

    for(int s=0;s<subjects.length;s++){

      SubjectName subjectName = SubjectName(
        subject_name:  subjects[s]["Subjects"]
      );
      subjectnames.add(subjectName);

    }
    print(subjectnames);
    return subjectnames;


  }

  Future<dynamic> getClass5()async{

    List<Subjects> allSubjects = [];
    final response = await http.get(Uri.parse("https://script.google.com/macros/s/AKfycbxgbYNf80RDlYhddq_jqCdN-7oeG15NOa3KOOrjDPYRUculDA5W9Q8u3c3Uz3ZI409l/exec"));

    dynamic subjects = jsonDecode(response.body);



    for(int s=0;s<subjects.length;s++){

      Subjects sub = Subjects(
        subjectClass: subjects[s]["Class"],
        works: subjects[s]["WOrks"],
        english: subjects[s]["English"],
        math: subjects[s]["Math"],
        evs: subjects[s]["Evs"],
        science: subjects[s]["Science"],
        socialStudies: subjects[s]["Social Studies"],
        hindi: subjects[s]["Hindi"],
        urudu: subjects[s]["Urudu"],
        telugu: subjects[s]["Telugu"],

      );
      allSubjects.add(sub);
    }
    print("Print all subject !!!!!!!!!!!!!!$allSubjects");
    return allSubjects;


  }

  Future<dynamic> getClass6()async{

    List<Subjects> allSubjects = [];
    final response = await http.get
      (Uri.
    parse("https://script.google.com/macros/s/AKfycbyCp-8xciM0FfXfZDH2UGHXOdYoLcOOQIxvpduz4yUcRlBWACH3jJlAGwixqAS8zWk/exec"));
    print(response);

    dynamic subjects = jsonDecode(response.body);

    print(subjects);

    for(int s=0;s<subjects.length;s++){

      Subjects sub = Subjects(
        subjectClass: subjects[s]["Class"],
        works: subjects[s]["WOrks"],
        english: subjects[s]["English"],
        math: subjects[s]["Math"],
        evs: subjects[s]["EVS"],
        science: subjects[s]["Science"],
        socialStudies: subjects[s]["Social Studies"],
        hindi: subjects[s]["Hindi"],
        urudu: subjects[s]["Urudu"],
        telugu: subjects[s]["Telugu"],

      );

      allSubjects.add(sub);



    }
    print(allSubjects);
    return allSubjects;
  }



  Future<dynamic> firstclass()async{

    List<FirstClass> allSubjects = [];
   // final response = await http.get(Uri.parse("https://script.google.com/macros/s/AKfycby3mUCQ59BbS406EKeAmOcHh3oWUjY0tzw0X7jiCh2MHlGlp0TT7uICZcZ-B9AsFXi2/exec"));

    final response = await http.get(Uri.parse("https://script.google.com/macros/s/AKfycby05Tj4K_vF_fV71StIZJV3OpnVlBBMuHkrp21V3driwtmXjjgrZoW7A9EvKi5EExnU/exec"));
    print(response);

    dynamic subjects = jsonDecode(response.body);

    print(subjects);

    for(int s=0;s<subjects.length;s++){

      FirstClass sub = FirstClass(
        sno: subjects[s]["S.No"],
        subjectClass: subjects[s]["Class"],
        works: subjects[s]["Works"],
        english: subjects[s]["English"],
        math: subjects[s]["Math"],
        evs: subjects[s]["Evs"],
        science: subjects[s]["Science"],
        socialStudies: subjects[s]["Social Studies"],
        hindi: subjects[s]["Hindi"],
        urudu: subjects[s]["Urudu"],
        telugu: subjects[s]["Telugu"],
      );

      allSubjects.add(sub);



    }
    print(allSubjects);
    return allSubjects;


  }



  Future<dynamic> secondclass()async{

    List<FirstClass> allSubjects = [];
    final response = await http.get
      (Uri.
    parse("https://script.google.com/macros/s/AKfycbx6eRYlFXw-tX6-Q1Grzyn7S_LHxsvlAmCGHGYvoGCrsZ1tiv7zJ9g2afbNJwaFOeSQ/exec"));
    print(response);

    dynamic subjects = jsonDecode(response.body);

    print(subjects);

    for(int s=0;s<subjects.length;s++){

      FirstClass sub = FirstClass(
        sno: subjects[s]["S.No"],
        subjectClass: subjects[s]["Class"],
        works: subjects[s]["Works"],
        english: subjects[s]["English"],
        math: subjects[s]["Math"],
        evs: subjects[s]["Evs"],
        science: subjects[s]["Science"],
        socialStudies: subjects[s]["Social Studies"],
        hindi: subjects[s]["Hindi"],
        urudu: subjects[s]["Urudu"],
        telugu: subjects[s]["Telugu"],
      );

      allSubjects.add(sub);



    }
    print(allSubjects);
    return allSubjects;


  }



  // write file in google sheet

static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "tmrs-367205",
  "private_key_id": "b97cc00ffdb6e2cbddbd4162970cf61d6bfcd011",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDVn5rNbONl3S8O\nmVXQonLxpADe7+Vca/4qv5iCKJtKW1gu0Twegd107YgcuQWa8GQMbcFHJu7P61TJ\nKChSw/wl6SeEs7Nl8jybFWg2GfYL8aI+t9mWWo3IAxGbKHG5oCEPIUy2D93NvUNK\nJp2KmvXpanL/kgSe1mOP1kvPrcs+G5zT/sbrc6cWpzea5S2lxfycKN2LoT9IcFDd\ntX7YfcZ1lNsuGKX2gcZf4roqNP2t727FhkGQzlgSLcVVpJUdONkdBOJZaxuhc20v\n/hLbFKygImHwZA0TmIEjukGpj21kYlxZgwlWEJlcfrQ9Mfd+dsvYcrWZxck3MpIN\n1a/HVAVtAgMBAAECggEAAQBizig+x606CYA8CAKe9dWOQH1Q7rY95o7n5OJSWg6k\nEvIdrUnwExqC+xl99nw+h9Vi5NXApF5m0xuaVsr+7WGSsxtRkb6JPLPkvW4xOlyb\nZV5gyYTqqb+j7z2JDPT8erDuBmN8J3kF7fzQ28O+t+WtHNgfJ+x64oN/bv2SWJvv\n1qJo1d+4SqNT2XLs9/m2rHFKPJFrfS7lP5axMM2EA+eM0fLrC4eAEel95SLNZGK8\nPCCioBHbwVSX1QC38JDLpF/BKMA/gn6i8ONxFh+2TQjr6MeyUT4mVd15z2Yc22ZJ\naYFMz8wd3NAUTMorbFmInnf/B4EpCWpFMgzvlC0PUQKBgQDtXzmp3kZH/oY/7CBb\n8XXMPNp0WBf6jX4IaMILW6RAXUOL4QwVeGO+UUfzZR5F1v1d+BxRXc1BlwH4lZSd\nhcf8Kb5vWKmte9Z0sAcAXAMbOw+nDruwtX7euwTLSUZFkwF1DQLrSUTgD7tX13u5\nsrvVDzljsXM/JTacZZnWwBGSvQKBgQDmY0ZIxDnwmwzF4IgQfCD9NXfr7GAvmyw/\nTgxsM5CP85o8WLk/7K/CJDdeuNfJzhdAM2FlTQ4l8jyJY75clp65Ze0Po7kW4CCr\naIZnODTVTY7sSe1vX5XsjRw3XaRiwaLiDnVwP0OSMsYu44zSFsEH3VU708BHWgId\nzMj3jh9AcQKBgEsVRe4faue28MwjapDqrbIuxYLropoUS3tpd4eUMz5Qwd7rDqFz\n9Ujr+PBaWdsJiBdDNeHe4+ANXgg9eEbjXEC9C4m45+MCOvGqBGzureTdJ7RWCrR4\nlGrriTasNNgpCdr2hKfcAzdEgqPkezRf/t4D9Mk+BhBBOyb5VFIDawuZAoGASR64\n799XhEWxiBv7E0BSOAsARKCA5psZL/5VcwHqn8Vw7jY6lU9JeRSFfkqsMiB2wKmN\n/9i05NY84F4HzNsBBVaUJqKP2/LGa6CBB8GPAyPaeKP995seujUO/4N46N8MEzMD\nktyBVaVHwRn3V7ZhDV3x70sFe5/VjB+yqN8yjAECgYBBY7mYswOL7tvkCAHValqo\nIA7oC4nvYW0YWGrKIDemjmGvE+pBvn1EPhxPifILdwgyTtyhfTFyim723cA9Tdqo\nVyg2ZUnK+Kf/BvB+f9zS4SHIqicjkZU1OQCB05YLObTXmPHS/UD9uraEAP0ueizy\nbaV+alkKGl3P+ZhzRODVzg==\n-----END PRIVATE KEY-----\n",
  "client_email": "tmrs-999@tmrs-367205.iam.gserviceaccount.com",
  "client_id": "103921447221046367365",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/tmrs-999%40tmrs-367205.iam.gserviceaccount.com"
}
''';

static final _spreassheetId = '1tMRviZiZFIIsfkzvOq_arPihZpHy93cS3mk_GCvwJHk';

static final _gsheet = GSheets(_credentials);

static Worksheet? _userSheet;


static Future init() async {
  try{
    final spreadsheet = await _gsheet.spreadsheet(_spreassheetId);
    _userSheet = await _getWorkSheet(spreadsheet, title: 'tmrs');

    final firstRow = WriteData.getFields();
    _userSheet!.values.insertRow(1, firstRow);


    alldata = getall();

  }catch(e){
    print('Init Error: $e');
  }



}

  static Future<Worksheet> _getWorkSheet(
      Spreadsheet spreadsheet, {
        required String title}) async{
  try{
    return await spreadsheet.addWorksheet(title);
  } catch(e){
    return await spreadsheet.worksheetByTitle(title)!;
  }


  }

  static Future insert(List<Map<String, dynamic>> rowlist) async {

    return  _userSheet!.values.map.appendRows(rowlist);

  }

  static Future<bool> deletebyid(int id) async
  {
    if (_userSheet == null) return false;

    final index= await _userSheet!.values.rowIndexOf(id);
    if(index==-1) return false;

    return _userSheet!.deleteRow(index);

  }

  static Future<List<Datum>> getall() async
  {
    if (_userSheet == null) return <Datum>[];
    final json =await _userSheet!.values.map.allRows();
    return json==null ? <Datum>[]: json.map(Datum.fromJson).toList();
  }



  static Future<bool?> update(var id ,Map<String, dynamic> rowlist)async {
    if (_userSheet == null) return false;
      return  _userSheet!.values.map.insertRowByKey(id, rowlist);

  }


}

