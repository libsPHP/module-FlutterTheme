// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceInfoModel _$DeviceInfoModelFromJson(Map<String, dynamic> json) =>
    DeviceInfoModel(
      platform: json['platform'] as String,
      deviceId: json['deviceId'] as String,
      model: json['model'] as String,
      brand: json['brand'] as String,
      systemName: json['systemName'] as String,
      systemVersion: json['systemVersion'] as String,
      screenResolution: json['screenResolution'] as String,
      isPhysicalDevice: json['isPhysicalDevice'] as bool,
      ramMb: (json['ramMb'] as num?)?.toInt(),
      storageGb: (json['storageGb'] as num?)?.toInt(),
      additionalInfo: json['additionalInfo'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$DeviceInfoModelToJson(DeviceInfoModel instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'deviceId': instance.deviceId,
      'model': instance.model,
      'brand': instance.brand,
      'systemName': instance.systemName,
      'systemVersion': instance.systemVersion,
      'screenResolution': instance.screenResolution,
      'isPhysicalDevice': instance.isPhysicalDevice,
      if (instance.ramMb case final value?) 'ramMb': value,
      if (instance.storageGb case final value?) 'storageGb': value,
      'additionalInfo': instance.additionalInfo,
    };
