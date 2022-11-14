class Subjects {
  Subjects({
    required this.subjectClass,
    required this.works,
    required this.english,
    required this.math,
    required this.evs,
    required this.socialStudies,
    required this.science,
    required this.hindi,
    required this.urudu,
    required this.telugu,
  });


  int subjectClass;
  dynamic works;
  dynamic english;
  dynamic math;
  dynamic evs;
  dynamic socialStudies;
  dynamic science;
  dynamic hindi;
  dynamic urudu;
  dynamic telugu;
}

class SubjectName{
  String? subject_name;

  SubjectName({
    this.subject_name,
});
}


class FirstClass{
  FirstClass({
    required this.sno,
    required this.subjectClass,
    required this.works,
    required this.english,
    required this.math,
    required this.evs,
    required this.socialStudies,
    required this.science,
    required this.hindi,
    required this.urudu,
    required this.telugu,
  });

  dynamic sno;
  dynamic subjectClass;
  dynamic works;
  dynamic english;
  dynamic math;
  dynamic evs;
  dynamic socialStudies;
  dynamic science;
  dynamic hindi;
  dynamic urudu;
  dynamic telugu;
}