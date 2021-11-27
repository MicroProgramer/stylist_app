import 'package:flutter/material.dart';

class ItemPaymentMethodMastercard extends StatefulWidget {
  @override
  _ItemPaymentMethodMastercardState createState() =>
      _ItemPaymentMethodMastercardState();
}

class _ItemPaymentMethodMastercardState
    extends State<ItemPaymentMethodMastercard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        "assets/item_mastercard.png",
        // height: 100.0,
        // width: 100.0,
      ),
    );
  }
}
