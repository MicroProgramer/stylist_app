import 'package:stylist_app/item_layouts/item_profile_post.dart';
import 'package:stylist_app/widgets/custom_header_container_design.dart';
import 'package:flutter/material.dart';

class SavedItemsScreen extends StatefulWidget {
  const SavedItemsScreen({Key? key}) : super(key: key);

  @override
  _SavedItemsScreenState createState() => _SavedItemsScreenState();
}

class _SavedItemsScreenState extends State<SavedItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomHeaderContainerDesign(
      paddingTop: 10,
      appBar: AppBar(
        title: Text("Saved"),
        elevation: 0,
      ),
      child: GridView.builder(
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
      ),
    );
  }
}
