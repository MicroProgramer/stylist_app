import 'package:stylist_app/helpers/constants.dart';
import 'package:stylist_app/helpers/styles.dart';
import 'package:stylist_app/screens/appointments/ask_pay_now_screen.dart';
import 'package:stylist_app/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

class StylistProfileBookAppointmentLayout extends StatefulWidget {
  const StylistProfileBookAppointmentLayout({Key? key}) : super(key: key);

  @override
  _StylistProfileBookAppointmentLayoutState createState() =>
      _StylistProfileBookAppointmentLayoutState();
}

class _StylistProfileBookAppointmentLayoutState
    extends State<StylistProfileBookAppointmentLayout> {
  DateTime selectedDate = DateTime.now();

  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    dateController.text = selectedDate.toLocal().toString().split(' ')[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomInputField(
                  hint: "First Name",
                  isPasswordField: false,
                  onChange: (value) {},
                  keyboardType: TextInputType.name,
                ),
              ),
              Expanded(
                child: CustomInputField(
                  hint: "Last Name",
                  isPasswordField: false,
                  onChange: (value) {},
                  keyboardType: TextInputType.name,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomInputField(
                  hint: "Email",
                  isPasswordField: false,
                  onChange: (value) {},
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Expanded(
                child: CustomInputField(
                  hint: "Contact",
                  isPasswordField: false,
                  onChange: (value) {},
                  keyboardType: TextInputType.phone,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomInputField(
                  hint: "Country",
                  isPasswordField: false,
                  onChange: (value) {},
                  keyboardType: TextInputType.streetAddress,
                ),
              ),
              Expanded(
                child: CustomInputField(
                  hint: "State",
                  isPasswordField: false,
                  onChange: (value) {},
                  keyboardType: TextInputType.streetAddress,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomInputField(
                  hint: "City",
                  isPasswordField: false,
                  onChange: (value) {},
                  keyboardType: TextInputType.streetAddress,
                ),
              ),
              Expanded(
                child: CustomInputField(
                  hint: "Address",
                  isPasswordField: false,
                  onChange: (value) {},
                  keyboardType: TextInputType.streetAddress,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Appointment Date",
                    textAlign: TextAlign.center,
                    style: normal_h3Style_bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Appointment Time",
                    textAlign: TextAlign.center,
                    style: normal_h3Style_bold,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomInputField(
                  hint: "Date",
                  controller: dateController,
                  isPasswordField: false,
                  onChange: (value) {},
                  readOnly: true,
                  keyboardType: TextInputType.datetime,
                  onTap: () async {
                    setState(() async {
                      selectedDate = await selectDate(context);
                      dateController.text = selectedDate.toLocal().toString();
                    });
                  },
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: CustomInputField(
                    hint: "Time",
                    isPasswordField: false,
                    onChange: (value) {},
                    controller: timeController,
                    keyboardType: TextInputType.none,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Card(
                  margin: EdgeInsets.only(right: 5, left: 5),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    minVerticalPadding: 0,
                    minLeadingWidth: 30,
                    leading: Image.asset(
                      "assets/red_marker.png",
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                    ),
                    title: Text(
                      "Drop Off your location",
                      style: normal_h5Style_bold,
                    ),
                    subtitle: Text(
                      "341 E 84th St, New York, NY 10028, United States",
                      style: normal_h6Style,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheetMenu(
                          context: context, content: AskPayNowScreen());
                    },
                    style: redButtonStyle,
                    child: Text("Send Request"),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
