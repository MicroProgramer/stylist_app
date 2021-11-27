// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barber.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Barber _$BarberFromJson(Map<String, dynamic> json) => Barber(
      json['barber_id'] as String,
      json['name'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['password'] as String,
      json['image_url'] as String,
      json['country_code'] as String,
      (json['latitude'] as num).toDouble(),
      (json['longitude'] as num).toDouble(),
      json['notification_token'] as String,
      (json['avg_rating'] as num).toDouble(),
    );

Map<String, dynamic> _$BarberToJson(Barber instance) =>
    <String, dynamic>{
      'barber_id': instance.barber_id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'image_url': instance.image_url,
      'country_code': instance.country_code,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'notification_token': instance.notification_token,
      'avg_rating': instance.avg_rating,
    };
