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
        height: 200,
        child: Card(
          color: mainWhite,
          clipBehavior: Clip.hardEdge,
          shadowColor: lavender,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SessionBookingScreen(therapist: widget.therapist),
                ),
              );
            },
            splashColor: Colors.white38,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 150,
                height: 90,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: mainPurple,
                          foregroundColor: mainPurple,
                          child: CircleAvatar(
                            radius: 39,
                            backgroundImage:
                                NetworkImage(widget.therapist.photoUrl),
                          ),
                        ),

                        //Rating widget
                        Container(
                          width: 65,
                          height: 45,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.orange[50],
                            border: Border.all(width: 0.5, color: mainOrange),
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
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 150,
                      width: width / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.therapist.name,
                            style: const TextStyle(
                                color: mainPurple, fontSize: 20),
                          ),
                          Row(
                            children: [
                              //icon
                              const CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 15,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.transparent,
                                  foregroundImage: AssetImage(
                                    'assets/icons/doctor_scope.png',
                                  ),
                                  foregroundColor: lavender,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),

                              //  Icon( color: lavender, icon: Image.asset('assets/icons/doctor_headset.png')),
                              Expanded(
                                  child: Text(
                                widget.therapist.jobTitle,
                                style: const TextStyle(
                                    color: navyBlue, fontSize: 12),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.therapist.sessionsLocation,
                                style: const TextStyle(
                                    color: navyBlue, fontSize: 12),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 15,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.transparent,
                                  foregroundImage: AssetImage(
                                    'assets/icons/money.png',
                                  ),
                                  foregroundColor: lavender,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'EGP${widget.therapist.pricePerSession.toInt()}',
                                style: const TextStyle(
                                    fontSize: 15, color: mainPurple),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
