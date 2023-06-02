
import 'package:flutter/material.dart';

import '../tabs/tab/homeTab.dart';
import '../tabs/tab/scheduleTab.dart';


class TherapistDashboardScreen extends StatefulWidget {
  const TherapistDashboardScreen({Key? key}) : super(key: key);

  @override
  _TherapistDashboardScreenState createState() => _TherapistDashboardScreenState();
}

List<Map> navigationBarItems = [
  {'icon': Icons.local_hospital, 'index': 0},
  {'icon': Icons.calendar_today, 'index': 1},
];

class _TherapistDashboardScreenState extends State<TherapistDashboardScreen> {
  int _selectedIndex = 0;
  void goToSchedule() {
    setState(() {
      _selectedIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(MyColors.primary),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: HomeTab(onPressedScheduleCard: () {

          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScheduleTab()));
        },),
      ),

    );
  }
}