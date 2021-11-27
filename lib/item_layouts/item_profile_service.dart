import 'package:stylist_app/helpers/constants.dart';
import 'package:stylist_app/helpers/styles.dart';
import 'package:stylist_app/screens/stylist_profile_appointments_screen.dart';
import 'package:flutter/material.dart';

class ItemProfileService extends StatefulWidget {
  String serviceId, image_url;

  ItemProfileService({required this.serviceId, required this.image_url});

  @override
  _ItemProfileServiceState createState() => _ItemProfileServiceState();
}

class _ItemProfileServiceState extends State<ItemProfileService> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            widget.image_url,
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
        trailing: ElevatedButton(
          onPressed: () {
            openScreen(context, StylistProfileAppointmentsScreen());
          },
          child: Text("Book now"),
          style: redButtonProfileStyle_small,
        ),
      ),
    );
  }
}
