import 'package:stylist_app/item_layouts/item_slot.dart';
import 'package:flutter/material.dart';

class AvailableSlotScreen extends StatefulWidget {
  @override
  _AvailableSlotScreenState createState() => _AvailableSlotScreenState();
}

class _AvailableSlotScreenState extends State<AvailableSlotScreen> {
  var controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Slots"),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: 6,
        controller: controller,
        itemBuilder: (context, index) {
          return Container(
            child: ItemSlot(),
          );
        },
      ),
    );
  }
}
