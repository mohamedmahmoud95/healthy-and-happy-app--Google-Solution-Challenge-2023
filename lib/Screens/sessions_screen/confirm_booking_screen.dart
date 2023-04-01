
// Define the booking confirmation page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants/project_colors.dart';
import '../../Models/appointment.dart';
import '../../Reusable Widgets/button_widget.dart';

class ConfirmBookingScreen extends StatelessWidget {
  final Appointment appointment;

  const ConfirmBookingScreen({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhite,
      appBar: AppBar(
          iconTheme: const IconThemeData(color: primaryColor, size: 30),
          backgroundColor: mainWhite,
          elevation: 0,
          title: const Text('confirm booking',
              style: TextStyle(color: Colors.black))
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(appointment.therapist.photoUrl),
              radius: 80,
            ),
            const SizedBox(height: 20),

            Text(
              appointment.therapist.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: mainPurple),
            ),
            const SizedBox(height: 75),

            Text(
              'Date: ${appointment.date.toString().substring(0, 10)}',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),

            const SizedBox(height: 20),
            Text(
              'Time: ${appointment.time.format(context)}',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 75),
            ButtonWidget(text: 'Confirm', onClicked: ()
            {

              Navigator.pop(context);

              // TODO: Save the booking and return to the home page
              //  Navigator.popUntil(context, ModalRoute.withName('/HomeScreen'));
            },

            ),
            const SizedBox(height: 10),

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.red),),
            ),
          ],
        ),
      ),
    );
  }
}
