import 'package:flutter/material.dart';
import 'package:mental_health_app/Models/appUser.dart';
import 'package:mental_health_app/Reusable%20Widgets/button_widget.dart';

import '../../../Constants/project_colors.dart';
import '../../../Reusable Widgets/show_popup_dialog.dart';

class ChangePasswordTile extends StatefulWidget {
  const ChangePasswordTile({Key? key}) : super(key: key);

  @override
  State<ChangePasswordTile> createState() => _ChangePasswordTileState();
}

class _ChangePasswordTileState extends State<ChangePasswordTile> {
  bool changePasswordTileIsCollapsed = true;
  bool _currentPasswordVisible = false;
  bool _newPasswordVisible = false;
  bool _confirmedNewPasswordVisible = false;

  String enteredCurrentPassword = '';
  String enteredNewPassword = '';
  String enteredConfirmedNewPassword = '';


  @override
  Widget build(BuildContext context) {
    return Padding(
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
              changePasswordTileIsCollapsed = !changePasswordTileIsCollapsed;
            });
          },
          collapsedBackgroundColor: mainWhite,
          iconColor: Colors.deepOrange,
          collapsedIconColor: mainPurple,
          leading: CircleAvatar(
              backgroundColor:
                  changePasswordTileIsCollapsed
                   //   ? lightLavender
                      ? lightPink
                      : lightPink,
              child: Icon(
                Icons.key,
                color: changePasswordTileIsCollapsed
                  //  ? mainPurple
                    ? darkOrange
                    : darkOrange,
              )),
          title: Text(
            'Change password',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: changePasswordTileIsCollapsed
                  ? mainPurple
                  : darkOrange,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [

                  SizedBox(
                    height: 50,
                    child: Material(
                      elevation: 1,
                      shadowColor: Colors.black87,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                      child: TextField(
                        onSubmitted: (value) {
                          setState(() {
                            enteredCurrentPassword = value;
                          });
                          //compare the entered value with the current password
                        },
                        style: const TextStyle(color: Colors.black),
                        obscureText: _currentPasswordVisible,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(width: 0.5, color: mainPurple),
                          ),

                          // enabledBorder: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(30),
                          //   borderSide: const BorderSide(width: 1, color: darkOrange),
                          // ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: lightOrange,
                          hintText: "Current password",

                          prefix: const SizedBox(width: 10,),

                          suffixIcon: IconButton(
                            icon: Icon(
                              _currentPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _currentPasswordVisible = !_currentPasswordVisible;
                              });
                            },
                          ),
                          // prefixIcon: Icon(Icon),
                        ),
                      ),
                    ),
                  ),


                  const SizedBox(height: 20,),



                  SizedBox(
                    height: 50,
                    child: Material(
                      elevation: 1,
                      shadowColor: Colors.black87,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                      child: TextField(
                        onSubmitted: (value) {
                          setState(() {
                            enteredNewPassword = value;
                          });
                          //compare the entered value with the current password
                        },
                        style: const TextStyle(color: Colors.black),
                        obscureText: _newPasswordVisible,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(width: 0.5, color: mainPurple),
                          ),

                          // enabledBorder: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(30),
                          //   borderSide: const BorderSide(width: 1, color: darkOrange),
                          // ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: lightPink,
                          hintText: "New password",

                          prefix: const SizedBox(width: 10,),

                          suffixIcon: IconButton(
                            icon: Icon(
                              _newPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _newPasswordVisible = !_newPasswordVisible;
                              });
                            },
                          ),

                        ),
                      ),
                    ),
                  ),


                  const SizedBox(height: 20,),



                  SizedBox(
                    height: 50,
                    child: Material(
                      elevation: 1,
                      shadowColor: Colors.black87,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                      child: TextField(
                        onSubmitted: (value) {
                          setState(() {
                            enteredConfirmedNewPassword = value;

                          });
                          //compare the entered value with the current password
                        },
                        style: const TextStyle(color: Colors.black),
                        obscureText: _confirmedNewPasswordVisible,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(width: 0.5, color: mainPurple),
                          ),

                          // enabledBorder: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(30),
                          //   borderSide: const BorderSide(width: 1, color: darkOrange),
                          // ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: lightPink,
                          hintText: "Confirm new password",

                          prefix: const SizedBox(width: 10,),

                          suffixIcon: IconButton(
                            icon: Icon(
                              _confirmedNewPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _confirmedNewPasswordVisible = !_confirmedNewPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),


                  const SizedBox(height: 20,),

                  ButtonWidget(text: "Change password", onClicked: (){
                    resetPasswordPopUpDialog(context: context);

                    if(enteredCurrentPassword == currentAppUser.password)
                      {
                        if(enteredNewPassword == enteredConfirmedNewPassword)
                          {
                            currentAppUser.password = enteredConfirmedNewPassword;
                            debugPrint("user's password was updqted");
                            resetPasswordPopUpDialog(context: context);
                          }
                        else
                          {
                            debugPrint("entered new passwords do not match each other, please try again!");

                          }
                      }
                    else
                      {
                        debugPrint("entered current password is not correct!");
                      }

                  }),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget resetPasswordButton() {
    return Center(
      child: ButtonWidget(
        onClicked: () {
          resetPasswordPopUpDialog(context: context);
        },
        childWidget:  const Center(
          child: Text(
            'Change Password',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ), text: '',
      ),
    );
  }
}
