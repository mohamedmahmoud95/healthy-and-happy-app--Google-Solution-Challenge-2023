
// Define the booking page
import 'package:flutter/material.dart';

import '../../Constants/project_colors.dart';
import '../../Models/appointment.dart';
import '../../Models/therapist.dart';
import '../../Reusable Widgets/button_widget.dart';
import 'confirm_booking_screen.dart';

class SessionBookingScreen extends StatefulWidget {
   final Therapist therapist;

  const SessionBookingScreen({super.key, required this.therapist});


  @override
  _SessionBookingScreenState createState() => _SessionBookingScreenState();
}

class _SessionBookingScreenState extends State<SessionBookingScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  final List<TimeOfDay> _availableTimes = [
    const TimeOfDay(hour: 9, minute: 0),
    const TimeOfDay(hour: 10, minute: 30),
    const TimeOfDay(hour: 12, minute: 0),
    const TimeOfDay(hour: 13, minute: 30),
    const TimeOfDay(hour: 15, minute: 0),
    //  const TimeOfDay(hour: 16, minute: 30),
    //  const TimeOfDay(hour: 18, minute: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhite,
      appBar: AppBar(
          iconTheme: const IconThemeData(color: primaryColor, size: 30),
          backgroundColor: mainWhite,
          elevation: 0,
          title: const Text('Book an Appointment',
              style: TextStyle(color: Colors.black))
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height:12),
            Image.network('https://img.freepik.com/free-vector/woman-crying-therapy-session_74855-17143.jpg'),
            const SizedBox(height:12),



            const SizedBox(height: 20),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child:
              Center(
                child: ButtonWidget(
                  text:  _selectedDate == null ? 'Click to select a date' : _selectedDate.toString().substring(0, 10),
                  onClicked: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 14)),
                    ).then((value) {
                      setState(() {
                        _selectedDate = value;
                      });
                    });
                  },

                ),
              ),
            ),

            const SizedBox(height: 30),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Choose a time:',
                style: TextStyle(fontSize: 18,  color: Colors.black),
              ),
            ),

            const SizedBox(height: 10),
            Expanded(

              child: ListView.builder(
                itemCount: _availableTimes.length,
                itemBuilder: (context, index) {
                  final time = _availableTimes[index];
                  return Column(
                    children: [
                      const Divider(),
                      Center(

                        child: ListTile(
                          title: Text(time.format(context),
                            style: const TextStyle(fontSize: 18,  color: Colors.black),),
                          trailing: _selectedTime == time ? const Icon(Icons.check) : null,
                          onTap: () {
                            setState(() {
                              _selectedTime = time;
                            });
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child:      Center(
                child: ButtonWidget(text: 'Book now', onClicked: () {
                  if (_selectedDate == null || _selectedTime == null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Missing Information',
                          style: TextStyle(fontSize: 18,  color: Colors.black),),
                        content: const Text('Please select a date and time',
                          style: TextStyle(fontSize: 18,  color: Colors.black),),
                        actions: [

                          Center(child: ButtonWidget(text: 'OK', onClicked: () => Navigator.pop(context)))

                        ],
                      ),
                    );
                  } else {
                    final appointment = Appointment(
                      therapist: widget.therapist,
                      date: _selectedDate!,
                      time: _selectedTime!,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConfirmBookingScreen(appointment: appointment)),
                    );
                  }
                },

                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
