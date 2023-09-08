


import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../core/data/data_source/local_data_sources/user_registration_data_source_impl.dart';
import '../../../core/data/models/registration_data_model.dart';

enum LoginState {
  initial,
  loading,
  success,
  error
}


class LoginProvider extends StateNotifier<LoginState>{

  UserRegistrationDataSourceImpl userRegistrationDataSourceImpl = UserRegistrationDataSourceImpl();

  LoginProvider() : super(LoginState.initial);

    Future<void> login(String userInput, String userPassword)  async {
      state = LoginState.loading;
      final registrationBox =  await Hive.openBox('user_data');
      print('inside login method');
   //final registrationBox  = await userRegistrationDataSourceImpl.getUserRegistration();
      Future.delayed(const Duration(milliseconds: 500),(){
        for (var i = 0; i < registrationBox.length; i++) {
          var storedData = registrationBox.getAt(i);
          if (storedData != null) {
            // Access email and password from storedData
            String email = storedData.email;
            String password = storedData.password;
            if (email == userInput && password == userPassword) {
              state = LoginState.success;
            }
          }else{
            state = LoginState.initial;
          }
        }
      });

      state = LoginState.initial;

  }
}

final loginCheckProvider = StateNotifierProvider<LoginProvider,LoginState>((ref) => LoginProvider());

