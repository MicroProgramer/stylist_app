import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stylist_app/helpers/constants.dart';
import 'package:stylist_app/helpers/styles.dart';
import 'package:stylist_app/screens/main_screen/main_screen.dart';
import 'package:stylist_app/screens/registration/authentication_screen.dart';
import 'package:stylist_app/screens/saved_items_screen.dart';
import 'package:stylist_app/widgets/custom_header_container_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomHeaderContainerDesign(
      paddingTop: 0,
      appBar: AppBar(
        title: Text("Settings"),
        elevation: 0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            // User card
            BigUserCard(
              cardColor: Colors.red,
              userName: "${mUser!.name ?? "Username"}",
              userProfilePic: NetworkImage(mUser!.image_url),
              cardActionWidget: SettingsItem(
                icons: Icons.edit,
                iconStyle: IconStyle(
                  withBackground: true,
                  borderRadius: 50,
                  backgroundColor: Colors.yellow[600],
                ),
                title: "Modify",
                subtitle: "Tap to update your Profile",
                onTap: () {
                  closeAllScreens(context);
                  openScreen(
                      context,
                      MainScreen(
                        defaultSelectedTab: 4,
                      ));
                },
              ),
            ),
            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () {
                    openScreen(context, SavedItemsScreen());
                  },
                  icons: CupertinoIcons.pencil_outline,
                  iconStyle: IconStyle(),
                  title: 'Saved',
                  subtitle: "View saved items",
                ),
                SettingsItem(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Confirm Logout"),
                            actions: [
                              GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Yes",
                                    style: normal_h2Style_bold,
                                  ),
                                ),
                                onTap: () {
                                  FirebaseAuth.instance.signOut().then((value) {
                                    closeAllScreens(context);
                                    openScreen(context, AuthenticationScreen());
                                  });
                                },
                              ),
                              GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "No",
                                    style: normal_h2Style_bold,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                  },
                  icons: Icons.exit_to_app_rounded,
                  iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.red),
                  title: "Logout",
                  subtitle: "Logout your account",
                ),
              ],
            ),
            SettingsGroup(
              settingsGroupTitle: "Policies",
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'DMCA Policy',
                  subtitle: "Check terms and conditions",
                  // trailing: Switch.adaptive(
                  //   value: false,
                  //   onChanged: (value) {},
                  // ),
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'Terms and Conditions',
                  subtitle: "Check terms and conditions",
                  // trailing: Switch.adaptive(
                  //   value: false,
                  //   onChanged: (value) {},
                  // ),
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'Refund Policy',
                  subtitle: "Learn more about refund policy",
                  // trailing: Switch.adaptive(
                  //   value: false,
                  //   onChanged: (value) {},
                  // ),
                ),
              ],
            ),
            SettingsGroup(
              settingsGroupTitle: "More",
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.support_agent,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.blue,
                  ),
                  title: 'Customer Support',
                  subtitle: "Contact our support team",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'About Us',
                  subtitle: "Learn more about $appName",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.star,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.orange,
                  ),
                  title: 'Rate Us',
                  subtitle: "Tap to rate this app",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
