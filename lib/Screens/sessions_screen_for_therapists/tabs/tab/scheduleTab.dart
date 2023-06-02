import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';
import 'package:mental_health_app/Screens/sessions_screen_for_therapists/page/widget/BookingPage.dart';

import '../../../../Models/appointment.dart';
import '../../../../screens/sessions_screen_for_therapists/tabs/model/schedules.dart';
import '../../utils/colors.dart';
import '../widget/dateTimeCard.dart';

class ScheduleTab extends StatefulWidget {
  const ScheduleTab({Key? key}) : super(key: key);

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

class _ScheduleTabState extends State<ScheduleTab> {
  Status status = Status.upcoming;
  Alignment _alignment = Alignment.centerLeft;
  bool showCancelButton = false;
  bool showRescheduleButton = false;

  @override
  Widget build(BuildContext context) {
    List<Appointment> filteredSchedules = listOfSampleAppointments.where((var schedule) {
      return schedule.status == status;
    }).toList();

    void cancelSchedule(int index) {
      setState(() {
        listOfSampleAppointments.removeAt(index);
      });
    }

    @override
    void initState() {
      super.initState();
      showCancelButton = status == Status.upcoming;
      showRescheduleButton = status == Status.upcoming;
    }

    return Scaffold(
      backgroundColor: mainWhite,
      appBar: AppBar(
        backgroundColor: mainWhite,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: (){Navigator.of(context).pop();},
        ),
        title:  const Text(
          'My schedule',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: mainPurple
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color:lightLavender,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (Status status in Status.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                status = status;
                                if (status == Status.upcoming) {
                                  _alignment = Alignment.centerLeft;
                                  showCancelButton = true;
                                  showRescheduleButton = true;
                                } else {
                                  _alignment =
                                  status == Status.completed
                                      ? Alignment.center
                                      : Alignment.centerRight;
                                  showCancelButton = false;
                                  showRescheduleButton = false;
                                }
                              });
                            },
                            child: Center(
                              child: Text(
                                status.name,
                                style:const TextStyle (color:mainPurple),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  duration: const Duration(milliseconds: 200),
                  alignment: _alignment,
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: lavender,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: const TextStyle(
                          color: mainWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: (context, index) {
                  var _schedule = filteredSchedules[index];
                  bool isLastElement = index == filteredSchedules.length - 1;
                  return Card(
                    margin: !isLastElement
                        ? const EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(_schedule.therapist.photoUrl),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _schedule.therapist.name,
                                    style: const TextStyle(
                                      color: mainPurple,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _schedule.therapist.jobTitle,
                                    style: const TextStyle(
                                      color: navyBlue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                           DateTimeCard(appointment:  filteredSchedules[index],),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (showCancelButton)
                                Expanded(
                                  child: OutlinedButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      cancelSchedule(index);
                                    },
                                  ),
                                ),
                              if (showCancelButton)
                                const SizedBox(
                                  width: 20,
                                ),
                              if (showRescheduleButton)
                                Expanded(
                                  child: ElevatedButton(
                                    child: const Text('Reschedule'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const BookingPage(
                                            isPatient: true,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}