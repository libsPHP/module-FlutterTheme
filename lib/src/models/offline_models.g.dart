// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CacheEntryAdapter extends TypeAdapter<CacheEntry> {
  @override
  final int typeId = 0;

  @override
  CacheEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CacheEntry(
      key: fields[0] as String,
      data: fields[1] as String,
      expiry: fields[2] as DateTime?,
      tags: (fields[3] as List).cast<String>(),
      createdAt: fields[4] as DateTime,
      updatedAt: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CacheEntry obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.expiry)
      ..writeByte(3)
      ..write(obj.tags)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CacheEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OfflineOperationAdapter extends TypeAdapter<OfflineOperation> {
  @override
  final int typeId = 1;

  @override
  OfflineOperation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OfflineOperation(
      operationId: fields[0] as String,
      type: fields[1] as String,
      endpoint: fields[2] as String,
      method: fields[3] as HttpMethod,
      data: (fields[4] as Map?)?.cast<String, dynamic>(),
      headers: (fields[5] as Map?)?.cast<String, String>(),
      priority: fields[6] as int,
      retryCount: fields[7] as int,
      maxRetries: fields[8] as int,
      createdAt: fields[9] as DateTime,
      scheduledAt: fields[10] as DateTime?,
      status: fields[11] as OfflineOperationStatus,
    );
  }

  @override
  void write(BinaryWriter writer, OfflineOperation obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.operationId)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.endpoint)
      ..writeByte(3)
      ..write(obj.method)
      ..writeByte(4)
      ..write(obj.data)
      ..writeByte(5)
      ..write(obj.headers)
      ..writeByte(6)
      ..write(obj.priority)
      ..writeByte(7)
      ..write(obj.retryCount)
      ..writeByte(8)
      ..write(obj.maxRetries)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.scheduledAt)
      ..writeByte(11)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfflineOperationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
