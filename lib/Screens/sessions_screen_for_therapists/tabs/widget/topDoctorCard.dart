
import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';


class TopDoctorCard extends StatelessWidget {
  String img;
  String doctorName;
  String doctorTitle;
  VoidCallback onTap;

  TopDoctorCard({
    required this.img,
    required this.doctorName,
    required this.doctorTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(bottom: 20),
        child: InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Container(
                  color: Colors.grey[300],
                  child: Image(
                    width: 100,
                    height: 100,
                    image: AssetImage(img),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: TextStyle(
                        color: mainPurple,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      doctorTitle,
                      style: TextStyle(
                        color:Colors.grey[300],
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[300],
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '4.0 - 50 Reviews',
                          style: TextStyle(color: Colors.grey[300]),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
           ),
      );
   }
}