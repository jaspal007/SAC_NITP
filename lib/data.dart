import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sac_nitp/admin.dart';
import 'package:sac_nitp/firebase/storage_methods.dart';
import 'package:sac_nitp/result.dart';
import 'package:sac_nitp/upload_scoreCard.dart';
import 'package:sac_nitp/utility/snackbar.dart';

import 'firebase/firestore_methods.dart';
import 'resources/image_picker.dart';

List<Widget> Pages = <Widget>[
  const MyAdmin(),
  const MyResult(),
];
int _currIndex = 0;

class MyData extends StatefulWidget {
  const MyData({super.key});

  @override
  State<StatefulWidget> createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {
  Uint8List? _file;
  bool _isLoading = false;
  ImagePicker imagePicker = ImagePicker();
  Uint8List? _image;

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
  // late OverlayEntry entry;

  @override
  // void initState() {
  //   super.initState();
  //   entry = OverlayEntry(
  //     builder: (context) {
  //       return Center(
  //         child: Container(
  //           height: MediaQuery.of(context).size.height,
  //           width: MediaQuery.of(context).size.width,
  //           color: Colors.black.withOpacity(0.5),
  //           child: FloatingActionButton(onPressed: () {
  //             _file == null
  //                 ? Center(
  //                     child: IconButton(
  //                       icon: const Icon(Icons.upload),
  //                       onPressed: () => _selectImage(context),
  //                     ),
  //                   )
  //                 : postImage();
  //             entry.remove();
  //           }),
  //         ),
  //       );
  //     },
  //   );
  // }

  void postImage() async {
    setState(() {
      _isLoading = true;
    });
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('results', _file!, true);
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
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Add Results Table'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(
                    ImageSource.camera,
                  );
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(
                    ImageSource.gallery,
                  );
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Pages[_currIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black54,
          iconSize: 30,
          fixedColor: Colors.white,
          currentIndex: _currIndex,
          onTap: (int index) {
            setState(() {
              _currIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Match',
              icon: Icon(
                Icons.sports_cricket_outlined,
                color: Colors.teal,
              ),
              activeIcon: Icon(
                Icons.sports_cricket_rounded,
                color: Colors.teal,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Result',
              icon: Icon(
                Icons.star_border_outlined,
                color: Colors.amber,
              ),
              activeIcon: Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyScore(),
              ),
            );
          },
          //   // Overlay.of(context).insert(entry);
          //   _file == null
          //       ? Center(
          //           child: IconButton(
          //             icon: const Icon(Icons.upload),
          //             onPressed: () => _selectImage(context),
          //           ),
          //         )
          //       : Scaffold(
          //           appBar: AppBar(
          //             backgroundColor: Colors.black,
          //             leading: IconButton(
          //               icon: Icon(Icons.arrow_back),
          //               onPressed: clearImage,
          //             ),
          //             title: const Text('Post to'),
          //             centerTitle: false,
          //             actions: [
          //               TextButton(
          //                 onPressed: () => postImage(),
          //                 child: const Text(
          //                   'Post',
          //                   style: TextStyle(
          //                     color: Colors.blueAccent,
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 16,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         );
          // },
          child: const Icon(Icons.abc),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
