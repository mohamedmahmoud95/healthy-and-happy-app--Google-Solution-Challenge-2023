import 'dart:core';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental_health_app/Constants/project_colors.dart';
import 'package:mental_health_app/Models/appUser.dart';
import 'package:mental_health_app/Models/category.dart';
import 'package:mental_health_app/Models/post.dart';
import 'package:mental_health_app/Reusable%20Widgets/button_widget.dart';
import 'package:mental_health_app/Reusable%20Widgets/post_card.dart';
import '../../Reusable Widgets/category_card.dart';
import 'package:path_provider/path_provider.dart';

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
      if ((post.numOfLikes!) > 15) {
        post.trending = true;
      } else {
        post.trending = false;
      }
    }

    posts.sort((a, b) => b.dateTime!.compareTo(a.dateTime!)); //sort posts by DateTime
  }


  File? image;

  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      debugPrint('Failed to pick image: $e');
    }
  }


  Future imageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      debugPrint('Failed to pick image: $e');
    }
  }


  String? enteredImageUrl;

  void imageFromUrl(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        final tempDir = await getTemporaryDirectory();
        final tempPath = '${tempDir.path}/temp_image.jpg';
        final tempFile = File(tempPath);
        await tempFile.writeAsBytes(bytes);

        setState(() {
          image = tempFile;
        });
      } else {
        debugPrint('Failed to load image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Failed to load image: $e');
    }
  }


  String newPostText = '';


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainWhite,
        floatingActionButton: thisAppUser.isTherapist?addNewPostButton(): null,
        floatingActionButtonLocation: _floatingActionButtonLocation,
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: buildRowOfCategoryCards(),
            ),

            for (Post post in posts)
              if (post.category == selectedCategory || selectedCategory == all)
                PostCard(post: post),

            if (selectedCategory == trending)
              for (Post post in posts)
                if (post.trending == true) PostCard(post: post),

            const SizedBox(
              height: 20,
            ),
            //  Container(child: PostsList()),
          ],
        )),
      ),
    );
  }

  Widget buildRowOfCategoryCards() {
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

  Widget addNewPostButton() => FloatingActionButton(
        backgroundColor: lavender,
        foregroundColor: mainWhite,
        child: const Icon(Icons.edit),

        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {

              List<PostCategory> dropdownItems = listOfPostCategoriesToChooseFromWhenCreateNewPost;

              PostCategory enteredCategory = dropdownItems.first;

              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xFF5e5fca),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Create Post',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    content: SingleChildScrollView(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              style: const TextStyle(color: Colors.black),
                              onChanged: (value) {
                                setState(() {
                                  newPostText = value;
                                });
                              },

                              decoration: InputDecoration(
                                hintText: "What's on your mind?",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: lavender),
                                ),
                              ),
                              maxLines: 10,
                            ),
                            const SizedBox(height: 40),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 21,
                                  backgroundColor: lavender,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: mainWhite,
                                    child: IconButton(
                                      icon: const Icon(Icons.add_a_photo_outlined, color: lavender,),

                                      onPressed: () {
                                        // Logic for copying image URL
                                        // Show modal bottom sheet
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                             // height: 150,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: [

                                                     ExpansionTile(
                                                      leading: const Icon(
                                                        Icons.link,
                                                        color: mainPurple,
                                                      ),
                                                      title: const Text(
                                                          'Copy Image URL',
                                                          style: TextStyle(
                                                              color: mainPurple)),
                                                      controlAffinity: ListTileControlAffinity.leading,
                                                      children: <Widget>[
                                                        TextField(
                                                          style:  const TextStyle(color: Colors.black),
                                                          onChanged: (value) {
                                                            enteredImageUrl = value;
                                                          },
                                                          decoration: InputDecoration(
                                                            hintText: "Paste image URL here",
                                                            border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                            ),
                                                            focusedBorder: const OutlineInputBorder(
                                                              borderSide: BorderSide(color: lavender),
                                                            ),
                                                          ),
                                                          maxLines: 1,
                                                        ),
                                                        IconButton(onPressed: (){
                                                          imageFromUrl(enteredImageUrl!);
                                                        }, icon: const Icon(Icons.upload_sharp)),
                                                      ],
                                                    ),

                                                    const SizedBox(
                                                        width: 400,
                                                        child: Divider(
                                                          thickness: 1,
                                                        )),
                                                    ListTile(
                                                      leading: const Icon(
                                                        Icons.file_upload,
                                                        color: mainPurple,
                                                      ),
                                                      title: const Text(
                                                        'Upload from Device',
                                                        style: TextStyle(
                                                            color: mainPurple),
                                                      ),
                                                      onTap: () {
                                                        pickImageFromGallery();
                                                        Navigator.pop(context);
                                                      },
                                                    ),

                                                    const SizedBox(
                                                        width: 400,
                                                        child: Divider(
                                                          thickness: 1,
                                                        )),
                                                    ListTile(
                                                      leading: const Icon(
                                                        Icons.camera_alt_outlined,
                                                        color: mainPurple,
                                                      ),
                                                      title: const Text(
                                                        'Take a picture',
                                                        style: TextStyle(
                                                            color: mainPurple),
                                                      ),
                                                      onTap: () {
                                                        imageFromCamera();
                                                        Navigator.pop(context);
                                                      },
                                                    ),

                                                    const SizedBox(
                                                        height: 10,
                                                      ),

                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },

                                    ),
                                ),
                                ),





                      CircleAvatar(
                        radius: 21,
                        backgroundColor: lavender,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: mainWhite,
                          child: IconButton(
                            icon: const Icon(Icons.video_call_outlined, color: lavender,),

                            onPressed: () {
                                    // Logic for copying video URL
                                    // Show modal bottom sheet
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: 150,
                                          child: Column(
                                            children: [
                                              ListTile(
                                                leading: const Icon(
                                                  Icons.link,
                                                  color: mainPurple,
                                                ),
                                                title: const Text(
                                                  'Copy Video URL',
                                                  style: TextStyle(
                                                    color: mainPurple,
                                                  ),
                                                ),
                                                onTap: () {
                                                  // Perform action for copying video URL
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              const SizedBox(
                                                  width: 400,
                                                  child: Divider(
                                                    thickness: 1,
                                                  )),
                                              ListTile(
                                                leading: const Icon(
                                                  Icons.file_upload,
                                                  color: mainPurple,
                                                ),
                                                title: const Text(
                                                  'Upload from Device',
                                                  style: TextStyle(
                                                    color: mainPurple,
                                                  ),
                                                ),
                                                onTap: () {
                                                  // Perform action for uploading video from device
                                                  Navigator.pop(context);
                                                },
                                              ),

                                              const SizedBox(
                                                height: 10,
                                              ),

                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },

                                ),
                            ),
                          ),


                                DropdownButton<PostCategory>(
                                  underline: Container(
                                    height: 1,
                                    color: lavender,
                                  ),
                                  value: enteredCategory,
                                  onChanged: (newValue) {
                                    setState(() {
                                      enteredCategory = newValue!;
                                    });
                                  },
                                  items:
                                  dropdownItems.map<DropdownMenuItem<PostCategory>>(
                                        (PostCategory value) {
                                      return DropdownMenuItem<PostCategory>(
                                        value: value,
                                        child: Text(
                                          value.categoryName,
                                          style: const TextStyle(
                                            color: mainPurple,
                                          ),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ButtonWidget(
                                  text: 'Publish',
                                  backgroundColor: newPostText.isEmpty? Colors.grey : mainOrange ,

                                  onClicked: () {
                                    if (newPostText.isEmpty) {
                                      return; // Do not create a new post if the text is empty
                                    }

                                    Post newPost = Post(
                                      text: newPostText,
                                      postAuthor: sampleAppUser1,
                                      dateTime: DateTime.now(),
                                      category: listOfPostCategories.firstWhere(
                                            (category) => category == enteredCategory,
                                        orElse: () => other, // Provide a fallback value if category not found
                                      ),
                                    );

                                    debugPrint("New post added");
                                    debugPrint("New post text $newPostText");
                                    debugPrint("New post text from inside it ${newPost.text}");
                                    debugPrint("New post author ${newPost.postAuthor!.firstName}");
                                    debugPrint("New post time ${newPost.dateTime}");
                                    debugPrint("New post category ${newPost.category?.categoryName}");

                                    setState(() {
                                    //  posts.add(newPost);
                                      posts.insert(0, newPost); //insert the new post at the beginning of the posts list
                                    });
                                    Navigator.pop(context);
                                    setState((){});
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },

      );
}
