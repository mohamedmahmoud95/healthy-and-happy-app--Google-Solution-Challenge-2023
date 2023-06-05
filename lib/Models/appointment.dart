import 'package:flutter/material.dart';
import 'package:mental_health_app/Models/appUser.dart';
import 'therapist.dart';


enum Status { upcoming, completed, canceled }

class Appointment {
  final Therapist therapist;
  final AppUser patient;
  final DateTime date;
  final TimeOfDay time;
  Status status;
  final String id;

  Appointment({
    required this.therapist,
    required this.patient,
    required this.date,
    required this.time,
    required this.status,
    required this.id,
  });
}


//Sample appointments: (Sample static data to try on while developing the UI)
Appointment sampleAppointment1 = Appointment(therapist: sampleTherapist1, id: 'sampleAppointment1', patient: sampleAppUser1, date: DateTime( 2023, 6,7), time: const TimeOfDay(hour: 4, minute: 30),  status: Status.upcoming);
Appointment sampleAppointment2 = Appointment(therapist: sampleTherapist2, id: 'sampleAppointment2', patient: sampleAppUser1, date: DateTime(2023, 5,5),  time: const TimeOfDay(hour: 3, minute: 00),  status: Status.completed);
Appointment sampleAppointment3 = Appointment(therapist: sampleTherapist3, id: 'sampleAppointment3', patient: sampleAppUser3, date: DateTime( 2023,4,20), time: const TimeOfDay(hour: 10, minute: 45), status: Status.canceled);
Appointment sampleAppointment4 = Appointment(therapist: sampleTherapist1, id: 'sampleAppointment4', patient: sampleAppUser2, date: DateTime( 2023,6,1),  time: const TimeOfDay(hour: 4, minute: 30),  status: Status.canceled);
Appointment sampleAppointment5 = Appointment(therapist: sampleTherapist2, id: 'sampleAppointment5', patient: sampleAppUser1, date: DateTime(2023, 6,7),  time: const TimeOfDay(hour: 4, minute: 30),  status: Status.canceled);

//List of sample appointments:
//(Sample static data to try on while developing the UI)
List <Appointment> listOfSampleAppointments = [
  sampleAppointment1, sampleAppointment2, sampleAppointment3, sampleAppointment4, sampleAppointment5
];

