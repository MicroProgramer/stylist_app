import 'package:json_annotation/json_annotation.dart';

part 'slot.g.dart';

@JsonSerializable()
class Slot {
  String slot_id, barber_id, user_id, service_id;
  int timestamp;
  bool available;

  Slot(this.slot_id, this.barber_id, this.user_id, this.service_id,
      this.timestamp, this.available);

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);

  Map<String, dynamic> toJson() => _$SlotToJson(this);
}
