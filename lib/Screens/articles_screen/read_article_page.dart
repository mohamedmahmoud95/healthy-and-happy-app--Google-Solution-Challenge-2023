import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/Models/appUser.dart';
import 'package:mental_health_app/Models/article.dart';
import 'package:mental_health_app/Reusable%20Widgets/card_widget.dart';
import 'package:reviews_slider/reviews_slider.dart';

import '../../Constants/project_colors.dart';

class ReadArticleScreen extends StatefulWidget {
  final Article article;

  const ReadArticleScreen({super.key, required this.article});
  @override

  State<ReadArticleScreen> createState() => _ReadArticleScreen();

}

class _ReadArticleScreen extends State<ReadArticleScreen> {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      backgroundColor: mainWhite,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryColor, size: 30),
        backgroundColor: mainWhite,
        elevation: 0,

       title: Text(widget.article.title,
       style: const TextStyle(color: mainPurple, fontWeight: FontWeight.normal),)
      ),

      body: Container(

        color: mainWhite,

        child: SingleChildScrollView(
          child: Center(

            child: Column(
              children: [

                const SizedBox(height: 8),
                Image.network(widget.article.photoUrl),
                const SizedBox(height: 8),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8.0),

                    Text(
                      '  ${widget.article.title } ',
                      style: const TextStyle(color: navyBlue, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),


                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(
                        '${widget.article.text } ',
                        style:  TextStyle(color: navyBlue, fontSize: 15,),
                        ),
                   ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

