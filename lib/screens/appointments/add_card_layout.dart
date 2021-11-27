import 'package:stylist_app/helpers/constants.dart';
import 'package:stylist_app/helpers/styles.dart';
import 'package:stylist_app/screens/appointments/payment_completed_screen.dart';
import 'package:stylist_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AddCardLayout extends StatefulWidget {
  @override
  _AddCardLayoutState createState() => _AddCardLayoutState();
}

class _AddCardLayoutState extends State<AddCardLayout> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                "Enter Details",
                style: TextStyle(color: Color(0xf0710000)),
                textAlign: TextAlign.center,
              )),
              Expanded(
                  child: Text(
                "Scan a card",
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(label: Text("Name")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(label: Text("Card Number")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(label: Text("Expiry Date")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLength: 3,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(label: Text("CVV")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Text(
                "Save this card",
                style: grey_h3Style,
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
                color: Colors.red,
                child: Text(
                  "Pay Now",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  openScreen(context, PaymentCompletedScreen());
                }),
          )
        ],
      ),
    );
  }
}
