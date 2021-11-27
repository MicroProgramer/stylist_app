import 'package:json_annotation/json_annotation.dart';

part 'barber.g.dart';

@JsonSerializable()
class Barber {
  String barber_id, name, email, phone, password, image_url, country_code;
  double latitude, longitude;
  String notification_token;
  double avg_rating;

  Barber(
      this.barber_id,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.image_url,
      this.country_code,
      this.latitude,
      this.longitude,
      this.notification_token,
      this.avg_rating);

  factory Barber.fromJson(Map<String, dynamic> json) => _$BarberFromJson(json);

  Map<String, dynamic> toJson() => _$BarberToJson(this);
}
