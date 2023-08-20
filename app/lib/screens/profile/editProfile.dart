import 'dart:io';

import 'package:app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/Sizer.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Future<File?> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return File(pickedFile.path);
    }

    return null;
  }

  static bool network_image = true;
  @override
  Widget build(BuildContext context) {
    File? _avatarImage;
    return Localizations(
        locale: Locale('en', 'US'),
        delegates: const <LocalizationsDelegate<dynamic>>[
          DefaultWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        child: Scaffold(
            appBar: AppBar(
              title: Text('Edit Profile'),
              centerTitle: true,
              backgroundColor: Colors.amber,
            ),
            body: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                    height: Sizer.sbv * 30,
                    color: Colors.amber,
                    child: Stack(
                      children: [
                        Container(
                          height: Sizer.sbv * 30,
                          width: Sizer.screenWidth,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(175),
                              bottomRight: Radius.circular(175),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white70,
                          minRadius: Sizer.sbh * 35,
                          child: CircleAvatar(
                            radius: Sizer.sbh * 30,
                            child: _avatarImage != null
                                ? Image.file(
                                    _avatarImage,
                                    fit: BoxFit.cover,
                                  )
                                : Icon(Icons.person),
                          ),
                        ),
                        Positioned(
                            right: Sizer.screenWidth / 2 - Sizer.sbh * 20,
                            bottom: 0,
                            child: InkWell(
                              onTap: () async {
                                final File? selectedImage =
                                    await pickImageFromGallery();
                                if (selectedImage != null) {
                                  setState(() {
                                    _avatarImage = selectedImage;
                                  });
                                }
                              },
                              child: Container(
                                width: Sizer.sbh * 40,
                                height: Sizer.sbh * 8,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black,
                                ),
                                child: Text(
                                  "Change Picture",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Sizer.fss,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ))
                      ],
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email Address',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Phone Number',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Address',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'City',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'State',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Zip Code',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirm Password',
                          ),
                        ),
                      ),
                      Container(
                          height: 50,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                            ),
                            child: Text('Save'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )),
                    ],
                  ),
                ),
              ],
            ))));
  }
}
