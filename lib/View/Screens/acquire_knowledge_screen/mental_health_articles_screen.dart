
import 'package:flutter/material.dart';

import '../../../Constants/project_colors.dart';
import '../../../Models/article.dart';
import '../../Reusable Widgets/article_card_widget.dart';

class MentalHealthArticlesScreen extends StatefulWidget {

  const MentalHealthArticlesScreen({super.key});

  @override
  State<MentalHealthArticlesScreen> createState() => _MentalHealthArticlesScreenState();
}

class _MentalHealthArticlesScreenState extends State<MentalHealthArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhite,
      body: ListView.builder(
          itemCount: articlesAboutMentalHealth.length,
          itemBuilder: (context, index) {
            return
              Column(
                children: [
                  ArticleCard(article: articlesAboutMentalHealth[index]),
                  const Divider(color: mainBlue, indent: 100, endIndent: 100,),
                ],
              );
          } ),
    );
  }
}
