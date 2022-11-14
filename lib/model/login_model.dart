import 'dart:convert';

/*List<Loginform> loginformFromJson(String str) => List<Loginform>.from(json.decode(str).map((x) => Loginform.fromJson(x)));

String loginformToJson(List<Loginform> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));*/



class Loginform {
  Loginform({
    required this.coordinatorName,
    required this.coordinatorCode,
    required this.login,
    required this.password,
  });

  String coordinatorName;
  String coordinatorCode;
  String login;
  dynamic password;

  /*factory Loginform.fromJson(List<dynamic> json) => Loginform(
    coordinatorName: json[0]["Coordinator_Name"],
    coordinatorCode: json[0]["Coordinator_Code"] as String,
    login: json[0]["Login"] as String,
    password: json[0]["Password"] as dynamic,
  );


dynamic toJson() => {
    "Coordinator_Name": coordinatorName,
    "Coordinator_Code": coordinatorCode,
    "Login": login,
    "Password": password,
  };*/


}
