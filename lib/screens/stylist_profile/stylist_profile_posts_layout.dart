import 'package:stylist_app/item_layouts/item_profile_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StylistProfilePostsLayout extends StatefulWidget {
  const StylistProfilePostsLayout({Key? key}) : super(key: key);

  @override
  _StylistProfilePostsLayoutState createState() =>
      _StylistProfilePostsLayoutState();
}

class _StylistProfilePostsLayoutState extends State<StylistProfilePostsLayout> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (context, index) {
        return ItemProfilePost(
          postId: index.toString(),
          image_url:
              "https://i.pinimg.com/736x/71/a8/81/71a881fee69f3cc252427774bf95e8c0.jpg",
        );
      },
      itemCount: 100,
    );
  }
}
