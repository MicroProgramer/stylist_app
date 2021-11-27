import 'package:stylist_app/item_layouts/item_post.dart';
import 'package:flutter/material.dart';

class LayoutHome extends StatefulWidget {
  @override
  _LayoutHomeState createState() => _LayoutHomeState();
}

class _LayoutHomeState extends State<LayoutHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ItemPost(index);
        },
      ),
    );
  }
}
