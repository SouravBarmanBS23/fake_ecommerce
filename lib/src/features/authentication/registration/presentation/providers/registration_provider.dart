import 'dart:core';
import 'package:fake_ecommerce/src/features/authentication/core/data/models/registration_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../../core/data/data_source/local_data_sources/user_registration_data_source_impl.dart';
import '../../../core/data/repositories/local_repoitories/hive_db/user_registration_repo_Impl.dart';

enum RegistrationState {
  initial,
  loading,
  success,
  error,
}

class RegistrationProvider extends StateNotifier<RegistrationState> {
  UserRegistrationRepoImpl userRegistrationRepoImpl = UserRegistrationRepoImpl();

  RegistrationProvider() : super(RegistrationState.initial);

  Future<void> register(RegistrationDataModel userRegistration) async {
    state = RegistrationState.loading;

    try {
      final value = await userRegistrationRepoImpl.saveUserRegistration(userRegistration);
      print('Registration status: $value');
      if (value) {
        state = RegistrationState.success;
      } else {
        state = RegistrationState.initial;
      }
    } catch (e) {
      state = RegistrationState.error;
      print('Error during registration: $e');
      // Handle errors and set the state accordingly
    }
  }
}

final registrationProvider = StateNotifierProvider<RegistrationProvider,RegistrationState>((ref) {
  return RegistrationProvider(); // Provide the instance, not the state
});
