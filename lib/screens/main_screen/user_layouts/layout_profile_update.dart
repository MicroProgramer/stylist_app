import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stylist_app/helpers/constants.dart';
import 'package:stylist_app/helpers/styles.dart';
import 'package:stylist_app/listeners/user_data_change_listener.dart';
import 'package:stylist_app/models/registered_user.dart';
import 'package:stylist_app/screens/main_screen/user_layouts/update_phone_otp_screen.dart';
import 'package:stylist_app/screens/registration/authentication_screen.dart';
import 'package:stylist_app/widgets/custom_input_field.dart';
import 'package:stylist_app/widgets/khali_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LayoutProfileUpdate extends StatefulWidget {
  @override
  _LayoutProfileUpdateState createState() => _LayoutProfileUpdateState();
}

class _LayoutProfileUpdateState extends State<LayoutProfileUpdate>
    implements UserDataChangeListener {
  String _phone = "", _password = "";
  String _country_code = "";
  TextEditingController fullname_controller = TextEditingController(),
      phone_controller = TextEditingController();
  late ImagePicker _picker;
  XFile? pickedImage;
  XFile? oldPickedImage = null;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool showLoading = true;
  var _auth = FirebaseAuth.instance;
  bool imageChanged = false;

  String _fullname = "";

  @override
  void initState() {
    setState(() {
      showLoading = (mUser == null || mUser!.user_id.isEmpty);
    });
    if (showLoading) {
      checkMySelf(_auth.currentUser!.uid, this);
      return;
    }

    setState(() {
      _fullname = fullname_controller.text = mUser!.name;
      _phone = phone_controller.text = mUser!.phone;
      _country_code = mUser!.country_code;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showLoading,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: oldPickedImage == null
                    ? NetworkImage(mUser!.image_url)
                    : FileImage(File(pickedImage!.path)) as ImageProvider,
              ),
              onTap: () async {
                pickedImage =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (pickedImage == null) {
                  return;
                }
                setState(() {
                  oldPickedImage = pickedImage;
                });
              },
            ),
            CustomInputField(
              hint: "Full Name",
              keyboardType: TextInputType.name,
              isPasswordField: false,
              controller: fullname_controller,
              onChange: (value) {
                _fullname = value.toString();
              },
            ),
            CustomInputField(
              hint: "Phone Number",
              isPasswordField: false,
              controller: phone_controller,
              onChange: (value) {
                _phone = value.toString();
              },
              keyboardType: TextInputType.phone,
              prefix: CountryCodePicker(
                onChanged: (value) {
                  _country_code = value.toString();
                },
                showFlag: true,
                showFlagMain: true,
                flagWidth: 25,
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: '$_country_code',

                // optional. Shows only country name and flag
                showCountryOnly: true,
                // optional. Shows only country name and flag when popup is closed.
                showOnlyCountryWhenClosed: false,
                // optional. aligns the flag and the Text left
                alignLeft: false,
              ),
            ),
            CustomInputField(
              hint: "Current Password",
              keyboardType: TextInputType.visiblePassword,
              isPasswordField: true,
              onChange: (value) {
                _password = value.toString();
              },
            ),
            ElevatedButton(
              onPressed: () async {
                // if (oldPickedImage == null) {
                //   showSnackBar("Profile Image required", context);
                //   return;
                // }

                if (!isPhoneValid(_phone, context, _country_code)) {
                  return;
                }

                if (_fullname.isEmpty || _phone.isEmpty || _password.isEmpty) {
                  showSnackBar("All fields required", context);
                  return;
                }
//-----------------------Registration------------------------------------

                RegisteredUser registeredUser = RegisteredUser(
                    mUser!.user_id,
                    (_fullname),
                    mUser!.email,
                    _phone,
                    _password,
                    mUser!.image_url,
                    _country_code,
                    0,
                    0,
                    mUser!.notification_token ?? "");

                setState(() {
                  showLoading = true;
                });

                AuthCredential authCredential = EmailAuthProvider.credential(
                    email: mUser!.email, password: _password);

                FirebaseAuth.instance.currentUser!
                    .reauthenticateWithCredential(authCredential)
                    .then((value) {})
                    .catchError((error) {
                  showSnackBar(error.toString(), context);
                  if (FirebaseAuth.instance.currentUser != null) {
                    FirebaseAuth.instance.signOut().then((value) {
                      closeAllScreens(context);
                      openScreen(context, AuthenticationScreen());
                    });
                  }
                  setState(() {
                    showLoading = false;
                  });
                  return;
                });

                if (registeredUser.phone == mUser!.phone) {
                  return;
                }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => UpdatePhoneOtpScreen(
                              userObject: registeredUser,
                              imageFile: oldPickedImage,
                            )));
              },
              child: Text("Update"),
              style: redButtonStyle,
            ),
            KhaliWidget(20),
            Text(
              "Warning: You'll be logged out on entering wrong password!",
              style: red_h3Style_bold,
            ),
            KhaliWidget(60),
          ],
        ),
      ),
    );
  }

  @override
  void dataReceived(RegisteredUser? registeredUser) {
    mUser = registeredUser;
    setState(() {
      showLoading = (mUser == null || mUser!.user_id.isEmpty);
    });
  }
}
