
import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';
import 'package:mental_health_app/Models/post.dart';

import 'Components/category_card.dart';
import 'Components/post_card.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightLavender,
      body: SingleChildScrollView(
      child: Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CategoryCard(text: 'Trending'),
              CategoryCard(text: 'Relationship'),
              CategoryCard(text: 'Self-care'),
            ],
          ),

        PostCard(post: samplePost1),
          PostCard(post: samplePost2),
          PostCard(post: samplePost3),
          PostCard(post: samplePost4),

        SizedBox(height: 20,)


          //  Container(child: PostsList()),
        ],
      )
      ),

    );
  }
}




class PostsList extends StatefulWidget {

  const PostsList({
    Key? key,
  }) : super(key: key);

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  Color cardColor = lightOrange;

  @override
  Widget build(BuildContext context) =>
      ListView.builder(

        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://picsum.photos/64'),
                      ),
                      const SizedBox(width: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('John Doe', style: TextStyle(color: navyBlue)),
                          Text('2 hrs ago', style: TextStyle(color: navyBlue)),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      style: TextStyle(color: navyBlue)),
                ),
                SizedBox(
                  height: 200,
                  child: Image.network('https://picsum.photos/500'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.thumb_up),
                          SizedBox(width: 4),
                          Text('Like'),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.comment),
                          SizedBox(width: 4),
                          Text('Comment'),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.share),
                          SizedBox(width: 4),
                          Text('Share'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
}


List <CategoryCard> categoryCards = [
    const CategoryCard(text: 'Trending'),
    const CategoryCard(text: 'Relationship'),
    const CategoryCard(text: 'Self-care'),

];
