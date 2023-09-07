import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/data/models/registration_data_model.dart';
import '../../../core/data/repositories/local_repoitories/hive_db/user_registration_repo_Impl.dart';



final userRegistrationRepoProvider = Provider<UserRegistrationRepo>((ref) => UserRegistrationRepoImpl());

abstract class UserRegistrationRepo {
  Future<bool>  saveUserRegistration(RegistrationDataModel userRegistration);
}