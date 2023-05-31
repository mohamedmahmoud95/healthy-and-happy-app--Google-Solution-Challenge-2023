

import 'package:flutter/material.dart';

import '../../../Constants/project_colors.dart';
import '../../../Models/appUser.dart';

class EditProfilePicWidget extends StatefulWidget {
  const EditProfilePicWidget({Key? key}) : super(key: key);

  @override
  State<EditProfilePicWidget> createState() => _EditProfilePicWidgetState();
}

class _EditProfilePicWidgetState extends State<EditProfilePicWidget> {
  @override
  Widget build(BuildContext context) {
    return    Center(
      child: SizedBox(
        height: 130,
        width: 130,
        child: Stack(
          children: [
            Positioned(
              child: CircleAvatar(
                radius: 60,
                foregroundImage: AssetImage(
                  '${thisAppUser.profilePicUrl}',
                ),
              ),
            ),
            Positioned(
                left: 75,
                top: 85,
                child: CircleAvatar(
                  radius: 21,
                  backgroundColor: darkOrange,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: lightOrange,
                    child: IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: darkOrange,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
