
import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';
import 'package:mental_health_app/Models/appointment.dart';


class DateTimeCard extends StatelessWidget {
  final Appointment appointment;
  const DateTimeCard({
    Key? key, required this.appointment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: bgLavender2,
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.calendar_today,
                color: mainPurple,
                size: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${appointment.date.day} - ${appointment.date.month} - ${appointment.date.year}',
                style: const TextStyle(
                  fontSize: 12,
                  color: lavender,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.access_alarm,
                color: lavender,
                size: 17,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${appointment.time.hour} : ${appointment.time.minute} - for 45 min',
                style: const TextStyle(
                  color: lavender,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}