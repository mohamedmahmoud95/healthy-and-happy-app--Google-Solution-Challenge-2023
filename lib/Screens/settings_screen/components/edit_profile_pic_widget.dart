import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../../Constants/project_colors.dart';
import '../../../Models/appUser.dart';

class EditProfilePicWidget extends StatefulWidget {
  const EditProfilePicWidget({Key? key}) : super(key: key);

  @override
  State<EditProfilePicWidget> createState() => _EditProfilePicWidgetState();
}

class _EditProfilePicWidgetState extends State<EditProfilePicWidget> {
  File? image;

  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState((){
        this.image = imageTemp;
        currentAppUser.profilePicUrl = image.path;
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
          currentAppUser != null ?
          currentAppUser.profilePicUrl = image!.path:  debugPrint('null image path');
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
    return Center(
      child: SizedBox(
        height: 130,
        width: 130,
        child: Stack(
          children: [
            Positioned(
              child: CircleAvatar(
                radius: 60,
                  foregroundImage: AssetImage(
                  '${currentAppUser.profilePicUrl}',
                ),
              ),
            ),
            Positioned(
                left: 75,
                top: 85,
                child: CircleAvatar(
                  radius: 21,
                  backgroundColor: darkOrange,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: lightOrange,
                    child: IconButton(
                      icon: const Icon(
                        Icons.edit,
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
                ),
            )
          ],
        ),
      ),
    );
  }
}
