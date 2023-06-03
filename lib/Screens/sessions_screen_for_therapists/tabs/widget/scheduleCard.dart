
import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';
import 'package:mental_health_app/Models/appointment.dart';


class ScheduleCard extends StatelessWidget {
  final Appointment appointment;
  const ScheduleCard({
    Key? key, required this.appointment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

  String appointmentDate = "${appointment.date.day} - ${appointment.date.month} - ${appointment.date.year} ";
    return Container(
      decoration: BoxDecoration(
        color: bgLavender3,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            appointment.date.day == DateTime.now().day? 'Today' :  "${appointment.date.day} - ${appointment.date.month} - ${appointment.date.year} ",
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            width: 35,
          ),
          const Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          const SizedBox(
            width: 5,
          ),
           Flexible(
            child: Text(
              '${appointment.time.hour} : ${appointment.time.minute} - for 45 min',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

