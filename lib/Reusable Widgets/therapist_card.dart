


import 'package:flutter/material.dart';

import '../Constants/project_colors.dart';
import '../Models/therapist.dart';
import '../Screens/sessions_screen_for_normal_users/book_a_session_screen.dart';

class TherapistCard extends StatefulWidget {
  final Therapist therapist;
  const TherapistCard({Key? key, required this.therapist}) : super(key: key);

  @override
  State<TherapistCard> createState() => _TherapistCardState();
}

class _TherapistCardState extends State<TherapistCard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        width: width - 20,
        child: Card(

          color: mainWhite,
          clipBehavior: Clip.hardEdge,
          shadowColor: lavender,
          elevation: 2,

          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),

          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SessionBookingScreen(therapist: widget.therapist),),
              );
            },


            splashColor:  Colors.white38,

            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(

                width: 150,
                height: 90,

                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: mainPurple,
                      foregroundColor: mainPurple,
                      child: CircleAvatar(
                        radius: 27,
                        backgroundImage: NetworkImage(widget.therapist.photoUrl),
                      ),
                    ),


                    title: Text(widget.therapist.name, style: const TextStyle(color: navyBlue, fontSize: 20),),
                    subtitle:  Text(widget.therapist.jobTitle, style: const TextStyle(color: navyBlue, fontSize: 12),),

                    trailing:


                    Container(
                      width: 75,
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange[50],
                        border: Border.all(
                            width: 0.5, color: mainOrange),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.star,
                            color: darkOrange,
                            size: 20,
                          ),
                          Text(
                            "${widget.therapist.rating}",
                            style: const TextStyle(
                              fontSize: 17,
                              color: darkOrange,
                            ),
                          ),
                        ],
                      ),



                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
