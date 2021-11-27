import 'package:stylist_app/item_layouts/item_confirmed_appointment.dart';
import 'package:flutter/material.dart';

class StylistProfileConfirmedAppointmentsLayout extends StatefulWidget {
  const StylistProfileConfirmedAppointmentsLayout({Key? key}) : super(key: key);

  @override
  _StylistProfileConfirmedAppointmentsLayoutState createState() =>
      _StylistProfileConfirmedAppointmentsLayoutState();
}

class _StylistProfileConfirmedAppointmentsLayoutState extends State<StylistProfileConfirmedAppointmentsLayout> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ItemConfirmedAppointment(index % 2 == 0);
      },
    );
  }
}
