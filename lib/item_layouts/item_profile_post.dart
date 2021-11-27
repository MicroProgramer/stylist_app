import 'package:flutter/material.dart';

class ItemProfilePost extends StatefulWidget {
  String postId, image_url;

  ItemProfilePost({required this.postId, required this.image_url});

  @override
  _ItemProfilePostState createState() => _ItemProfilePostState();
}

class _ItemProfilePostState extends State<ItemProfilePost> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          widget.image_url,
          height: 100.0,
          width: 100.0,
        ),
      ),
    );
  }
}
