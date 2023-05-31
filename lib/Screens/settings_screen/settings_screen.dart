import 'package:flutter/material.dart';
import 'package:mental_health_app/Models/appUser.dart';
import 'package:mental_health_app/Screens/settings_screen/components/change_password_tile.dart';

import '../../Constants/project_colors.dart';
import 'components/delete_account_tile.dart';
import 'components/edit_profile_pic_widget.dart';
import 'components/rate_us.dart';
import 'components/report_a_problem_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool editPasswordTileIsCollapsed = true;
  bool deleteAccountTileIsCollapsed = true;
  bool reportProblemTileIsCollapsed = true;
  bool contactUsTileIsCollapsed = true;

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
            title: const Text('Settings',
                style: TextStyle(
                    color: mainPurple, fontWeight: FontWeight.normal))),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 20),
              const EditProfilePicWidget(),
              const SizedBox(height: 10),
              Center(
                  child: Text(
                '${thisAppUser.firstName} ${thisAppUser.lastName}',
                style: const TextStyle(color: mainPurple, fontSize: 20),
              )),
              const SizedBox(height: 20),

              const Column(
                children: [
                  ChangePasswordTile(),
                  ReportProblemTile(),
                  DeleteAccountTile(),
                ],
              ),

              const SizedBox(
                height: 40,
              ),
              const RateUsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
