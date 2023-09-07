// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegistrationDataModelAdapter extends TypeAdapter<RegistrationDataModel> {
  @override
  final int typeId = 0;

  @override
  RegistrationDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RegistrationDataModel(
      userName: fields[0] as String,
      email: fields[1] as String,
      password: fields[2] as String,
      phoneNumber: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RegistrationDataModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistrationDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
