// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mymodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentItemAdapter extends TypeAdapter<StudentItem> {
  @override
  final int typeId = 0;

  @override
  StudentItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentItem(
      subject: fields[0] as String,
      topic: fields[1] as String,
      duration: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, StudentItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.subject)
      ..writeByte(1)
      ..write(obj.topic)
      ..writeByte(2)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
