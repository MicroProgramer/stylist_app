import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stylist_app/helpers/constants.dart';
import 'package:stylist_app/helpers/styles.dart';
import 'package:stylist_app/listeners/user_data_change_listener.dart';
import 'package:stylist_app/models/registered_user.dart';
import 'package:stylist_app/screens/main_screen/user_layouts/layout_appointments.dart';
import 'package:stylist_app/screens/main_screen/user_layouts/layout_home.dart';
import 'package:stylist_app/screens/main_screen/user_layouts/layout_inbox.dart';
import 'package:stylist_app/screens/main_screen/user_layouts/layout_location.dart';
import 'package:stylist_app/screens/main_screen/user_layouts/layout_profile.dart';
import 'package:stylist_app/screens/notifications_screen.dart';
import 'package:stylist_app/screens/settings_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  int? defaultSelectedTab = 0;

  MainScreen({this.defaultSelectedTab});

  @override
  _MainScreenState createState() => _MainScreenState();
}

RegisteredUser _user = RegisteredUser(
    "_id", "User", "_email", "_phone", "_password", "", "", 0, 0, "");

class _MainScreenState extends State<MainScreen>
    implements UserDataChangeListener {
  int selectedLayoutIndex = 2;
  List<Widget> allLayouts = [
    LayoutInbox(),
    LayoutAppointments(),
    LayoutHome(),
    LayoutLocation(),
    LayoutProfile()
  ];

  var _bottomNavIndex = 0;
  late OverlayEntry entry;

  FirebaseMessaging _fcm = FirebaseMessaging.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  void initState() {
    updateToken();
    setState(() {
      selectedLayoutIndex = widget.defaultSelectedTab ?? 2;
      checkMySelf(FirebaseAuth.instance.currentUser!.uid, this);
      _fcm.setAutoInitEnabled(true);
    });

    entry = OverlayEntry(builder: (context) {
      return Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedLayoutIndex != 2) {
          setState(() {
            selectedLayoutIndex = 2;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: CurvedNavigationBar(
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.red,
          index: selectedLayoutIndex,
          color: Colors.redAccent,
          items: [
            ImageIcon(
              AssetImage("assets/messenger.png"),
              color: Colors.white,
            ),
            ImageIcon(
              AssetImage("assets/calender.png"),
              color: Colors.white,
            ),
            ImageIcon(
              AssetImage("assets/home.png"),
              color: Colors.white,
            ),
            ImageIcon(
              AssetImage("assets/locator.png"),
              color: Colors.white,
            ),
            ImageIcon(
              AssetImage("assets/user.png"),
              color: Colors.white,
            ),
          ],
          onTap: (index) {
            setState(() {
              selectedLayoutIndex = index;
            });
          },
        ),
        /*BottomNavigationBar(
          items: iconList,
          backgroundColor: Colors.red,
          selectedItemColor: Colors.white,
        ),*/
        /*BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.redAccent,
          notchMargin: 10.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: IconButton(

                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
        ),*/
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationsScreen()));
                        },
                        icon: Icon(Icons.notifications_active_outlined)),
                    ImageIcon(
                      AssetImage("assets/search.png"),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  appName,
                  textAlign: TextAlign.center,
                  style: normal_h1Style_bold,
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: ImageIcon(
                        AssetImage("assets/locator.png"),
                        color: Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          selectedLayoutIndex = 3;
                        });
                      },
                    ),
                    GestureDetector(
                      child: ImageIcon(
                        AssetImage("assets/settings.png"),
                        color: Colors.white,
                      ),
                      onTap: () {
                        openScreen(context, SettingsScreen());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          // leading: Row(
          //   children: [
          //     IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active_outlined)),
          //     IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active_outlined))
          //   ],
          // ),
          // actions: [
          //   IconButton(onPressed: (){}, icon: Icon(Icons.location_city_outlined)),
          // ],
        ),
        body: allLayouts[selectedLayoutIndex],
      ),
    );
  }

  @override
  void dataReceived(RegisteredUser? registeredUser) {
    mUser = registeredUser;
    _user = registeredUser!;

    // if (!registeredUser!.phone_verified) {
    //   Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) => CodeSentScreen(phone: mUser!.phone)));
    // }

    setState(() {});
  }

  Future<void> updateToken() async {
    if (FirebaseAuth.instance.currentUser != null) {
      String? token = await FirebaseMessaging.instance.getToken();

      if (token.toString().isNotEmpty && mUser != null) {
        mUser!.notification_token = token.toString();

        FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set(mUser!.toJson());
      }
    }
  }
}
