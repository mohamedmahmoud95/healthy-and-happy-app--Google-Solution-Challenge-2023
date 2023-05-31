

import 'package:flutter/material.dart';
import 'package:mental_health_app/Models/appUser.dart';
import 'package:mental_health_app/Reusable%20Widgets/button_widget.dart';

import '../../Constants/project_colors.dart';

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
              leading: BackButton(color: mainPurple, onPressed: ()=> Navigator.of(context).pop(),),
              iconTheme: const IconThemeData(color: mainPurple, size: 30),
              backgroundColor: mainWhite,
              elevation: 0,
              title: const Text('Settings',
                  style: TextStyle(color: mainPurple, fontWeight: FontWeight.normal))
          ),

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                Center(
                  child: Container(
                    height: 130,
                    width: 130,
                    child: Stack(
                      children:[

                       Positioned(
                         child: CircleAvatar(
                          radius: 60,
                          foregroundImage: AssetImage('${thisAppUser.profilePicUrl}',),
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

                          icon: const Icon(Icons.edit, color: darkOrange,), onPressed: () {  },
                        ),
                              ),
                            ))
                    ],
                    ),
                  ) ,
                ),

                const SizedBox(height: 10),

                Center(
              child: Text('${thisAppUser.firstName} ${thisAppUser.lastName}',
              style: const TextStyle(color: mainPurple, fontSize: 20),)
            ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: mainWhite,
                    clipBehavior: Clip.hardEdge,
                    shadowColor: mainPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ExpansionTile(
                      onExpansionChanged: (value){
                        setState(() {
                          editPasswordTileIsCollapsed = ! editPasswordTileIsCollapsed;
                        });
                      },
                      collapsedBackgroundColor: mainWhite,
                      iconColor: Colors.deepOrange ,
                      collapsedIconColor: mainPurple,

                      leading: CircleAvatar(backgroundColor:editPasswordTileIsCollapsed? lightLavender: lightPink,
                          child: Icon(Icons.key, color: editPasswordTileIsCollapsed? mainPurple: Colors.deepOrange,)),
                      title:
                      Text(
                        'Change password',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: editPasswordTileIsCollapsed? mainPurple: Colors.deepOrange,),
                      ),
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text("Your password seems good already :)",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    shadowColor: mainPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ExpansionTile(
                      onExpansionChanged: (value){
                        setState(() {
                          deleteAccountTileIsCollapsed = ! deleteAccountTileIsCollapsed;
                        });
                      },
                      collapsedBackgroundColor: mainWhite,
                      iconColor: Colors.deepOrange ,
                      collapsedIconColor: mainPurple,

                      leading: CircleAvatar(backgroundColor:deleteAccountTileIsCollapsed? lightLavender: lightPink,
                          child: Icon(Icons.delete, color: deleteAccountTileIsCollapsed? mainPurple: Colors.deepOrange,)),
                      title:
                      Text(
                        'Delete account',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: deleteAccountTileIsCollapsed? mainPurple: Colors.deepOrange,),
                      ),
                      children:  [
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Caution",
                                style: TextStyle(fontSize: 20, color: Colors.red),
                              ),

                              SizedBox(height: 10,),

                              Text("Are you sure you want to delete your account? \nOnce deleted, you will not be able to access this account again.",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),

                        ButtonWidget(
    text: "Delete my account",
    onClicked: ()=>
    showDialog(
    context: context,
    builder: (context) {

    List <String> reasonsToDeleteAccount = [
    "It's consuming a lot of my time",
    "It has been useful but I'm no longer in need for this app",
    "It's not what I expected",
    "I've found a better alternative",
    ];
    List<String> dropdownItems = reasonsToDeleteAccount;

    String selectedReasonToDeleteAccount = reasonsToDeleteAccount.first;
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
      child: Center(child: const Text("We are sad you're leaving :'(", style: TextStyle(fontSize: 18),)),
    ),
    content: SingleChildScrollView(
    child: SizedBox(
    width: MediaQuery.of(context).size.width * 0.9,
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    TextField(
    style: const TextStyle(color: Colors.black),
    onChanged: (value) {
    setState(() {
    feedback = value;
    });
    },

    decoration: InputDecoration(
    hintText: "Your feedback is extremely important, please leave your thought here?",
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: lavender),
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
            overflow: TextOverflow.clip
        ),

      ),

    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    //back-end code to delete this account;
    DropdownButton<String>(
    underline: Container(
    height: 2,
    color: mainBlue,
    ),
    value: selectedReasonToDeleteAccount,
    onChanged: (newValue) {
    setState(() {
    selectedReasonToDeleteAccount = newValue!;
    });
    },
    items:
    dropdownItems.map<DropdownMenuItem<String>>(
    (String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(
    value,
    style: const TextStyle(
    color: mainPurple,
      fontSize: 10,
      overflow: TextOverflow.clip
    ),

    ),
    );
    },
    ).toList(),
    ),
    ],
    ),
    const SizedBox(height: 30),
      
      ButtonWidget(text: "Submit and delete", onClicked: (){
        //back-end code for deleting user's account here
        debugPrint("final delete my account pressed :(");
      })
    ],
    )

    ),
    ),
    );
    }
    );
    }

        ),
    ),
                        const SizedBox(height: 20,),

                      ],
        ),
        ),
        ),

    ],
    ),
        ),
        ),
    );
  }

}
