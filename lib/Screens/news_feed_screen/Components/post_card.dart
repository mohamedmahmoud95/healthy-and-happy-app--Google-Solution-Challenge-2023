import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';
import 'package:mental_health_app/Screens/news_feed_screen/Components/share_post_widget.dart';
import 'package:mental_health_app/Screens/news_feed_screen/Components/write_comment_widget.dart';

import '../../../Models/post.dart';

class PostCard extends StatefulWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  Color likeIconColor = Colors.black;
  int numOfTimesLikeButtonTapped = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightLavender,
      margin: const EdgeInsets.all(2),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        "${widget.post.postAuthor.profilePicUrl != null ? widget.post.postAuthor.profilePicUrl! : 'assets/images/profile_pic.png'}"),
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.post.postAuthor.firstName}  ${widget.post.postAuthor.lastName}',
                        style: const TextStyle(color: navyBlue),
                      ),
                      Text(
                        '${widget.post.postAuthor!.lastActive}',
                        style: const TextStyle(color: navyBlue, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${widget.post.text}',
                style: const TextStyle(color: navyBlue),
              ),
            ),
            Center(
              child: Expanded(

                // Center(
                //   child: Expanded(

                    child: Image.network('${widget.post.imageURL}'),

                    //    Image.network('${widget.post.imageURL}'),
                  ),
                ),
                // child: SizedBox(
                //
                //   height: 200,
                //   child: Image.network('${widget.post.imageURL}'),
                // ),
           //   ),
          //  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.thumb_up,
                            color: widget.post.numOfLikes > 0
                                ? mainBlue
                                : likeIconColor,

                          ),
                          onPressed: () {
                            setState(() {
                              numOfTimesLikeButtonTapped++;
                              if (numOfTimesLikeButtonTapped <=1)
                                   widget.post.numOfLikes++;
                              else if (numOfTimesLikeButtonTapped > 1 &&  widget.post.numOfLikes > 0) {
                                {
                                  widget.post.numOfLikes--;
                                  numOfTimesLikeButtonTapped = 0;
                                }
                              }
                            });

                          }),
                      const SizedBox(width: 4),
                      Text("${widget.post.numOfLikes ?? 0} like",
                          style: const TextStyle(color: navyBlue)),
                    ],
                  ),
                  Row(
                    children: [
                      WriteCommentWidget(numOfComments:widget.post.numOfComments),
                      const SizedBox(width: 4),
                      Text("${widget.post.numOfComments ?? 0} comment",
                          style: const TextStyle(color: navyBlue)),
                    ],
                  ),
                  Row(
                    children: [
                      SharePostWidget(numOfShares: widget.post.numOfShares),

                      const SizedBox(width: 4),
                      Text("${widget.post.numOfShares ?? 0} share",
                          style: const TextStyle(color: navyBlue)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
