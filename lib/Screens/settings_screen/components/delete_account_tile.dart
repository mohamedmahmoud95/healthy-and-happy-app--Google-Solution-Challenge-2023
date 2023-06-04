

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/Models/appUser.dart';
import 'package:mental_health_app/firebase_services/firebase_auth_methods.dart';

import '../../../Constants/project_colors.dart';
import '../../../Reusable Widgets/button_widget.dart';

class DeleteAccountTile extends StatefulWidget {
  const DeleteAccountTile({Key? key}) : super(key: key);

  @override
  State<DeleteAccountTile> createState() => _DeleteAccountTileState();
}

class _DeleteAccountTileState extends State<DeleteAccountTile> {
  bool deleteAccountTileIsCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shadowColor: mainPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ExpansionTile(
          onExpansionChanged: (value) {
            setState(() {
              deleteAccountTileIsCollapsed =
              !deleteAccountTileIsCollapsed;
            });
          },
          collapsedBackgroundColor: mainWhite,
          iconColor: darkOrange,
          collapsedIconColor: mainPurple,
          leading: CircleAvatar(
              backgroundColor: deleteAccountTileIsCollapsed
                 // ? lightLavender
                  ? lightPink
                  : lightPink,
              child: Icon(
                Icons.delete,
                color: deleteAccountTileIsCollapsed
                //  ? mainPurple
                    ? darkOrange
                    : darkOrange,
              )),
          title: Text(
            'Delete account',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: deleteAccountTileIsCollapsed
                  ? mainPurple
                  : darkOrange,
            ),
          ),
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Caution",
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Are you sure you want to delete your account? \nOnce deleted, you will not be able to access this account again.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            ButtonWidget(
              text: "Delete my account",
              onClicked: () => showDialog(
                  context: context,
                  builder: (context) {
                    List<String> reasonsToDeleteAccount = [
                      "It's consuming a lot of my time",
                      "It has been useful but I'm no longer in need for this app",
                      "It's not what I expected",
                      "I've found a better alternative",
                    ];
                    List<String> dropdownItems =
                        reasonsToDeleteAccount;

                    String selectedReasonToDeleteAccount =
                        reasonsToDeleteAccount.first;
                    String feedback = '';

                    return StatefulBuilder(
                        builder: (context, setState) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Color(0xFF5e5fca),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: const Center(
                                  child: Text(
                                    "We are sad you're leaving :'(",
                                    style: TextStyle(fontSize: 18),
                                  )),
                            ),
                            content: SingleChildScrollView(
                              child: SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width *
                                      0.9,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        style: const TextStyle(
                                            color: Colors.black),
                                        onChanged: (value) {
                                          setState(() {
                                            feedback = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintText:
                                          "Your feedback is extremely important, please leave your thought here?",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          focusedBorder:
                                          const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: lavender),
                                          ),
                                        ),
                                        maxLines: 5,
                                      ),
                                      const SizedBox(height: 40),
                                      const Text(
                                        "Why are you leaving?",
                                        style: TextStyle(
                                            color: mainPurple,
                                            fontSize: 15,
                                            overflow: TextOverflow.clip),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          //back-end code to delete this account;
                                          DropdownButton<String>(
                                            underline: Container(
                                              height: 2,
                                              color: mainBlue,
                                            ),
                                            value:
                                            selectedReasonToDeleteAccount,
                                            onChanged: (newValue) {
                                              setState(() {
                                                selectedReasonToDeleteAccount =
                                                newValue!;
                                              });
                                            },
                                            items: dropdownItems.map<
                                                DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<
                                                    String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10,
                                                        overflow:
                                                        TextOverflow
                                                            .clip),
                                                  ),
                                                );
                                              },
                                            ).toList(),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 30),
                                      ButtonWidget(
                                          text: "Submit and delete",
                                          onClicked: () {
                                            //back-end code for deleting user's account here
                                            FirebaseAuthMethods().deleteAccount('${currentAppUser.email}', '12345678');
                                            debugPrint(
                                                "final delete my account pressed :(");
                                          })
                                    ],
                                  )),
                            ),
                          );
                        });
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
