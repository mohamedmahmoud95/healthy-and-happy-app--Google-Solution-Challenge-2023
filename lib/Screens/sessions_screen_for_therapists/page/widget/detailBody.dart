
import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';

import 'detailDoctorCard.dart';
import 'doctorInfo.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DetailDoctorCard(),
          const SizedBox(
            height: 15,
          ),
          const DoctorInfo(),
          const SizedBox(
            height: 30,
          ),
          Text(
            'About Doctor',
            style: TextStyle(
  color: mainPurple,
  fontWeight: FontWeight.bold,
),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Dr. Joshua Simorangkir is a specialist in internal medicine who specialzed blah blah.',
            style: TextStyle(
              color: mainPurple,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'Location',
            style: TextStyle(
              color: mainPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                mainPurple,
              ),
            ),
            child: const Text('Book Appointment'),
            onPressed: () => {},
          )
        ],
      ),
    );
  }
}
