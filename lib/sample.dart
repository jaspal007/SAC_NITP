import 'package:flutter/material.dart';

class MySample extends StatelessWidget {
  const MySample({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child:const Text('Hello World'),
        ),
      ),
    );
  }
}
