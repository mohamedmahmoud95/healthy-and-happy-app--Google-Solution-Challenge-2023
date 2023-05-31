import 'package:flutter/material.dart';

import '../../../Constants/project_colors.dart';

class ChangePasswordTile extends StatefulWidget {
  const ChangePasswordTile({Key? key}) : super(key: key);

  @override
  State<ChangePasswordTile> createState() => _ChangePasswordTileState();
}

class _ChangePasswordTileState extends State<ChangePasswordTile> {
  bool changePasswordTileIsCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: mainWhite,
        clipBehavior: Clip.hardEdge,
        shadowColor: mainPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ExpansionTile(
          onExpansionChanged: (value) {
            setState(() {
              changePasswordTileIsCollapsed =
              !changePasswordTileIsCollapsed;
            });
          },
          collapsedBackgroundColor: mainWhite,
          iconColor: Colors.deepOrange,
          collapsedIconColor: mainPurple,
          leading: CircleAvatar(
              backgroundColor: changePasswordTileIsCollapsed
                  ? lightLavender
                  : lightPink,
              child: Icon(
                Icons.key,
                color: changePasswordTileIsCollapsed
                    ? mainPurple
                    : Colors.deepOrange,
              )),
          title: Text(
            'Change password',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: changePasswordTileIsCollapsed
                  ? mainPurple
                  : Colors.deepOrange,
            ),
          ),
          children: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Your password seems good already :)",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
