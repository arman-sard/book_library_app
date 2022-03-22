import 'package:flutter/material.dart';

class CirculeCover extends StatelessWidget {
  const CirculeCover(
      {Key? key, required this.title, required this.author, required this.imagePath}) : super(key: key);

  final String title;
  final String author;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
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
            CircleAvatar(
              child: IconButton(
                padding: EdgeInsets.zero,
                  icon: const Icon(                    
                    Icons.play_arrow_rounded,
                    size: 38,
                  ),
                  onPressed: () {}),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Text(title, style: Theme.of(context).textTheme.bodyText1),
        const SizedBox(height: 4),
        Text(author, style: Theme.of(context).textTheme.bodyText2)
      ],
    );
  }
}
