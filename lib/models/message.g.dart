// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      json['id'] as String,
      json['timestamp'] as int,
      json['sender_id'] as String,
      json['receiver_id'] as String,
      json['text'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp,
      'sender_id': instance.sender_id,
      'receiver_id': instance.receiver_id,
      'text': instance.text,
    };
