import '../../models/registration_data_model.dart';
import 'package:hive/hive.dart';

abstract class UserRegistrationDataSource{
  Box<RegistrationDataModelAdapter> getUserRegistration();
  Future<bool> userAuthStatus();
}