import 'package:stylist_app/helpers/styles.dart';
import 'package:flutter/material.dart';

class ItemSlot extends StatefulWidget {
  @override
  _ItemSlotState createState() => _ItemSlotState();
}

ButtonStyle unSelectedButton = TextButton.styleFrom(
  primary: Colors.black,
  onSurface: Colors.black,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    side: BorderSide(width: 1, color: Colors.grey),
  ),
);

class _ItemSlotState extends State<ItemSlot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              elevation: 15,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Thu, 09 Apr",
                        style: normal_h1Style_bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("3 Slots available"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text("08:00"),
                            style: unSelectedButton,
                          ),
                          TextButton(
                            child: Text("12:00"),
                            onPressed: () {},
                            style: unSelectedButton,
                          ),
                          TextButton(
                            child: Text("15:00"),
                            onPressed: () {},
                            style: unSelectedButton,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
