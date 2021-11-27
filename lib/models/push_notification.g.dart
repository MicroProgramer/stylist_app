// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotification _$PushNotificationFromJson(Map<String, dynamic> json) =>
    PushNotification(
      json['notification_id'] as String,
      json['sender_id'] as String,
      json['receiver_id'] as String,
      json['text'] as String,
      json['read'] as bool,
      json['timestamp'] as int,
    );

Map<String, dynamic> _$PushNotificationToJson(PushNotification instance) =>
    <String, dynamic>{
      'notification_id': instance.notification_id,
      'sender_id': instance.sender_id,
      'receiver_id': instance.receiver_id,
      'text': instance.text,
      'read': instance.read,
      'timestamp': instance.timestamp,
    };
