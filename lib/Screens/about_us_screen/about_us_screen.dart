import 'package:flutter/material.dart';

import '../../Constants/project_colors.dart';
import '../../Models/appUser.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              leading: BackButton(
                color: mainPurple,
                onPressed: () => Navigator.of(context).pop(),
              ),
              iconTheme: const IconThemeData(color: mainPurple, size: 30),
              backgroundColor: mainWhite,
              elevation: 0,
              title: const Text('About us',
                  style: TextStyle(
                      color: mainPurple, fontWeight: FontWeight.normal))),
          body: SingleChildScrollView(
            child: Container(
              color: mainWhite,
              child: Center(
                child: Wrap(
                  spacing: 12.0, // gap between adjacent chips
                  runSpacing: 12.0, // gap between lines
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 51,
                                backgroundColor: mainPurple,
                                child: CircleAvatar(
                                  radius: 50,
                                  foregroundImage: AssetImage(
                                      sampleAppUser1.profilePicUrl != null
                                          ? sampleAppUser1.profilePicUrl!
                                          : 'assets/images/profile_pic.png'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: Text(
                              '${sampleAppUser1.firstName}',
                              style: const TextStyle(
                                  color: lavender, fontSize: 20),
                            )),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: Text(
                              '${sampleAppUser1.email}',
                              style: const TextStyle(
                                  color: lavender, fontSize: 12),
                            )),
                          ],
                        ),
                        Column(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 51,
                                backgroundColor: mainPurple,
                                child: CircleAvatar(
                                  radius: 50,
                                  foregroundImage: AssetImage(
                                      sampleAppUser2.profilePicUrl != null
                                          ? sampleAppUser2.profilePicUrl!
                                          : 'assets/images/profile_pic.png'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: Text(
                              '${sampleAppUser2.firstName}',
                              style: const TextStyle(
                                  color: lavender, fontSize: 20),
                            )),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: Text(
                              '${sampleAppUser2.email}',
                              style: const TextStyle(
                                  color: lavender, fontSize: 12),
                            )),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 51,
                                backgroundColor: mainPurple,
                                child: CircleAvatar(
                                  radius: 50,
                                  foregroundImage: AssetImage(
                                      sampleAppUser3.profilePicUrl != null
                                          ? sampleAppUser3.profilePicUrl!
                                          : 'assets/images/profile_pic.png'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: Text(
                              '${sampleAppUser3.firstName}',
                              style: const TextStyle(
                                  color: lavender, fontSize: 20),
                            )),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: Text(
                              '${sampleAppUser3.email}',
                              style: const TextStyle(
                                  color: lavender, fontSize: 12),
                            )),
                          ],
                        ),
                        Column(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 51,
                                backgroundColor: mainPurple,
                                child: CircleAvatar(
                                  radius: 50,
                                  foregroundImage: AssetImage(
                                      sampleAppUser4.profilePicUrl != null
                                          ? sampleAppUser4.profilePicUrl!
                                          : 'assets/images/profile_pic.png'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: Text(
                              '${sampleAppUser4.firstName}',
                              style: const TextStyle(
                                  color: lavender, fontSize: 20),
                            )),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: Text(
                              '${sampleAppUser4.email}',
                              style: const TextStyle(
                                  color: lavender, fontSize: 12),
                            )),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Card(
                        color: lightPurple,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              "We are a team of 4 passionate Flutter developers, and Computer Engineering students at Ain Shams University, Cairo, Egypt",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: mainPurple,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Card(
                        color: lightPurple,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              "And we would love to get in touch with you for any cooperation opportunities ^^",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: mainPurple,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
