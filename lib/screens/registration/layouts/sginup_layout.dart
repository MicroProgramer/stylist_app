import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stylist_app/helpers/constants.dart';
import 'package:stylist_app/helpers/styles.dart';
import 'package:stylist_app/listeners/tab_listener.dart';
import 'package:stylist_app/models/registered_user.dart';
import 'package:stylist_app/screens/registration/code_sent_screen.dart';
import 'package:stylist_app/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignupLayout extends StatefulWidget {
  final TabListener tabListener;

  SignupLayout(this.tabListener);

  @override
  _SignupLayoutState createState() => _SignupLayoutState();
}

class _SignupLayoutState extends State<SignupLayout> {
  String _firstname = "",
      _lastname = "",
      _email = "",
      _phone = "",
      _password = "",
      _confirmPassword = "";
  String _country_code = "";

  late ImagePicker _picker;
  XFile? pickedImage;
  XFile? oldPickedImage = null;
  FirebaseAuth? _auth;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool buttonEnabled = true;

  @override
  void initState() {
    _picker = ImagePicker();
    _auth = FirebaseAuth.instance;
    pickedImage = XFile("assets/placeholder.jpg");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: CircleAvatar(
              radius: 40,
              backgroundImage: oldPickedImage == null
                  ? AssetImage("assets/placeholder.jpg")
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
            hint: "First Name",
            isPasswordField: false,
            keyboardType: TextInputType.name,
            onChange: (value) {
              _firstname = value.toString();
            },
          ),
          CustomInputField(
            hint: "Last Name",
            keyboardType: TextInputType.name,
            isPasswordField: false,
            onChange: (value) {
              _lastname = value.toString();
            },
          ),
          CustomInputField(
            hint: "Email",
            keyboardType: TextInputType.emailAddress,
            isPasswordField: false,
            onChange: (value) {
              _email = value.toString();
            },
          ),
          CustomInputField(
            hint: "Phone Number",
            isPasswordField: false,
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
              flagWidth: 15,
              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
              initialSelection: 'PK',
              favorite: ['+92', 'PK'],

              // optional. Shows only country name and flag
              showCountryOnly: true,
              // optional. Shows only country name and flag when popup is closed.
              showOnlyCountryWhenClosed: false,
              // optional. aligns the flag and the Text left
              alignLeft: false,
            ),
          ),
          CustomInputField(
            hint: "Password",
            keyboardType: TextInputType.visiblePassword,
            isPasswordField: true,
            onChange: (value) {
              _password = value.toString();
            },
          ),
          CustomInputField(
            hint: "Confirm Password",
            keyboardType: TextInputType.visiblePassword,
            isPasswordField: true,
            onChange: (value) {
              _confirmPassword = value.toString();
            },
          ),
          ElevatedButton(
            onPressed: () async {
              if (buttonEnabled) {
                if (oldPickedImage == null) {
                  showSnackBar("Profile Image required", context);
                  return;
                }

                if (!isPhoneValid(_phone, context, _country_code)) {
                  return;
                }

                if (_firstname.isEmpty ||
                    _lastname.isEmpty ||
                    _email.isEmpty ||
                    _phone.isEmpty ||
                    _password.isEmpty ||
                    _confirmPassword.isEmpty ||
                    oldPickedImage == null) {
                  showSnackBar("All fields required", context);
                  return;
                }
//-----------------------Registration------------------------------------

                RegisteredUser registeredUser = RegisteredUser(
                    "",
                    (_firstname + " " + _lastname),
                    _email,
                    _phone,
                    _password,
                    "",
                    _country_code,
                    0,
                    0,
                    "");

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CodeSentScreen(
                              userObject: registeredUser,
                              imageFile: oldPickedImage,
                              resetPassword: false,
                            )));
              } else {
                return null;
              }
            },
            child:
                buttonEnabled ? Text("Sign Up") : CircularProgressIndicator(),
            style: redButtonStyle,
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                ),
                GestureDetector(
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    widget.tabListener.onTabChanged(0);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// Future<void> uploadUserData(RegisteredUser user) async {
//   Reference storageReference =
//       FirebaseStorage.instance.ref().child("profile_images/${user.id}");
//   final UploadTask uploadTask =
//       storageReference.putFile(File(oldPickedImage!.path));
//   final TaskSnapshot downloadUrl = (await uploadTask);
//   final String url = await downloadUrl.ref.getDownloadURL();
//   user.pic_url = url;
//
//   FirebaseFirestore.instance
//       .collection("users")
//       .doc(user.id)
//       .set(user.toMap())
//       .then((value) {
//
//   });
// }

}
