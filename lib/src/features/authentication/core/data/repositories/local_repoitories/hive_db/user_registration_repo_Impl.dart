import 'dart:developer';

import 'package:fake_ecommerce/src/features/authentication/core/data/data_source/local_data_sources/user_registration_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../registration/domain/repositories/user_registration_repo.dart';
import '../../../models/registration_data_model.dart';
import 'package:hive/hive.dart';

class UserRegistrationRepoImpl implements UserRegistrationRepo {
  @override
  Future<bool> saveUserRegistration(RegistrationDataModel userRegistration) async {
    try {
      final userDataBox = await Hive.openBox('user_data');
      if(userDataBox.isNotEmpty){
        await userDataBox.clear();
      }
      await userDataBox.add(userRegistration);
      print('Data saved to Hive');
      return true; // Indicate success
    } catch (e) {
      print('Error saving data to Hive: $e');
      return false; // Indicate failure
    }
  }
}