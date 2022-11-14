import 'dart:convert';

import 'package:flutter_management/api/ApiServises.dart';
import 'package:flutter_management/model/SecondSheetModel.dart';
import 'package:flutter_management/model/ref.dart';
import 'package:flutter_management/model/subjects.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/schoolNameState.dart';




final schoolNameNotifier = FutureProvider<List<secondSheetModel>>((ref) async {
  return await ref.read(apiProvider).getSchoolNames();
});


final SubjectNameNotifier = FutureProvider<List<SubjectName>>((ref) async {
  return await ref.read(apiProvider).subjectname();
});


final ClassSixNotifier = FutureProvider<List<Subjects>>((ref) async {
  return await ref.read(apiProvider).getClass6();
});


final ClassFiveNotifier = FutureProvider<List<Subjects>>((ref) async {
  return await ref.read(apiProvider).getClass5();
});





final FistClasssNotifier = FutureProvider<List<FirstClass>>((ref) async {
  return await ref.read(apiProvider).firstclass();
});




final SecondClasssNotifier = FutureProvider<List<FirstClass>>((ref) async {
  return await ref.read(apiProvider).secondclass();
});