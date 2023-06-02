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


  Appointment({
    required this.therapist,
    required this.patient,
    required this.date,
    required this.time,
    required this.status
  });
}


//Sample appointments:
Appointment sampleAppointment1 = Appointment(therapist: sampleTherapist1, patient: sampleAppUser1, date: DateTime( 6,7),  time: const TimeOfDay(hour: 4, minute: 30),  status: Status.upcoming);
Appointment sampleAppointment2 = Appointment(therapist: sampleTherapist2, patient: sampleAppUser1, date: DateTime( 5,5),  time: const TimeOfDay(hour: 3, minute: 00),  status: Status.completed);
Appointment sampleAppointment3 = Appointment(therapist: sampleTherapist3, patient: sampleAppUser3, date: DateTime( 4,20), time: const TimeOfDay(hour: 10, minute: 45), status: Status.canceled);
Appointment sampleAppointment4 = Appointment(therapist: sampleTherapist1, patient: sampleAppUser2, date: DateTime( 6,1),  time: const TimeOfDay(hour: 4, minute: 30),  status: Status.canceled);
Appointment sampleAppointment5 = Appointment(therapist: sampleTherapist2, patient: sampleAppUser1, date: DateTime( 6,7),  time: const TimeOfDay(hour: 4, minute: 30),  status: Status.canceled);

//List of sample appointments:
List <Appointment> listOfSampleAppointments = [
  sampleAppointment1, sampleAppointment2, sampleAppointment3, sampleAppointment4, sampleAppointment5
];