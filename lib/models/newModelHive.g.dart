// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newModelHive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsModelHiveAdapter extends TypeAdapter<NewsModelHive> {
  @override
  final int typeId = 0;

  @override
  NewsModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsModelHive(
      title: fields[0] as String,
      description: fields[1] as String,
      newsUrl: fields[2] as String,
      imageUrl: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NewsModelHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.newsUrl)
      ..writeByte(3)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
