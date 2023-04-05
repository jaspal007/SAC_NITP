import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sac_nitp/resources/image_picker.dart';
import 'package:sac_nitp/scorecard.dart';
import 'package:sac_nitp/utility/snackbar.dart';

import 'firebase/storage_methods.dart';

class StorageService {
  static String? photoUrl;

  Future<String> getLatestImageUrl() async {
    // Query Firestore to retrieve the document with the latest timestamp
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('resultTable')
        .orderBy('timestamp', descending: true)
        .limit(1)
        .get();

    // Extract the URL of the latest image from the document
    String imageUrl = querySnapshot.docs.first['url'];

    return imageUrl;
  }

  // StorageService(String image) {
  //   photoUrl = image;
  // }
}

class MyScore extends StatefulWidget {
  const MyScore({super.key});

  @override
  State<MyScore> createState() => _MyScoreState();
}

class _MyScoreState extends State<MyScore> {
  ImagePicker imagePicker = ImagePicker();
  Uint8List? _image;
  bool _isLoading = false;

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void postImage() async {
    setState(() {
      _isLoading = true;
    });
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('results', _image!, true);

      // StorageService.photoUrl = photoUrl;
      String res = photoUrl != null ? 'success' : 'Some Error occured';

      if (res == "success") {
        setState(() {
          _isLoading = true;
        });
        showSnackBar('posted', context);
        clearImage();
      } else {
        setState(() {
          _isLoading = true;
        });
        showSnackBar(res, context);
      }
      String showImage(String url) {
        url = photoUrl;
        return url;
      }

      FirebaseFirestore.instance.collection('resultTable').add({
        'url': photoUrl,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // imageUrl = photoUrl;
      // StorageService(photoUrl);
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  String sendImage() {
    return "url";
  }

  void clearImage() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: selectImage,
                child: const Text(
                  'Add Score Card',
                ),
              ),
              _image != null
                  ? SizedBox(
                      height: 500,
                      width: 500,
                      child: Image.memory(
                        _image!,
                        fit: BoxFit.contain,
                      ),
                    )
                  : SizedBox(
                      height: 500,
                      width: 500,
                      child: Image.asset("lib/assets/sac_nitp.jpg",
                          fit: BoxFit.contain),
                    ),
              InkWell(
                child: Text('Upload Image'),
                onTap: postImage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
