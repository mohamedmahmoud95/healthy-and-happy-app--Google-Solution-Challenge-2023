import 'package:flutter/material.dart';
import 'package:mental_health_app/Screens/articles_screen/read_article_page.dart';
import '../../../Constants/project_colors.dart';
import 'package:mental_health_app/Screens/news_feed_screen/Components/share_post_widget.dart';

import '../../../Models/article.dart';

class ArticleCard extends StatefulWidget {
  final Article article;
  const ArticleCard({super.key, required this.article});

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightLavender,
      margin: const EdgeInsets.all(2),
      child: Card(
      color: lightOrange,

      clipBehavior: Clip.hardEdge,
      shadowColor: mainPurple,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),

      ),

      child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReadArticleScreen(article: widget.article)),
        );
      },

      splashColor: Colors.white38,

      child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(


      child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [

          Center(
            child: SizedBox(

              width: double.infinity,
               height: 200,

                child: Image.network(widget.article.photoUrl,
                  fit: BoxFit.cover,
                )
            ),
          ),

                  Row(
                    children: [

                      const SizedBox(height: 8.0),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8.0),

                          Text(
                            '${widget.article.title } ',
                            style: const TextStyle(color: navyBlue, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),

                          Text(
                            '${widget.article.brief } ',
                            style: const TextStyle(color: navyBlue, fontSize: 15),
                          ),
                        ],
                      ),

                      const SizedBox(width: 40),
],
          ),
             //   SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.remove_red_eye_outlined,
                              color: widget.article.numRead > 0
                                  ? mainBlue
                                  : Colors.black,

                            ),
                            onPressed: () {
                              setState(() {
                                widget.article.numRead+=1;
                              }
                              );

                            }),


                        Text("${widget.article.numRead ?? 0} reads",
                            style: const TextStyle(color: navyBlue)),

                        ],
                    ),
                        const SizedBox(width: 40),


                        Row(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    height: 20,
                                    child: Image.asset('assets/images/facebook.png')
                                ),


                            const SizedBox(width: 15),

                            SizedBox(
                              height: 20,
                                child: Image.asset('assets/images/twitter.png')
                            ),
                            SharePostWidget(numOfShares: widget.article.numOfShares),

                            const SizedBox(width: 4),
                                Text("${widget.article.numOfShares ?? 0} share",
                                    style: const TextStyle(color: navyBlue)),

                      ],
                    ),
                          ],
                        ),

                      ],
                    ),


                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("${widget.article.source}",
                            style: TextStyle(color: navyBlue),),
                      ),


        ],
                ),

            ),
              ),
      ),
      ),
      ),
    );


  }
}


/*

class ArticleCard extends StatelessWidget {

Article article;
   ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhite,
      body: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];

            return Card(
              color: lightOrange,

              clipBehavior: Clip.hardEdge,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),

              child: InkWell(
                onTap: () {


                },

                splashColor: Colors.white38,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(

                    width: 150,
                    height: 90,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      Center(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(article.photoUrl),
                          ),

                          title: Text(
                            article.text,
                            style: const TextStyle(color: navyBlue),),


                          trailing: RatingBarIndicator(
                            rating: articles[index].rating,
                            itemCount: 5,
                            itemSize: 12.0,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, _) =>
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  ArticlePage( article: articles[0])),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }


}


 */