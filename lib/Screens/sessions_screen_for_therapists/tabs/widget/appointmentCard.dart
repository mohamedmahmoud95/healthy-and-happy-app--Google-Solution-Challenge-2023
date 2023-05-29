import 'package:flutter/material.dart';
import 'package:mental_health_app/Screens/sessions_screen_for_therapists/tabs/widget/scheduleCard.dart';

import '../../utils/colors.dart';

class AppointmentCard extends StatelessWidget {
  final void Function() onTap;
  final bool isPatient;
  const AppointmentCard({
    Key? key,
    required this.onTap,
    required this.isPatient
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(MyColors.primary),
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
                          backgroundImage: isPatient
                              ? const AssetImage('assets/images/doctor01.png')

                              : const AssetImage('assets/images/patient.png'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isPatient ? 'Dr.Aleyna Eser' : 'Ahmed Ali',
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              isPatient ? 'MentalHealth Specialist' : '',
                              style: TextStyle(
                                  color: Color(MyColors.text01)),
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
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Color(MyColors.bg02),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Color(MyColors.bg03),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}