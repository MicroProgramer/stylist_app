import 'package:json_annotation/json_annotation.dart';

part 'payment_method.g.dart';
@JsonSerializable(explicitToJson: true)
class PaymentMethod {
  int pay_id;
  String user_id, name, card_holder, exp_date, cvv, card_type;

  PaymentMethod(this.pay_id, this.user_id, this.name, this.card_holder,
      this.exp_date, this.cvv, this.card_type);

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}
