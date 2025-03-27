// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_db_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealDBEntityAdapter extends TypeAdapter<MealDBEntity> {
  @override
  final int typeId = 2;

  @override
  MealDBEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealDBEntity(
      id: fields[0] as String,
      name: fields[1] as String,
      thumbnail: fields[2] as String,
      category: fields[3] as String,
      area: fields[4] as String,
      instructions: fields[5] as String,
      ingredients: (fields[6] as List).cast<String>(),
      measures: (fields[7] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, MealDBEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.thumbnail)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.area)
      ..writeByte(5)
      ..write(obj.instructions)
      ..writeByte(6)
      ..write(obj.ingredients)
      ..writeByte(7)
      ..write(obj.measures);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealDBEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
