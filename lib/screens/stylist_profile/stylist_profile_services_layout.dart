import 'package:stylist_app/item_layouts/item_profile_service.dart';
import 'package:flutter/material.dart';

class StylistProfileServicesLayout extends StatefulWidget {
  const StylistProfileServicesLayout({Key? key}) : super(key: key);

  @override
  _StylistProfileServicesLayoutState createState() =>
      _StylistProfileServicesLayoutState();
}

class _StylistProfileServicesLayoutState
    extends State<StylistProfileServicesLayout> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ItemProfileService(
          serviceId: index.toString(),
          image_url:
              "https://i.pinimg.com/736x/71/a8/81/71a881fee69f3cc252427774bf95e8c0.jpg",
        );
      },
    );
  }
}
