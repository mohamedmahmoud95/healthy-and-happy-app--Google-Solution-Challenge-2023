
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

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
                  color: Color(MyColors.grey01),
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
                        color: Color(MyColors.header01),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      doctorTitle,
                      style: TextStyle(
                        color: Color(MyColors.grey02),
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
                          color: Color(MyColors.yellow02),
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '4.0 - 50 Reviews',
                          style: TextStyle(color: Color(MyColors.grey02)),
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