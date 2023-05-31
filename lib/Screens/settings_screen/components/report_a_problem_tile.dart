

import 'package:flutter/material.dart';

import '../../../Constants/project_colors.dart';
import '../../../Reusable Widgets/button_widget.dart';

class ReportProblemTile extends StatefulWidget {
  const ReportProblemTile({Key? key}) : super(key: key);

  @override
  State<ReportProblemTile> createState() => _ReportProblemTileState();
}

class _ReportProblemTileState extends State<ReportProblemTile> {
  bool reportProblemTileIsCollapsed = true;

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
              reportProblemTileIsCollapsed =
              !reportProblemTileIsCollapsed;
            });
          },
          collapsedBackgroundColor: mainWhite,
          iconColor: Colors.deepOrange,
          collapsedIconColor: mainPurple,
          leading: CircleAvatar(
              backgroundColor: reportProblemTileIsCollapsed
                  //? lightLavender
                  ? lightPink
                  : lightPink,
              child: Icon(
                Icons.report_problem_rounded,
                color: reportProblemTileIsCollapsed
                //  ? mainPurple
                    ? darkOrange
                    : darkOrange,
              )),
          title: Text(
            'Report a problem',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: reportProblemTileIsCollapsed
                  ? mainPurple
                  : Colors.deepOrange,
            ),
          ),
          children:  [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      "Thank you for reaching our, please press the button below to report the problem and we promise that we will try to fix ASAP :)",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height:20),

                    ButtonWidget(
                      text: "Write a feedback",
                      onClicked: () => showDialog(
                          context: context,
                          builder: (context) {
                            List<String> typeOfReportedProblem = [
                              "Usability problem with the app",
                              "Problem with other user/s",
                              "Problem with a therapist",
                              "Problem updating my data",
                            ];
                            List<String> dropdownItems =
                                typeOfReportedProblem;

                            String selectedTypeOfReportedProblem =
                                typeOfReportedProblem.first;
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
                                            "What's the matter?",
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
                                                  "Please describe the problem you are facing...",
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
                                                "Please select the category of this problem?",
                                                style: TextStyle(
                                                    color: mainPurple,
                                                    fontSize: 14,
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
                                                    selectedTypeOfReportedProblem,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        selectedTypeOfReportedProblem =
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
                                                                fontSize: 15,
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
                                                  text: "Send report",
                                                  onClicked: () {
                                                    //back-end code for deleting user's account here
                                                    debugPrint(
                                                        "feedback button pressed :(");
                                                  })
                                            ],
                                          )),
                                    ),
                                  );
                                });
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
