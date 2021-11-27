import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment {
  String id,
      user_id,
      barber_id,
      name,
      email,
      contact,
      country,
      state,
      city,
      address;
  int timestamp;
  double drop_lat, drop_lng;
  bool paid, completed;
  double rating;
  String slot_id, service_id;

  Appointment(
      this.id,
      this.user_id,
      this.barber_id,
      this.name,
      this.email,
      this.contact,
      this.country,
      this.state,
      this.city,
      this.address,
      this.timestamp,
      this.drop_lat,
      this.drop_lng,
      this.paid,
      this.completed,
      this.rating,
      this.slot_id,
      this.service_id);

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}
