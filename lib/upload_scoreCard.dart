import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sac_nitp/resources/image_picker.dart';

class MyScore extends StatefulWidget {
  const MyScore({super.key});

  @override
  State<MyScore> createState() => _MyScoreState();
}

class _MyScoreState extends State<MyScore> {
  ImagePicker imagePicker = ImagePicker();
  Uint8List? _image;

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
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
            ],
          ),
        ),
      ),
    );
  }
}
