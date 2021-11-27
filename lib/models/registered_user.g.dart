// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registered_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisteredUser _$RegisteredUserFromJson(Map<String, dynamic> json) =>
    RegisteredUser(
      json['user_id'] as String,
      json['name'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['password'] as String,
      json['image_url'] as String,
      json['country_code'] as String,
      (json['latitude'] as num).toDouble(),
      (json['longitude'] as num).toDouble(),
      json['notification_token'] as String,
    );

Map<String, dynamic> _$RegisteredUserToJson(RegisteredUser instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'image_url': instance.image_url,
      'country_code': instance.country_code,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'notification_token': instance.notification_token,
    };
