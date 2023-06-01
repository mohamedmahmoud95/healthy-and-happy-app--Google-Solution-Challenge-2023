// //This screen is to include a shortcut to the most important features of the app
// //to make it easier for the users to access it.
//
// import 'package:flutter/material.dart';
//
// import '../../Constants/project_colors.dart';
// import '../../Models/appUser.dart';
// import '../../screens/about_us_screen/about_us_screen.dart';
// import '../../screens/all_app_features_screen/all_app_features_screen.dart';
// import '../../screens/settings_screen/settings_screen.dart';
//
// class MenuScreen extends StatefulWidget {
//   const MenuScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MenuScreen> createState() => _MenuScreenState();
// }
//
// class _MenuScreenState extends State<MenuScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//         child: Scaffold(
//
//             body: ListView(
//               padding: EdgeInsets.zero,
//               children: <Widget>[
//
//                 Container(
//                   height: 150,
//
//                   color: mainPurple,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         radius: 52,
//                         backgroundColor: mainWhite,
//                         child: CircleAvatar(
//                           radius: 50,
//                           foregroundImage:
//                           AssetImage('${thisAppUser.profilePicUrl}'),
//                         ),
//                       ),
//
//                       Text(
//                         '${thisAppUser.firstName} ${thisAppUser.firstName}',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize:
//                             thisAppUser.firstName!.length > 8 ? 16 : 24,
//                             overflow: TextOverflow.clip),
//                       ),
//
//                     ],
//                   ),
//
//                 ),
//
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//                   child: Divider(
//                     color: Colors.transparent,
//                   ),
//                 ),
//
//                 ListTile(
//                   leading: const Icon(
//                     Icons.home,
//                     color: mainPurple,
//                   ),
//                   title: const Text(
//                     'Home',
//                     style: TextStyle(color: mainPurple, fontSize: 20),
//                   ),
//                   onTap: () {
//                     setState(() {
//                       // bottomBarNavigatorIndex = 0; // Navigate to home screen
//                     });
//                     Navigator.pop(context); // Pop the drawer
//                   },
//                 ),
//
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//                   child: Divider(
//                     color: lavender,
//                   ),
//                 ),
//
//
//
//                 ListTile(
//                   leading: const Icon(
//                     Icons.grid_view_outlined,
//                     color: mainPurple,
//                   ),
//                   title: const Text(
//                     'All app features',
//                     style: TextStyle(color: mainPurple, fontSize: 20),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => const AllAppFeaturesScreen()));
//                   },
//                 ),
//
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//                   child: Divider(
//                     color: lavender,
//                   ),
//                 ),
//
//                 ListTile(
//                   leading: const Icon(
//                     Icons.settings,
//                     color: mainPurple,
//                   ),
//                   title: const Text(
//                     'Settings',
//                     style: TextStyle(color: mainPurple, fontSize: 20),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) =>  const SettingsScreen()));
//                   },
//                 ),
//
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//                   child: Divider(
//                     color: lavender,
//                   ),
//                 ),
//
//                 ListTile(
//                   leading: const Icon(
//                     Icons.people,
//                     color: mainPurple,
//                   ),
//                   title: const Text(
//                     'About us',
//                     style: TextStyle(color: mainPurple, fontSize: 20),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) =>  const AboutUsScreen()));
//                   },
//                 ),
//
//
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//                   child: Divider(
//                     color: lavender,
//                   ),
//                 ),
//
//                 ListTile(
//                   leading: const Icon(
//                     Icons.logout,
//                     color: mainPurple,
//                   ),
//                   title: const Text(
//                     'logout',
//                     style: TextStyle(color: mainPurple, fontSize: 20),
//                   ),
//                   onTap: () {
//                     Navigator.popUntil(
//                         context,
//                         ModalRoute.withName(Navigator
//                             .defaultRouteName)); // Navigate back until the login screen is reached.
//                   },
//                 ),
//               ],
//             ),
//
//         ),
//       )
//     );
//   }
// }
