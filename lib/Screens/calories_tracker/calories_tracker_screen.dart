

import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental_health_app/Constants/project_colors.dart';
import 'package:path_provider/path_provider.dart';

import '../../Models/appUser.dart';

class CaloriesTrackerScreen extends StatefulWidget {
  const CaloriesTrackerScreen({Key? key}) : super(key: key);

  @override
  State<CaloriesTrackerScreen> createState() => _CaloriesTrackerScreenState();
}

class _CaloriesTrackerScreenState extends State<CaloriesTrackerScreen> {
  File? image;

  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState((){
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  Future imageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
        currentAppUser.profilePicUrl = image.path;
      });
    } on PlatformException catch (e) {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: mainWhite,
        appBar: AppBar(
            leading: BackButton(
              color: mainPurple,
              onPressed: () => Navigator.of(context).pop(),
            ),
            iconTheme: const IconThemeData(color: mainPurple, size: 30),
            backgroundColor: mainWhite,
            elevation: 0,
            title: const Text('Calories calculator',
                style: TextStyle(
                    color: mainPurple, fontWeight: FontWeight.normal))),

        body: Center(
          child: newPictureButton(),
        ),
      ),
    );
  }



  Widget newPictureButton() => CircleAvatar(
    radius: 21,
    backgroundColor: darkOrange,
    child: CircleAvatar(
      radius: 20,
      backgroundColor: lightOrange,
      child: IconButton(
        icon: const Icon(
          Icons.camera_alt_outlined,
          color: darkOrange,
        ),
        onPressed: () {
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
                        title: const Text('Copy Image URL',
                            style: TextStyle(color: mainPurple)),
                        controlAffinity:
                        ListTileControlAffinity.leading,
                        children: <Widget>[
                          TextField(
                            style: const TextStyle(
                                color: Colors.black),
                            onChanged: (value) {
                              enteredImageUrl = value;
                            },
                            decoration: InputDecoration(
                              hintText: "Paste image URL here",
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),
                              ),
                              focusedBorder:
                              const OutlineInputBorder(
                                borderSide:
                                BorderSide(color: lavender),
                              ),
                            ),
                            maxLines: 1,
                          ),
                          IconButton(
                              onPressed: () {
                                imageFromUrl(enteredImageUrl!);
                              },
                              icon:
                              const Icon(Icons.upload_sharp)),
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
                          style: TextStyle(color: mainPurple),
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
                          style: TextStyle(color: mainPurple),
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
  );
}
