import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'AppointmentBooked.dart';
import 'Config.dart';
import 'CustomappBar.dart';

class BookingPage extends StatefulWidget {
  final bool isPatient;
  const BookingPage({Key? key,required this.isPatient}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
    List<String> availableTimeSlots = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomappBar(
        appTitle: 'Appointment',
        icon: Icon(Icons.arrow_back_ios),
        backgroundColor: Colors.white,
        textColor: Colors.black,
      ),
      body: CustomScrollView(
          slivers: [
      SliverToBoxAdapter(
      child: Column(
      children: <Widget>[
          _tableCalendar(),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      ),
      const Text(
        'Select your consultation time',
        style: TextStyle(color: Colors.black),
      ),
      ],
    ),
    ),
    _isWeekend
    ? SliverToBoxAdapter(
    child: Container(
    padding: const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 25,
    ),
    alignment: Alignment.center,
    child: const Text(
    'Consultations are not available during weekends',
    style: TextStyle(color: Colors.black),
    ),
    ),
    )
        :

SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            if (_currentIndex == index) {
                              _currentIndex = null;
                            } else {
                              _currentIndex = index;
                            }
                            _timeSelected = _currentIndex != null;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _currentIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color: _currentIndex == index
                                ? Config.primaryColor
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            availableTimeSlots[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _currentIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: availableTimeSlots.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.5,
                  ),
                ),




    SliverToBoxAdapter(
    child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
    child: SizedBox(
    width: double.infinity,
    height: 40,
    child: OutlinedButton(
    style: ElevatedButton.styleFrom(
    side: const BorderSide(width: 50),
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    ),
      onPressed: () {
  if (widget.isPatient) {
        
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AppointmentBooked(), // Replace YourNextPage with the desired page you want to navigate to
          ),
        );
       } else {
                      if (_currentIndex != null) {
                        _showTimePickerDialog();
                      }
                    }
      
      
      
      },
    child:  Text(
      widget.isPatient ? 'Confirm Appointment' : 'Modify',

    style: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,


    ),
    ),

    ),
    ),
    ),
    ),
    ],
    ),
    );
  }
  Future<void> _showTimePickerDialog() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      String time =
          '${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')} ${selectedTime.hour > 11 ? "PM" : "AM"}';
      setState(() {
        availableTimeSlots.add(time);
      });
    }
  }
  Widget _tableCalendar() {
    return TableCalendar(
        focusedDay: _focusDay,
        firstDay: DateTime.now(),
        lastDay: DateTime(2023, 12, 31),
        calendarFormat: _format,
        currentDay: _currentDay,
        rowHeight: 48,
        calendarStyle: const CalendarStyle(
          todayDecoration: BoxDecoration(
            color: Config.primaryColor,
            shape: BoxShape.circle,
          ),
          defaultTextStyle: TextStyle(color: Colors.black), // Change default text color to white
          weekendTextStyle: TextStyle(color: Colors.black), // Change weekend text color to white
        ),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false, // Hide the format button
          titleTextStyle: TextStyle(color: Colors.black), // Change the month header text color to black
        ),
        availableCalendarFormats: const {CalendarFormat.month: 'Month'},
        onFormatChanged: (format) {
          setState(() {
            _format = format;
          });
        },
        // i did this just to check if the weekend is selected
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _currentDay = selectedDay;
            _focusDay = focusedDay;
            _dateSelected = true;
          });

          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
          },
        );
  }
}