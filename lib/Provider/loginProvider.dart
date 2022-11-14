import 'dart:convert';

import 'package:flutter_management/api/ApiServises.dart';
import 'package:flutter_management/model/login_model.dart';
import 'package:flutter_management/state/loginState.dart';
import 'package:riverpod/riverpod.dart';



final loginUserNotifier = StateNotifierProvider<LoginUserProvider,LoginState>((ref){
  return LoginUserProvider(ref);
});

class LoginUserProvider extends StateNotifier<LoginState> {
  Ref ref;

  LoginUserProvider(this.ref)
      :super(LoginState(false, const AsyncLoading(), 'initial'));


  loginUser() async {
    state = _loading();
   final apiResponse = await ref.read(apiProvider).getDataFromGs();
    if (apiResponse != null) {
      List<Loginform> die = apiResponse;
      print("DIE ==== $die");
     state = _dataState(die);
    }
    {
      state = _errorState('Timeout');

      print("First state========= $state");
    }
    return state;
  }
  LoginState _dataState(List<Loginform>  entity) {
    return LoginState(false, AsyncData(entity), '');
  }

  LoginState _loading() {
    return LoginState(true, state.id, '');
  }

  LoginState _errorState(String errMsg) {
    return LoginState(false, state.id, errMsg);
  }

}










