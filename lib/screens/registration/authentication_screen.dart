import 'package:firebase_auth/firebase_auth.dart';
import 'package:stylist_app/helpers/constants.dart';
import 'package:stylist_app/listeners/tab_listener.dart';
import 'package:stylist_app/listeners/user_data_change_listener.dart';
import 'package:stylist_app/models/registered_user.dart';
import 'package:stylist_app/screens/main_screen/main_screen.dart';
import 'package:stylist_app/screens/registration/layouts/sginup_layout.dart';
import 'package:stylist_app/widgets/custom_tab_bar_view.dart';
import 'package:stylist_app/widgets/header_container_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'layouts/signin_layout.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen>
    with TickerProviderStateMixin
    implements TabListener, UserDataChangeListener {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    var _auth = FirebaseAuth.instance;
    var user = _auth.currentUser;
    if (user != null) {
      user.reload();
      checkMySelf(user.uid, this);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (tabController.index != 0) {
          tabController.index = 0;
          return false;
        }
        return true;
      },
      child: HeaderContainerDesign(
        child: CustomTabBarView(
          tabs_length: 2,
          tabs_titles_list: ["Sign In", "Sign Up"],
          tab_children_layouts: [
            SigninLayout(this),
            SignupLayout(this),
          ],
          tabController: tabController,
        ),
      ),
    );
  }

  @override
  void onTabChanged(int newIndex) {
    setState(() {
      tabController.index = newIndex;
    });
  }

  @override
  void dataReceived(RegisteredUser? registeredUser) {
    mUser = registeredUser;
    print(mUser!.toJson().toString());
    // if (!mUser!.phone_verified) {
    //   Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) => CodeSentScreen(phone: mUser!.phone)));
    // }
    // else{
    Navigator.popUntil(context, (route) => false);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MainScreen()));
    // }
  }
}
