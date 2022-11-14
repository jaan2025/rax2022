import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/SecondSheetModel.dart';



class schoolNameState {
  bool isLoading;
  AsyncValue<List<secondSheetModel>> code;
  String error;

  schoolNameState(this.isLoading,this.code, this.error);


}