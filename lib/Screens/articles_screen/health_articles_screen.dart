
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mental_health_app/Screens/articles_screen/components/article_card_widget.dart';

import '../../../Constants/project_colors.dart';
import '../../Models/article.dart';



class HealthArticlesScreen extends StatefulWidget {

  const HealthArticlesScreen({super.key});

  @override
  State<HealthArticlesScreen> createState() => _HealthArticlesScreenScreenState();
}

class _HealthArticlesScreenScreenState extends State<HealthArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhite,
      body: ListView.builder(
          itemCount: articlesAboutHealth.length,
          itemBuilder: (context, index) {
            final article = articlesAboutHealth[index];

            return
              Column(
                children: [
                  ArticleCard(article: articlesAboutHealth[index]),
                  const Divider(color: mainBlue, indent: 100, endIndent: 100,),
                  //
                  // ArticleCard(article:  articlesAboutMentalHealth[1]),
                  // const Divider(color: mainBlue, indent: 100, endIndent: 100,),
                  //
                  // ArticleCard(article:  articlesAboutMentalHealth[2]),

                ],
              );
          } ),
    );
  }
}
