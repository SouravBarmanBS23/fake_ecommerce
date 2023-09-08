import '../../models/registration_data_model.dart';
import 'package:hive/hive.dart';

abstract class UserRegistrationDataSource{
  Future<Box> getUserRegistration();
  Future<bool> userAuthStatus();
}