import 'dart:core';

import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';
import 'package:mental_health_app/Models/category.dart';
import 'package:mental_health_app/Models/post.dart';
import 'package:mental_health_app/Reusable%20Widgets/new_post_widget.dart';
import 'package:mental_health_app/Reusable%20Widgets/post_card.dart';

import '../../Reusable Widgets/category_card.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  ScrollController _scrollController = ScrollController();
  final FloatingActionButtonLocation _floatingActionButtonLocation =
      FloatingActionButtonLocation.endFloat;
  List<Post> posts = [samplePost1, samplePost2, samplePost3, samplePost4];

  PostCategory selectedCategory = trending;


  @override
  void initState() {
    super.initState();
    for (Post post in posts) {
      if ((post.numOfLikes!)>15)
        {
          post.trending = true;
        }
      else
        {
          post.trending = false;
        }
    }
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        backgroundColor: mainWhite,
        floatingActionButton: const NewPostWidget(),
        floatingActionButtonLocation: _floatingActionButtonLocation,
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(height: 8,),


            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: categoryCards(),
            ),


            for (Post post in posts)
              if (post.category == selectedCategory || selectedCategory == all)
                  PostCard(post: post),

            if (selectedCategory == trending)
              for (Post post in posts)
                 if (post.trending == true)
                    PostCard(post: post),

            const SizedBox(height: 20,),
            //  Container(child: PostsList()),
          ],
        )),
      ),
    );
  }

  Widget categoryCards (){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CategoryCard(
            category: trending,
            selectedCategory: selectedCategory,
            onSelected: () {
              setState(() {
                selectedCategory = trending;
              });
            }),
        CategoryCard(
            category: nutrition,
            selectedCategory: selectedCategory,
            onSelected: () {
              setState(() {
                selectedCategory = nutrition;
              });
            }),
        CategoryCard(
            category: selfCare,
            selectedCategory: selectedCategory,
            onSelected: () {
              setState(() {
                selectedCategory = selfCare;
              });
            }),
        CategoryCard(
            category: all,
            selectedCategory: selectedCategory,
            onSelected: () {
              setState(() {
                selectedCategory = all;
              });
            }),
      ],
    );
  }

}
