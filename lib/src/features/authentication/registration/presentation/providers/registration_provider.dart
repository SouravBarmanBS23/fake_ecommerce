import 'dart:core';
import 'package:fake_ecommerce/src/features/authentication/core/data/models/registration_data_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../../core/data/data_source/local_data_sources/user_registration_data_source_impl.dart';
import '../../../core/data/repositories/local_repoitories/hive_db/user_registration_repo_Impl.dart';

class RegistrationProvider {

  UserRegistrationRepoImpl userRegistrationRepoImpl = UserRegistrationRepoImpl();

  void register(RegistrationDataModel userRegistration) async {
    try {
      final value = await userRegistrationRepoImpl
          .saveUserRegistration(userRegistration);
      print('Registration status: $value');
    }
    catch (e) {
      print('Error during registration: $e');
      // Handle errors and set the state accordingly
    }
  }
}

final registrationProvider = Provider<RegistrationProvider>((ref) => RegistrationProvider());

final authProvider = FutureProvider<bool>((ref){
  return ref.read(userRegistrationDataSourceProvider).userAuthStatus();
});
