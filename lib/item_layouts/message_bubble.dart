import 'package:flutter/material.dart';

class MessageBubble extends StatefulWidget {
  final String text;
  final Type userType;

  MessageBubble({required this.text, required this.userType});

  @override
  _MessageBubbleState createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        child: Column(
          crossAxisAlignment: widget.userType == Type.sender
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Material(
              borderRadius: BorderRadius.only(
                  topLeft: widget.userType == Type.sender
                      ? Radius.circular(30)
                      : Radius.circular(30),
                  topRight: widget.userType == Type.receiver
                      ? Radius.circular(30)
                      : Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: widget.userType == Type.sender
                  ? Color(0xF0E7F0FF)
                  : Color(0xF0EBEBEB),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SelectableText(
                  "${widget.text}",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Type { sender, receiver }
