
import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';


class TopDoctorCard extends StatelessWidget {
  String? img;
  String? doctorName;
  String? doctorTitle;
  VoidCallback onTap;

  TopDoctorCard({
    super.key,
    required this.img,
    required this.doctorName,
    required this.doctorTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,

      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
        margin: const EdgeInsets.only(bottom: 20),
        child: InkWell(
            onTap: onTap,
            child: Row(
              children: [
                const SizedBox(width: 15,),
                Container(

                  color: mainWhite,
                  child: Image(
                    width: 100,
                    height: 100,
                    image: AssetImage(img!),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      doctorName!,
                      style: const TextStyle(
                        color: mainPurple,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      doctorTitle!,
                      style: TextStyle(
                        color:Colors.grey[300],
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                  ],
                ),
              ],
            ),
           ),
      );
   }
}