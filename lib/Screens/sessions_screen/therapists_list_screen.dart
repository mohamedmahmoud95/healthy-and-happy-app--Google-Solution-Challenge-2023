

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mental_health_app/Constants/project_colors.dart';

import '../../Models/therapist.dart';
import 'book_a_session_screen.dart';


class TherapistListScreen extends StatefulWidget {

   TherapistListScreen({super.key});

  @override
  State<TherapistListScreen> createState() => _TherapistListScreenState();
}

class _TherapistListScreenState extends State<TherapistListScreen> {



  @override
  Widget build(BuildContext context) {
    var therapist;
    return Scaffold(
      backgroundColor: mainWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainWhite,
        leading: BackButton(color: mainPurple, onPressed: () => Navigator.pop(context),),
        title: const Text('Talk to a professional', style: TextStyle(color: mainPurple),),
      ),
      body: ListView.builder(
        itemCount: availableTherapists.length,
        itemBuilder: (context, index) {

           therapist = availableTherapists[index];

          return Card(
            color: lightOrange,

            clipBehavior: Clip.hardEdge,

            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),

            child: InkWell(
              onTap: () {


              },

              splashColor:  Colors.white38,

              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(

                  width: 150,
                  height: 90,

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    Center(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(therapist.photoUrl),
                        ),

                        title: Text(therapist.name, style: const TextStyle(color: navyBlue),),

                        trailing:     RatingBarIndicator(
                          rating: availableTherapists[index].rating,
                          itemCount: 5,
                          itemSize: 16.0,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, _) =>
                          const Icon(
                            Icons.star,
                            color: mainOrange,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SessionBookingScreen(therapist: therapist),),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );



        },
      ),
    );
  }
}