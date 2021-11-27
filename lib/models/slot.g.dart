// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Slot _$SlotFromJson(Map<String, dynamic> json) => Slot(
      json['slot_id'] as String,
      json['barber_id'] as String,
      json['user_id'] as String,
      json['service_id'] as String,
      json['timestamp'] as int,
      json['available'] as bool,
    );

Map<String, dynamic> _$SlotToJson(Slot instance) => <String, dynamic>{
      'slot_id': instance.slot_id,
      'barber_id': instance.barber_id,
      'user_id': instance.user_id,
      'service_id': instance.service_id,
      'timestamp': instance.timestamp,
      'available': instance.available,
    };
