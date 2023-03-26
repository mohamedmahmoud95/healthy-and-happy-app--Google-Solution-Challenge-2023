


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants/project_colors.dart';

class NewsFeedScreen extends StatefulWidget {
  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreen();

  }

class _NewsFeedScreen extends State<NewsFeedScreen> {


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
        body: Container(
          color: lightLavender,
        )
    );
  }
}

