import 'dart:async';

import 'package:fake_ecommerce/src/features/authentication/core/data/models/registration_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/data/repositories/local_repoitories/hive_db/user_registration_repo_Impl.dart';
import '../../domain/repositories/user_registration_repo.dart';

class RegistrationProvider {

  UserRegistrationRepoImpl userRegistrationRepoImpl = UserRegistrationRepoImpl();

    Future<bool> register(RegistrationDataModel userRegistration) async {
    try {
      final value = await userRegistrationRepoImpl
          .saveUserRegistration(userRegistration);
      if (value) {
        return true ;// User registration was successful
      } else {
        return false; // User registration failed
      }
    } catch (e) {
      print('Error during registration: $e');
      return false; // Handle errors and set the state accordingly
    }
  }
}


final homeBannerProvider = Provider<RegistrationProvider>((ref)=> RegistrationProvider());

final authenticationProvider = FutureProvider<bool>((ref) {
  return ref.watch(homeBannerProvider as AlwaysAliveProviderListenable<FutureOr<bool>>);
});
