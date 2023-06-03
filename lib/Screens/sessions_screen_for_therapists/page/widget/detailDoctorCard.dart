
import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';

class DetailDoctorCard extends StatelessWidget {
  const DetailDoctorCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dr. Josua Simorangkir',
                      style: TextStyle(
                          color: mainPurple,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Heart Specialist',
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Image(
                image: AssetImage('assets/images/doctor01.jpg'),
                width: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}