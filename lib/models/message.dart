import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  String id;
  int timestamp;
  String sender_id, receiver_id, text;

  Message(this.id, this.timestamp, this.sender_id, this.receiver_id, this.text);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
