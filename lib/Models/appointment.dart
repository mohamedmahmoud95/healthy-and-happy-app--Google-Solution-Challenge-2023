import 'package:flutter/material.dart';
import 'package:mental_health_app/Models/appUser.dart';
import 'therapist.dart';


enum Status { Upcoming, Complete, Cancel }


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
