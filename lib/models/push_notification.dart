import 'package:json_annotation/json_annotation.dart';

part 'push_notification.g.dart';

@JsonSerializable()
class PushNotification {
  String notification_id, sender_id, receiver_id, text;
  bool read;
  int timestamp;

  PushNotification(this.notification_id, this.sender_id, this.receiver_id,
      this.text, this.read, this.timestamp);

  factory PushNotification.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$PushNotificationToJson(this);
}
