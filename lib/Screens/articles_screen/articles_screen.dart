
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mental_health_app/Screens/articles_screen/components/article_card_widget.dart';

import '../../../Constants/project_colors.dart';
import '../../Models/article.dart';
import 'health_articles_screen.dart';
import 'mental_health_articles_screen.dart';



class ArticlesScreen extends StatefulWidget {

  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
               backgroundColor: mainWhite,
              // elevation: 0,
               title: const Text('Acquire knowledge',
                   style: TextStyle(color: mainPurple,fontWeight: FontWeight.normal)),

          bottom:  TabBar(
            indicatorColor: mainPurple,
            labelColor: mainPurple,
              tabs: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('   Mental health    '),
                    Tab(icon: Image.asset('assets/icons/mental_health_icon.png', color: mainPurple,),),
                  ],
                ),
                Row(
                  children: [
                    const Text('        health    '),
                    Tab(icon: Image.asset('assets/icons/health_icon.png', color: mainPurple,),),
                  ],
                ),              ],
            ),
          ),

      body:  const TabBarView(
        children: [
          MentalHealthArticlesScreen(),
          HealthArticlesScreen(),
        ],
      ),
    ),
    ),
    );
  }
}
