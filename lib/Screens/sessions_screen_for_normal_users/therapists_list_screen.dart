import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mental_health_app/Constants/project_colors.dart';
import 'package:mental_health_app/Reusable%20Widgets/button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Models/therapist.dart';
import '../../Reusable Widgets/therapist_card.dart';
import 'book_a_session_screen.dart';

class TherapistListScreen extends StatefulWidget {
  TherapistListScreen({super.key});

  @override
  State<TherapistListScreen> createState() => _TherapistListScreenState();
}

class _TherapistListScreenState extends State<TherapistListScreen> {
  //url launcher to browse more videos on YouTube when the user presses the "See more" button
  Future<void> _seeMoreURLLauncher() async {
    final Uri _url = Uri.parse('https://www.vezeeta.com/ar/دكتور/نفسي/القاهرة');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    var therapist;
    return Scaffold(
      backgroundColor: mainWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainWhite,
        leading: BackButton(
          color: mainPurple,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Talk to a professional',
          style: TextStyle(color: mainPurple),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 30,), //leave a little space at the top

            ...listOfAvailableTherapists
                .map(
                  (therapist) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TherapistCard(therapist: therapist),
                      SizedBox(
                          height: 30,
                          width: width / 2,
                          child: const Divider(
                            thickness: 0.5,
                            color: lavender,
                          )),
                    ],
                  ),
                )
                .toList(),
            const SizedBox(height: 40),
            ButtonWidget(
                text: "See more on Vezeeta",
                onClicked: () {
                  _seeMoreURLLauncher();
                }),

            const SizedBox(height: 40),

          ],
        ),
      ),
    );
  }
}
