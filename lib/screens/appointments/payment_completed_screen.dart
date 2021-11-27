import 'package:stylist_app/helpers/constants.dart';
import 'package:stylist_app/helpers/styles.dart';
import 'package:stylist_app/screens/main_screen/main_screen.dart';
import 'package:stylist_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PaymentCompletedScreen extends StatefulWidget {
  @override
  _PaymentCompletedScreenState createState() => _PaymentCompletedScreenState();
}

class _PaymentCompletedScreenState extends State<PaymentCompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Successful"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                child: Image.asset(
                  "assets/payment_complete.png",
                  height: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "You have successfully paid for availing your service from stylist. The total amount you paid is \$90.00.\n\nPlease check your .",
                  textAlign: TextAlign.center,
                  style: normal_h2Style,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: CustomButton(
                    color: Colors.red,
                    child: Text(
                      "Finish",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      closeAllScreens(context);
                      openScreen(context, MainScreen());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
