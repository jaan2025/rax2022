

class WriteData{
  static final String id = 'S.No';
  static final String classes = 'Class';
  static final String works = 'Works';
  static final String english = 'English';
  static final String math = 'Math';
  static final String evs = 'Evs';
  static final String social = 'Social Studies';
  static final String science = 'Science';
  static final String hindi = 'Hindi';
  static final String urudu = 'Urudu';
  static final String telugu = 'Telugu';

  static List<String> getFields() => [id,classes, works, english, math, evs, social, science, hindi, urudu, telugu ];
}

class Datum{
      String id;
      String classes;
      String works;
      String english;
      String math;
      String evs;
      String social;
      String science;
      String hindi;
      String urudu;
      String telugu;

      Datum({
        required this.id,
        required this.classes,
        required this.works,
        required this.english,
        required this.math,
        required this.evs,
        required this.social,
        required this.science,
        required this.hindi,
        required this.urudu,
        required this.telugu
      });

      static Datum fromJson(Map<String, dynamic> json)=> Datum
          (id: (json[WriteData.id]),
          classes: (json[WriteData.classes]),
          works: json[WriteData.works],
          english: json[WriteData.english],
          math: json[WriteData.math],
          evs: json[WriteData.evs],
          social: json[WriteData.social],
          science: json[WriteData.science],
          hindi: json[WriteData.hindi],
          urudu: json[WriteData.urudu], telugu: json[WriteData.telugu]);


      Map<String, dynamic> toJson()=>{
        WriteData.id: id,
        WriteData.classes:classes,
        WriteData.works:works,
        WriteData.english:english,
        WriteData.math:math,
        WriteData.evs:evs,
        WriteData.social:social,
        WriteData.science:science,
        WriteData.hindi:hindi,
        WriteData.urudu:urudu,
        WriteData.telugu:telugu,
      };


}


