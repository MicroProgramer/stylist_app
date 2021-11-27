import 'package:flutter/material.dart';

class ItemPaymentMethodVisa extends StatefulWidget {
  @override
  _ItemPaymentMethodVisaState createState() => _ItemPaymentMethodVisaState();
}

class _ItemPaymentMethodVisaState extends State<ItemPaymentMethodVisa> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        "assets/item_visa.png",
        // height: 100.0,
        // width: 100.0,
      ),
    );
  }
}
