import 'package:stylist_app/helpers/constants.dart';
import 'package:stylist_app/item_layouts/item_inbox.dart';
import 'package:stylist_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class LayoutInbox extends StatefulWidget {
  @override
  _LayoutInboxState createState() => _LayoutInboxState();
}

class _LayoutInboxState extends State<LayoutInbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 15),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: 15,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ItemInbox(),
            onTap: () {
              openScreen(context, ChatScreen());
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 0,
          );
        },
      ),
    );
  }
}
