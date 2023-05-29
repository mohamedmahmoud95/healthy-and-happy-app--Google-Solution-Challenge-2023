import 'package:flutter/material.dart';

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
          margin: EdgeInsets.only(bottom: bottom ),
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
    color: primary,
    child: Image.network(
      firstImage,
      width: double.infinity,
      height: coverHeight,
      fit: BoxFit.cover,
    ),
  );
}

Widget buildProfileImage(String img) {
  return  CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: primary,
    backgroundImage:  AssetImage(img),
  );
}
