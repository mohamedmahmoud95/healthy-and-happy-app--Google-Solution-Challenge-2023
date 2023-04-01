import 'package:flutter/material.dart';
import 'therapist.dart';


class Appointment {
  final Therapist therapist;
  final DateTime date;
  final TimeOfDay time;

  Appointment({
    required this.therapist,
    required this.date,
    required this.time});
}