import 'package:riverpod/riverpod.dart';

import '../model/login_model.dart';

class LoginState {
  bool isLoading;
  AsyncValue<List<Loginform>> id;
  String error;

  LoginState(this.isLoading,this.id, this.error);


}