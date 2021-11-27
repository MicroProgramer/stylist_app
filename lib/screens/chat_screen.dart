import 'package:stylist_app/helpers/constants.dart';
import 'package:stylist_app/helpers/styles.dart';
import 'package:stylist_app/item_layouts/message_bubble.dart';
import 'package:stylist_app/screens/stylist_profile_screen.dart';
import 'package:stylist_app/widgets/custom_header_container_design.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController controller = ScrollController();
  double topContainer = 0;

  @override
  void initState() {
    controller.addListener(() {
      double value = controller.offset / 50;

      setState(() {
        topContainer = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomHeaderContainerDesign(
      appBar: AppBar(
        elevation: 0,
        title: Text("Chat"),
      ),
      paddingTop: 0,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                openScreen(context, StylistProfileScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: "stylist_dp",
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                          "https://static.wikia.nocookie.net/mrbean/images/4/4b/Mr_beans_holiday_ver2.jpg/revision/latest?cb=20181130033425"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Stylist Name",
                      style: normal_h3Style_bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ListView.builder(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: 25,
              controller: controller,
              itemBuilder: (context, index) {
                bool sender = (index % 2 == 0);

                return MessageBubble(
                  text: !sender ? "Hi, about that party!... 😅 " : "What Party",
                  userType: sender ? Type.sender : Type.receiver,
                );
                // );
              },
            ),
          ),
          Container(
            color: Colors.redAccent,
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFormField(
                            // textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            onChanged: (value) {},
                            style: TextStyle(fontSize: 17),
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 15, right: 5, top: 10, bottom: 10),
                              hintText: "Write your message",
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: TextStyle(
                                  color: Color(0xF06B6B6B), fontSize: 17),
                              border: OutlineInputBorder(
                                gapPadding: 0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                gapPadding: 0,
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    child: Image.asset("assets/send_btn.png"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
