import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable(explicitToJson: true)
class Service {
  String service_id, title, description;
  double price;
  String image_url, barber_id;

  Service(this.service_id, this.title, this.description, this.price,
      this.image_url, this.barber_id);

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
