// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BucketModelAdapter extends TypeAdapter<BucketModel> {
  @override
  final int typeId = 2;

  @override
  BucketModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BucketModel(
      name: fields[0] as String,
      email: fields[1] as String,
      trips: (fields[2] as List).cast<CityModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, BucketModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.trips);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BucketModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CityModelAdapter extends TypeAdapter<CityModel> {
  @override
  final int typeId = 3;

  @override
  CityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CityModel(
      name: fields[0] as String,
      image: fields[1] as String,
      amount: fields[2] as double,
      hotels: (fields[3] as List).cast<Hotel>(),
    );
  }

  @override
  void write(BinaryWriter writer, CityModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.hotels);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HotelAdapter extends TypeAdapter<Hotel> {
  @override
  final int typeId = 4;

  @override
  Hotel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hotel(
      name: fields[0] as String,
      address: fields[1] as String,
      imageUrl: fields[2] as String,
      days: fields[3] as int,
      date: fields[6] as String,
      price: fields[4] as double,
      isSelected: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Hotel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.days)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.isSelected)
      ..writeByte(6)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HotelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
