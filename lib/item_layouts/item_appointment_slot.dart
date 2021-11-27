import 'package:stylist_app/helpers/constants.dart';
import 'package:flutter/material.dart';

class ItemEventSlot extends StatefulWidget {
  DateTime dateTime;
  bool isAvailable;

  ItemEventSlot({required this.dateTime, required this.isAvailable});

  @override
  _ItemEventSlotState createState() => _ItemEventSlotState();
}

class _ItemEventSlotState extends State<ItemEventSlot> {
  TextStyle availableStyle = TextStyle(
    color: Colors.black,
    fontSize: 17,
  );
  TextStyle unavailableStyle = TextStyle(color: Colors.grey, fontSize: 17);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: InkWell(
          onTap: () {
            if (!widget.isAvailable) {
              showSnackBar("Slot not available", context);
            }
          },
          overlayColor: MaterialStateProperty.all(Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "${widget.dateTime.hour} : ${widget.dateTime.minute}",
              style: (widget.isAvailable ? availableStyle : unavailableStyle),
            ),
          ),
        ),
      ),
    );
  }
}
