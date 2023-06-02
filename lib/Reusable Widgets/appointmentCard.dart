import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';
import 'package:mental_health_app/Models/appUser.dart';
import 'package:mental_health_app/Models/appointment.dart';
import 'package:mental_health_app/Screens/sessions_screen_for_therapists/tabs/widget/scheduleCard.dart';


class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  final void Function() onTap;
  const AppointmentCard({
    Key? key,
    required this.onTap,
    required this.appointment
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [

        Container(
          width: width - 50,
          decoration: BoxDecoration(
            color: bgLavender0,
            borderRadius: BorderRadius.circular(10),
          ),

          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: thisAppUser.isTherapist
                          ?   AssetImage('${appointment.patient.profilePicUrl}'):
                          AssetImage(appointment.therapist.photoUrl),

                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              thisAppUser.isTherapist ?  '${appointment.patient.firstName} ${appointment.patient.lastName}' :
                              appointment.therapist.name ,
                              style: const TextStyle(color: Colors.white),
                            ),

                            const SizedBox(
                              height: 2,
                            ),

                            Text(
                              thisAppUser.isTherapist ? '' : appointment.therapist.jobTitle,
                              style: const TextStyle(
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                   const ScheduleCard(),
                  ],
                ),
              ),
            ),
          ),
        ),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: width - 100,
          height: 10,
          decoration: const BoxDecoration(
            color: bgLavender1,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          width: width - 150,
          height: 10,
          decoration: const BoxDecoration(
            color: bgLavender2,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}