import 'package:stylist_app/helpers/constants.dart';
import 'package:stylist_app/helpers/styles.dart';
import 'package:stylist_app/screens/stylist_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemPost extends StatefulWidget {
  int index;

  ItemPost(this.index);

  @override
  _ItemPostState createState() => _ItemPostState();
}

class _ItemPostState extends State<ItemPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(0xF0E0E0E0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   children: [
          //     Expanded(
          //       flex: 1,
          //       child: CircleAvatar(
          //         radius: 30,
          //         backgroundColor: Colors.transparent,
          //         child: Image.asset("assets/man.png"),
          //       ),
          //     ),
          //     Expanded(
          //         flex: 4,
          //         child: Padding(
          //           padding: const EdgeInsets.only(left: 8.0),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             children: [
          //               Row(
          //                 children: [
          //                   Text(
          //                     "Stylist Name",
          //                     style: TextStyle(fontFamily: "Jokerman"),
          //                   ),
          //                   Padding(
          //                     padding: const EdgeInsets.only(left: 5),
          //                     child: Text(
          //                       "Follow",
          //                       style: red_h3Style,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               Text(
          //                 "New York",
          //               ),
          //             ],
          //           ),
          //         )),
          //     Expanded(
          //       flex: 1,
          //       child: IconButton(icon: Icon(Icons.menu), onPressed: () {  },
          //
          //       )
          //     )
          //   ],
          // )
          ListTile(
            leading: GestureDetector(
              onTap: () {
                openScreen(context, StylistProfileScreen());
              },
              child: Hero(
                tag: "stylist_dp",
                child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                        "https://static.wikia.nocookie.net/mrbean/images/4/4b/Mr_beans_holiday_ver2.jpg/revision/latest?cb=20181130033425")),
              ),
            ),
            title: Row(
              children: [
                Text(
                  "Mr. Bean",
                  style: TextStyle(fontFamily: "Jokerman"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: GestureDetector(
                    child: Text(
                      "Follow",
                      style: red_h4Style,
                    ),
                    onTap: () {
                      showSnackBar("Follow of item ${widget.index}", context);
                    },
                  ),
                ),
              ],
            ),
            subtitle: Text("New York"),
            trailing: PopupMenuButton<String>(
              onSelected: (String value) {
                showSnackBar(value, context);
              },
              itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'report',
                  child: Text('Report'),

                ),
                PopupMenuItem<String>(
                  value: 'hide',
                  child: Text('Hide'),

                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              child: Text(
                "Hair Cutting",
                style: normal_h2Style,
              ),
              onTap: () {
                showSnackBar("Description of item ${widget.index}", context);
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                    "https://m.media-amazon.com/images/M/MV5BNTJmMWNiZGQtOTljYi00Mzc1LTgyZmMtOTBiZDc2YjllZDdjXkEyXkFqcGdeQXVyMzk1MjY5Njc@._V1_.jpg",
                    height: 150,
                    fit: BoxFit.fill),
              ),
              onTap: () {
                showSnackBar("Image of item ${widget.index}", context);
              },
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  showSnackBar("Like of item ${widget.index}", context);
                },
                icon: ImageIcon(
                  AssetImage("assets/unliked.png"),
                ),
              ),
              IconButton(
                onPressed: () {
                  showSnackBar("Comment of item ${widget.index}", context);
                },
                icon: ImageIcon(
                  AssetImage("assets/comment.png"),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.08,
                  child: TextFormField(
                    // textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (value) {},
                    style: TextStyle(fontSize: 12),
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 5, right: 5),
                      hintText: "Write your comment",
                      hintStyle:
                          TextStyle(color: Color(0xF06B6B6B), fontSize: 12),
                      border: OutlineInputBorder(
                        gapPadding: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        // borderSide: BorderSide(
                        //   width: 5,
                        // ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xF0707070))),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    showSnackBar("Save of item ${widget.index}", context);
                  },
                  icon: Icon(Icons.save)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "2k likes",
                  style: normal_h4Style_bold,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "2 comments",
                    style: normal_h4Style_bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("10 minutes ago"),
          ),
        ],
      ),
    );
  }
}
