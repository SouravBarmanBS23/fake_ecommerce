

import 'package:hive/hive.dart';
part 'registration_data_model.g.dart';

@HiveType(typeId: 0)
class RegistrationDataModel{
  @HiveField(0)
  late String userName;
  @HiveField(1)
  late String email;
  @HiveField(2)
  late String password;
  @HiveField(3)
  late String phoneNumber;

  RegistrationDataModel({
    required this.userName,
    required this.email,
    required this.password,
    required this.phoneNumber,});

  // flutter packages pub run build_runner build
}