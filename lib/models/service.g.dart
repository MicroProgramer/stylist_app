// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      json['service_id'] as String,
      json['title'] as String,
      json['description'] as String,
      (json['price'] as num).toDouble(),
      json['image_url'] as String,
      json['barber_id'] as String,
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'service_id': instance.service_id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'image_url': instance.image_url,
      'barber_id': instance.barber_id,
    };
