

import 'package:flutter/material.dart';

import '../../../Constants/project_colors.dart';

class DarkThemeToggler extends StatefulWidget {
  const DarkThemeToggler({Key? key}) : super(key: key);

  @override
  State<DarkThemeToggler> createState() => _DarkThemeTogglerState();
}

class _DarkThemeTogglerState extends State<DarkThemeToggler> {

  bool darkThemeSelected = false;

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
        child: ListTile(
          title:  Text(
            darkThemeSelected ?  'Dark Theme' :  'Light Theme',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: darkThemeSelected
              ?  mainPurple
                : darkOrange,
            ),),
          leading: CircleAvatar(
              backgroundColor:
              darkThemeSelected ? lightLavender : lightPink,
              child: Icon(
                Icons.dark_mode,
                color: darkThemeSelected
                    ? mainPurple
                    : darkOrange,
              )),
          trailing: Switch(
            value: darkThemeSelected,
            activeColor: mainPurple,
            inactiveTrackColor: lightPink,
            inactiveThumbColor: darkOrange,
            onChanged: (bool value){
              setState(() {
                darkThemeSelected = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
