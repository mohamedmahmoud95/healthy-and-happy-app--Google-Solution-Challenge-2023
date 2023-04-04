import 'package:flutter/material.dart';
import 'package:mental_health_app/Models/article.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../Constants/project_colors.dart';




class ReadArticleScreen extends StatefulWidget {
  final Article article;

  const ReadArticleScreen({super.key, required this.article});
  @override

  State<ReadArticleScreen> createState() => _ReadArticleScreen();

}

class _ReadArticleScreen extends State<ReadArticleScreen> {





  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse('${widget.article.url}');
    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

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


                    //Please note that you need to use elevated button instead of ButtonWidget here
                    //for some reason.. the url launcher does not work with my button widget..
                    //Center(child: ButtonWidget(text: "Learn more", onClicked: (){_launchUrl;})),

                    Center(
                       child: ElevatedButton(

                         style: ElevatedButton.styleFrom(
                           foregroundColor: mainWhite,
                           // backgroundColor: mainBlue,
                           shape: const StadiumBorder(),
                           padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                         ),
                        onPressed: _launchUrl,

                         child: const Text(
                           "Learn more",
                           style: TextStyle(fontSize: 16),
                         ),
                    ),
                     ),

                    const SizedBox(height: 30,),

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

