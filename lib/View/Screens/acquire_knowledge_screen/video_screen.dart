import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../../../Constants/project_colors.dart';
import '../../../Models/video.dart';
import '../../Reusable Widgets/button_widget.dart';
import '../../Reusable Widgets/video_card.dart';


Future<void> _launchUrl(String url) async {
  final Uri _url = Uri.parse(url);
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List<String> images = [];
  List<VideoItem> searchResults = [];

  Future<List<String>> fetchImages() async {
    final response = await http.get(Uri.parse('https://picsum.photos/v2/list?page=1&limit=20'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<String> urls = data.map((item) => item['download_url'].toString()).toList();

      setState(() {
        images = urls..shuffle();
      });
      return urls;
    } else {
      throw Exception('Failed to load images');
    }
  }

  Future<List<VideoItem>> searchVideos(String query) async {
    final response = await http.get(Uri.parse('https://www.googleapis.com/youtube/v3/search'
        '?part=snippet'
        '&q=$query'
        '&type=video'
        '&videoDefinition=high'
        '&videoEmbeddable=true'
        '&key=AIzaSyDs09HmS-CR0xwAze6_PkmngmFdiBTgF6g'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> items = data['items'];
      List<VideoItem> videos = items.map((item) => VideoItem.fromJson(item)).toList();
      return videos;
    } else {
      throw Exception('Failed to search videos');
    }
  }

  void handleSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        searchResults = [];
      });
    } else {
      searchVideos(query).then((videos) {
        setState(() {
          searchResults = videos;
        });
      }).catchError((error) {
        print(error);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    //fetchImages();
    handleSearch('best videos about Mental health ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhite,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(

                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),

                  ),
                ),
                onChanged: handleSearch,
              ),
            ),
            const SizedBox(height: 20),
            if (searchResults.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  const SizedBox(height: 20),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    // GridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //   crossAxisCount: 2,
                    //   crossAxisSpacing: 10,
                    //   mainAxisSpacing: 10,
                    // ),
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      return
                        Column(
                          children: [
                          VideoCard(video: searchResults[index], ),
                            const Divider(color: mainBlue, indent: 100, endIndent: 100,),
                          ],
                        );

                    },
                  ),
                  const Divider(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}




class VideoPlayerScreen extends StatelessWidget {
  final VideoItem video;

  const VideoPlayerScreen({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhite,
      appBar: AppBar(
        leading: BackButton(color: mainPurple,onPressed: ()=> Navigator.of(context).pop(),),
        backgroundColor: mainWhite,
        elevation: 0,

        title:  Text(video.title, style: TextStyle(color: mainPurple),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(video.thumbnailUrl),
            const SizedBox(height: 20),
            ButtonWidget(text: 'Watch on YouTube', onClicked: (){})
          ],
        ),
      ),
    );
  }
}