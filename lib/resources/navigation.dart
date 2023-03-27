import 'package:flutter/material.dart';

class MyNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      color: Colors.amber,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IconButton(
            onPressed: ()=>2+3,
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: ()=>2+3,
            icon: const Icon(
              Icons.home_filled,
              color: Colors.green,
            ),
          ),
          IconButton(
            onPressed: ()=>2+3,
            icon: const Icon(
              Icons.account_box_rounded,
              color: Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }
}
