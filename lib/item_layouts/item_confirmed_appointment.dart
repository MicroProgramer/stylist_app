import 'package:stylist_app/helpers/constants.dart';
import 'package:stylist_app/helpers/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemConfirmedAppointment extends StatefulWidget {
  bool paid;

  ItemConfirmedAppointment(this.paid);

  @override
  _ItemConfirmedAppointmentState createState() =>
      _ItemConfirmedAppointmentState();
}

Widget unpaid = Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    color: Colors.red,
  ),
  padding: EdgeInsets.all(5),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "Unpaid",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ],
  ),
);
Widget paid = Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    color: Colors.green,
  ),
  padding: EdgeInsets.all(5),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "Paid",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Icon(
        Icons.check,
        color: Colors.white,
      ),
    ],
  ),
);

class _ItemConfirmedAppointmentState extends State<ItemConfirmedAppointment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.white,
              spreadRadius: 5,
              blurRadius: 2,
              offset: Offset(0, 3))
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(),
              ),
              Expanded(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(test_image),
                      radius: 20,
                    ),
                    Text(
                      "Stylist Name",
                      style: normal_h4Style_bold,
                    )
                  ],
                ),
              ),
              Expanded(child: widget.paid ? paid : unpaid),
            ],
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                test_image,
                height: 50.0,
                width: 50.0,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hair Cut",
                  style: normal_h2Style,
                ),
                Text(
                  "\$50 - \$90",
                  style: normal_h4Style_bold,
                ),
              ],
            ),
            subtitle: Text(
              "(Wash and blow dry included)",
              style: normal_h5Style,
            ),
            trailing: Text("Wed, 02 Feb\n08:00 AM"),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              minVerticalPadding: 0,
              minLeadingWidth: 30,
              leading: Image.asset(
                "assets/red_marker.png",
                alignment: Alignment.center,
                height: 30,
                width: 30,
              ),
              title: Text(
                "Drop Off your location",
                style: normal_h5Style_bold,
              ),
              subtitle: Text(
                "341 E 84th St, New York, NY 10028, United States",
                style: normal_h6Style,
              ),
            ),
          )
        ],
      ),
    );
  }
}
