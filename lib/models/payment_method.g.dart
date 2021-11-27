// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      json['pay_id'] as int,
      json['user_id'] as String,
      json['name'] as String,
      json['card_holder'] as String,
      json['exp_date'] as String,
      json['cvv'] as String,
      json['card_type'] as String,
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'pay_id': instance.pay_id,
      'user_id': instance.user_id,
      'name': instance.name,
      'card_holder': instance.card_holder,
      'exp_date': instance.exp_date,
      'cvv': instance.cvv,
      'card_type': instance.card_type,
    };
