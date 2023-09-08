

import 'package:fake_ecommerce/src/features/authentication/core/data/data_source/local_data_sources/user_registration_data_source.dart';
import 'package:fake_ecommerce/src/features/authentication/core/data/models/registration_data_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final userRegistrationDataSourceProvider = Provider<UserRegistrationDataSource>((ref) => UserRegistrationDataSourceImpl());

class UserRegistrationDataSourceImpl implements UserRegistrationDataSource{
  @override
   Future<Box> getUserRegistration() async{
    // It wil gives the box of user_info
    return  Hive.box<RegistrationDataModelAdapter>('user_info');
  }

  @override
  Future<bool> userAuthStatus() async {
  final auth = Hive.box<RegistrationDataModelAdapter>('user_info');
  if (auth.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}
}