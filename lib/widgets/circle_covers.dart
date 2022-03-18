// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CirculeCover extends StatelessWidget {
  const CirculeCover(
      {required this.title, required this.author, required this.imagePath});

  final String title;
  final String author;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: CircleAvatar(
            radius: 16.0,
            child: ClipRRect(
              child: Image.network(imagePath),
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        SizedBox(height: 15),
        Text(title),
        SizedBox(height: 4),
        Text(
          author,
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 12),
        ),
      ],
    );
  }
}
