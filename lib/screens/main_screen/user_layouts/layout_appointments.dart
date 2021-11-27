import 'package:stylist_app/item_layouts/item_appointment_slot.dart';
import 'package:stylist_app/models/slot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';

class LayoutAppointments extends StatefulWidget {
  @override
  _LayoutAppointmentsState createState() => _LayoutAppointmentsState();
}

class _LayoutAppointmentsState extends State<LayoutAppointments> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Calendar(
        startOnMonday: true,
        weekDays: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
        events: getEventsFromSlots(getRandomSlots()),
        eventDoneColor: Colors.green,
        selectedColor: Colors.red,
        isExpanded: true,
        todayColor: Colors.redAccent,
        // dayBuilder: (BuildContext context, DateTime day) {
        //   return new Text("!");
        // },

        eventListBuilder: (BuildContext context,
            List<NeatCleanCalendarEvent> _selectedEvents) {
          return Expanded(
            child: new GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, index) {
                return ItemEventSlot(
                  isAvailable: _selectedEvents[index].isDone,
                  dateTime: _selectedEvents[index].startTime,
                );
              },
              itemCount: _selectedEvents.length,
            ),
          );
        },
        eventColor: Colors.grey,
        locale: 'en_PK',
        todayButtonText: 'Today',
        expandableDateFormat: 'EEEE, dd. MMMM yyyy',
        dayOfWeekStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
      ),
    );
  }

  final Map<DateTime, List<NeatCleanCalendarEvent>> _events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      NeatCleanCalendarEvent('Event A',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: 'A special event',
          color: Colors.blue[700]),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
        [
      NeatCleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          color: Colors.orange),
      NeatCleanCalendarEvent('Event C',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink),
    ],
  };

  Map<DateTime, List<NeatCleanCalendarEvent>> getEventsFromSlots(
      List<Slot> slots) {
    Map<DateTime, List<NeatCleanCalendarEvent>> eventsMap = Map();

    for (Slot slot in slots) {
      int timestamp = slot.timestamp;
      var date = DateTime.fromMillisecondsSinceEpoch(timestamp);

      DateTime x = DateTime(date.year, date.month, date.day);
      NeatCleanCalendarEvent event = NeatCleanCalendarEvent("Available Time",
          startTime: date, endTime: date, isDone: slot.available);

      if (!eventsMap.containsKey(x)) {
        eventsMap.addAll({x: []});
      }
      eventsMap.update(x, (value) {
        value.add(event);

        return value;
      });
    }

    print(eventsMap);

    return eventsMap;
  }

  List<Slot> getRandomSlots() {
    List<Slot> slots = [];

    for (int i = 0; i < 20; i++) {
      DateTime now = DateTime.now();
      DateTime dateTime1 = DateTime(now.year, now.month, now.day, 5 + i, 10, 0);
      DateTime dateTime2 = DateTime(now.year, now.month, now.day + i, 5, 10, 0);

      slots.add(Slot("slot_id", "barber_id", "user_id", "service_id",
          dateTime1.millisecondsSinceEpoch, (i % 2 == 0)));

      slots.add(Slot("slot_id", "barber_id", "user_id", "service_id",
          dateTime2.millisecondsSinceEpoch, (i % 2 == 0)));
    }

    return slots;
  }
}
