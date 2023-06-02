
import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';
import 'package:mental_health_app/Models/appointment.dart';

import '../../../../Models/therapist.dart';
import '../../../../Reusable Widgets/appointmentCard.dart';
import '../../../user_profile/screens/profile.dart';
import '../../page/widget/BookingPage.dart';
import '../model/patients.dart';
import '../widget/searchInput.dart';
import '../widget/topDoctorCard.dart';



class HomeTab extends StatelessWidget {
  final void Function() onPressedScheduleCard;
  final bool isPatient;

  const HomeTab({
    Key? key,
    required this.onPressedScheduleCard,
   // required this.isDoctor,
   this.isPatient = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhite,
      appBar: AppBar(
        backgroundColor: mainWhite,
        elevation: 0,

        title:  const Text(
          'My Patients',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: mainPurple
          ),
        ),
      ),

      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              const SearchInput(),
              const SizedBox(
                height: 20,
              ),
          if (isPatient)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Appointment Today',
                    style: TextStyle(
                      color: mainPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
           else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Appointment Today',
                  style: TextStyle(
                    color: mainPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  child: Text(
                    'modify',
                    style: TextStyle(
                      color: Colors.yellow[300],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => BookingPage(

                                                isPatient:isPatient,
                                              ),
                                            ),
                                          );
                                        },
                )
              ],
            ),



              const SizedBox(
                height: 20,
              ),
              AppointmentCard(
                onTap: onPressedScheduleCard, appointment: sampleAppointment1,
             //   isPatient: isPatient
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                isPatient ? 'Top Doctors' : 'Patients',
                style: TextStyle(
                  color: mainPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
               if (isPatient)
                for (var therapist in listOfAvailableTherapists)
                  TopDoctorCard(
                    img: therapist.photoUrl,
                    doctorName: therapist.name,
                    doctorTitle: therapist.jobTitle,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(
                            doctorName: therapist.name,
                            doctorImage: therapist.photoUrl,
                            doctorAbout: therapist.jobTitle, //--------------------------to be edited"
                            isPatient:isPatient,
                          ),
                        ),
                      );
                    },
                  )
               else
                 for (var patient in patients)
                   TopDoctorCard(
                     img: patient['img'],
                     doctorName: patient['patientName'],
                     doctorTitle:"",
                     onTap: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => ProfilePage(
                             doctorName: patient['patientName'],
                             doctorImage: patient['img'],
                             doctorAbout: patient['about'],
                             isPatient:isPatient,
                           ),
                         ),
                       );
                     },
                   ),
            ],
          ),
        ),
      ),
    );
  }
}




