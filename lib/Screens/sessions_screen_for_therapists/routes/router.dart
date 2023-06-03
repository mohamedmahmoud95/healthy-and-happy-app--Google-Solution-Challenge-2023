
import 'package:flutter/material.dart';

import '../page/details_screen.dart';
import '../page/list_of_my_patients.dart';


Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => TherapistDashboardScreen(),
  '/detail': (context) => SliverDoctorDetail(),
};