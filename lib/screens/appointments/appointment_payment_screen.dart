import 'package:stylist_app/helpers/constants.dart';
import 'package:stylist_app/helpers/styles.dart';
import 'package:stylist_app/item_layouts/item_payment_method_mastercard.dart';
import 'package:stylist_app/item_layouts/item_payment_method_visa.dart';
import 'package:stylist_app/screens/appointments/add_card_layout.dart';
import 'package:stylist_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AppointmentPaymentScreen extends StatefulWidget {
  const AppointmentPaymentScreen({Key? key}) : super(key: key);

  @override
  _AppointmentPaymentScreenState createState() =>
      _AppointmentPaymentScreenState();
}

class _AppointmentPaymentScreenState extends State<AppointmentPaymentScreen> {
  var controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Methods"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Upcoming Payment details",
                style: grey_h1Style,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Saved Cards",
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheetMenu(
                            context: context, content: AddCardLayout());
                      },
                      child: Text(
                        "⚫ Add New",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xf0710000)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize(context).height * 0.4,
              child: ListView.builder(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: 25,
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  bool sender = (index % 2 == 0);

                  return sender
                      ? ItemPaymentMethodMastercard()
                      : ItemPaymentMethodVisa();
                },
              ),
            ),
            CustomButton(
                color: Colors.red,
                child: Text(
                  "Pay with card",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  showModalBottomSheetMenu(
                      context: context, content: AddCardLayout());
                }),
            CustomButton(
                color: Colors.yellow,
                child: Image.asset(
                  "assets/paypal_logo.png",
                  height: 100,
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
