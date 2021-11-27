import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stylist_app/listeners/user_data_change_listener.dart';
import 'package:stylist_app/models/registered_user.dart';
import 'package:flutter/material.dart';

bool userSignedIn = false;
late RegisteredUser? mUser;
late String userMail;
String appName = "Mobi Style";
String googleAPIKey = "AIzaSyCp2I8VzxRNn4ls-1bPs1eGJDYDqxcimEM";
String test_image =
    "https://static.wikia.nocookie.net/mrbean/images/4/4b/Mr_beans_holiday_ver2.jpg/revision/latest?cb=20181130033425";

void checkMySelf(String uid, UserDataChangeListener listener) async {
  var document = await FirebaseFirestore.instance.collection('users').doc(uid);
  document.get().then((value) {
    RegisteredUser object = RegisteredUser.fromJson(value.data());
    listener.dataReceived(object);
  });
}

void showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  final snackBar = new SnackBar(
    content: Text(message),
    backgroundColor: Color(0xFF505050),
    behavior: SnackBarBehavior.floating,
  );
  // Find the Scaffold in the Widget tree and use it to show a SnackBar!
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

void openScreen(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void closeAllScreens(BuildContext context) {
  Navigator.popUntil(context, (route) => false);
}

bool isPhoneValid(String phone, BuildContext context, String country_code) {
  if (country_code.isEmpty) {
    showSnackBar("Re-select your phone country", context);
    return false;
  }
  if (phone.startsWith("0")) {
    showSnackBar("Do not include first 0 with in phone number", context);
    return false;
  } else if (phone.length != 10 || !phone.startsWith("3")) {
    showSnackBar("Enter valid phone number", context);
    return false;
  }

  return true;
}

void showModalBottomSheetMenu(
    {required BuildContext context, required Widget content}) {
  showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Container(child: content);
      });
}

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

Future<DateTime> selectDate(BuildContext context) async {
  DateTime selectedDate = DateTime.now();
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101));
  if (picked != null && picked != selectedDate) selectedDate = picked;

  return selectedDate;
}