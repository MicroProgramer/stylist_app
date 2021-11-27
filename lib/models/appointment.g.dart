// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      json['id'] as String,
      json['user_id'] as String,
      json['barber_id'] as String,
      json['name'] as String,
      json['email'] as String,
      json['contact'] as String,
      json['country'] as String,
      json['state'] as String,
      json['city'] as String,
      json['address'] as String,
      json['timestamp'] as int,
      (json['drop_lat'] as num).toDouble(),
      (json['drop_lng'] as num).toDouble(),
      json['paid'] as bool,
      json['completed'] as bool,
      (json['rating'] as num).toDouble(),
      json['slot_id'] as String,
      json['service_id'] as String,
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'barber_id': instance.barber_id,
      'name': instance.name,
      'email': instance.email,
      'contact': instance.contact,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'address': instance.address,
      'timestamp': instance.timestamp,
      'drop_lat': instance.drop_lat,
      'drop_lng': instance.drop_lng,
      'paid': instance.paid,
      'completed': instance.completed,
      'rating': instance.rating,
      'slot_id': instance.slot_id,
      'service_id': instance.service_id,
    };
