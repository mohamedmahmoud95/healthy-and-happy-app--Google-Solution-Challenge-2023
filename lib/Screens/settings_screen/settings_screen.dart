

import 'package:flutter/material.dart';
import 'package:mental_health_app/Models/appUser.dart';

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
                  child: CircleAvatar(
                    radius: 50,
                    foregroundImage: AssetImage('${thisAppUser.profilePicUrl}',),
                  ) ,
                ),

                const SizedBox(height: 10),

                Center(
              child: Text('${thisAppUser.firstName} ${thisAppUser.lastName}',
              style: const TextStyle(color: lavender, fontSize: 20),)
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
                          child: Icon(Icons.key, color: deleteAccountTileIsCollapsed? mainPurple: Colors.deepOrange,)),
                      title:
                      Text(
                        'Delete account',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: deleteAccountTileIsCollapsed? mainPurple: Colors.deepOrange,),
                      ),
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text("You are not going any where!",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),


                //  ButtonWidget(text: "Mark as done", onClicked: (){}),

              ],
            ),
          ),

        ),
    );
  }
}
