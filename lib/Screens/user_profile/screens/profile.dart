import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';

import '../widgets/about.dart';
import '../widgets/topProfile.dart';

class ProfilePage extends StatefulWidget {
  final String doctorName;
  final String doctorAbout;
  final String doctorImage;
  final bool isPatient;

  const ProfilePage({Key? key,
    required this.doctorName,
    required this.doctorImage,
    required this.doctorAbout,
    required this.isPatient,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhite,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(padding: EdgeInsets.zero, children: <Widget>[
        buildTop(img: widget.doctorImage),
        buildContent(context, widget.doctorName, widget.doctorAbout,widget.isPatient),
      ]),
    );
  }
}
