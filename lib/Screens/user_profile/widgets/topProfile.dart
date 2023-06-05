import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';

import '../utils/constants.dart';

class buildTop extends StatelessWidget {
  final String img;
  const buildTop({
    Key? key,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
      Container(
          margin: const EdgeInsets.only(bottom: bottom ),
          child: buildCoverImage()),
      Positioned(
        top: top,
        child: buildProfileImage(img),
        )
    ]);
  }
}

Widget buildCoverImage() {
  return Container(
    color: lavender,

    child: Image.network(
      "https://img.freepik.com/free-vector/illustration-people-with-mental-health-problems_23-2149054811.jpg",
      width: double.infinity,
      height: coverHeight,
      fit: BoxFit.cover,
    ),
  );
}

Widget buildProfileImage(String img) {
  return  CircleAvatar(
    backgroundColor: mainPurple,
    radius: (profileHeight / 2) + 1,
    child: CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: primary,
      backgroundImage:  AssetImage(img),
    ),
  );
}
