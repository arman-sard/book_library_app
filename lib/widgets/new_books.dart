// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewBooks extends StatelessWidget {
  NewBooks(
      {Key? key,
      required this.title,
      required this.author,
      required this.imageUrl,
      required this.date})
      : super(key: key);

  String title;
  String author;
  String imageUrl;
  String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade400, width: 1))),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(
              height: 110,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => Transform.scale(
                      scale: 0.3,
                      child: CircularProgressIndicator(
                          color: Colors.deepPurple[700])),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
          SizedBox(width: 25),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.black)),
              SizedBox(width: 20, height: 2),
              Text(author,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 13)),
              SizedBox(height: 15),
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined, size: 16),
                  SizedBox(width: 10),
                  Text(date)
                ],
              ),
            ],
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade400,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Icon(Icons.notifications_none, color: Colors.deepPurple[700]),
            ),
          )
        ],
      ),
    );
  }
}