import 'package:stylist_app/helpers/constants.dart';
import 'package:stylist_app/helpers/styles.dart';
import 'package:stylist_app/screens/chat_screen.dart';
import 'package:stylist_app/screens/stylist_profile/stylist_profile_book_appointment_layout.dart';
import 'package:stylist_app/screens/stylist_profile/stylist_profile_confirmed_appoinntments_layout.dart';
import 'package:stylist_app/widgets/custom_header_container_design.dart';
import 'package:stylist_app/widgets/custom_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StylistProfileAppointmentsScreen extends StatefulWidget {
  const StylistProfileAppointmentsScreen({Key? key}) : super(key: key);

  @override
  _StylistProfileAppointmentsScreenState createState() =>
      _StylistProfileAppointmentsScreenState();
}

class _StylistProfileAppointmentsScreenState extends State<StylistProfileAppointmentsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return CustomHeaderContainerDesign(
      appBar: AppBar(
        elevation: 0,
        title: Text("Stylist Profile"),
      ),
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Hero(
                            tag: "stylist_dp",
                            child: CircleAvatar(
                              child: Image.network(
                                  "https://static.wikia.nocookie.net/mrbean/images/4/4b/Mr_beans_holiday_ver2.jpg/revision/latest?cb=20181130033425"),
                              backgroundColor: Colors.transparent,
                              radius: 30,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Text(
                              "Stylist Name",
                              style: normal_h3Style_bold,
                            ),
                          ),
                          Text(
                            "Hair Artist",
                            style: grey_h2Style_bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  "100",
                                  textAlign: TextAlign.center,
                                  style: normal_h2Style_bold,
                                )),
                            Expanded(
                                child: Text(
                                  "100k",
                                  textAlign: TextAlign.center,
                                  style: normal_h2Style_bold,
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  "Posts",
                                  textAlign: TextAlign.center,
                                  style: normal_h2Style,
                                )),
                            Expanded(
                                child: Text(
                                  "Followers",
                                  textAlign: TextAlign.center,
                                  style: normal_h2Style,
                                ))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4.0, right: 4),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      openScreen(context, ChatScreen());
                                    },
                                    child: Text(
                                      "Message",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: redButtonProfileStyle,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4.0, right: 4),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Follow",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: redButtonProfileStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4, right: 4, top: 10),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Available Slots",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: redButtonProfileStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "2 Rue de Ermesinde",
                  style: grey_h3Style,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Frisange - Luxembourg 3 km",
                  style: grey_h3Style,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    RatingBarIndicator(
                      rating: 3,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemSize: 20,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        "(27)",
                        style: grey_h3Style,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  child: CustomTabBarView(
                    tabs_length: 2,
                    tabs_titles_list: [
                      "Book Appointment",
                      "Confirmed Appointments"
                    ],
                    tabController: TabController(length: 2, vsync: this),
                    tab_children_layouts: [
                      StylistProfileBookAppointmentLayout(),
                      StylistProfileConfirmedAppointmentsLayout()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
