

import 'package:flutter/material.dart';
import 'package:mental_health_app/Models/appUser.dart';
import '../sessions_screen_for_normal_users/consult_therapist_screen.dart';
import '../sessions_screen_for_therapists/page/list_of_my_patients.dart';

class TherapistsScreen extends StatefulWidget {
  const TherapistsScreen({Key? key}) : super(key: key);

  @override
  State<TherapistsScreen> createState() => _TherapistsScreenState();
}

class _TherapistsScreenState extends State<TherapistsScreen> {
  @override
  Widget build(BuildContext context) {
    return
     currentAppUser.isTherapist? const TherapistDashboardScreen(): ConsultTherapistScreen();
  }
}
