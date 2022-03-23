import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewBooks extends StatelessWidget {
  const NewBooks(
      {Key? key,
      required this.title,
      required this.author,
      required this.imageUrl,
      required this.date})
      : super(key: key);

  final String title;
  final String author;
  final String imageUrl;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          SizedBox(
            height: 95,
            width: 75,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => Transform.scale(
                    scale: 0.3, child: const CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(height: 2),
              Text(author, style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(height: 13),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 16,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 10),
                  Text(date, style: Theme.of(context).textTheme.subtitle1)
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(11),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications_none, size: 20),
            ),
          )
        ],
      ),
    );
  }
}
