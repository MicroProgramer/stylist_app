import 'package:stylist_app/helpers/styles.dart';
import 'package:flutter/material.dart';

class ItemInbox extends StatefulWidget {
  @override
  _ItemInboxState createState() => _ItemInboxState();
}

class _ItemInboxState extends State<ItemInbox> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(
            "https://static.wikia.nocookie.net/mrbean/images/4/4b/Mr_beans_holiday_ver2.jpg/revision/latest?cb=20181130033425"),
      ),
      title: Text(
        "Mr. Bean",
        style: normal_h3Style,
      ),
      subtitle: Text(
        "What Party?",
        style: TextStyle(
          color: hintColor,
          fontSize: 14,
        ),
      ),
    );
  }
}
