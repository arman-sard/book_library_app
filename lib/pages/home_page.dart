// ignore_for_file: prefer_const_constructors

import 'package:book_library_app/data/book_data.dart';
import 'package:book_library_app/models/book.dart';
import 'package:book_library_app/widgets/circle_covers.dart';
import 'package:book_library_app/widgets/new_books.dart';
import 'package:book_library_app/widgets/search_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  List<Book> books = [];
  String query = '';
  String validation = '';
  double fontSize = 0;
  double hightSize = 0;
  bool _isVisible = true;
  bool _isVisibleSerch = false;
  bool _validationText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildSearch(),
          Visibility(
            visible: _isVisible,
            child: Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 0),
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Continue',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      CirculeCover(
                          title: 'My Book Cover',
                          author: 'A lot of authors',
                          imagePath: 'https://picsum.photos/id/101/200/200'),
                      CirculeCover(
                          title: 'My Book Cover',
                          author: 'A lot of authors',
                          imagePath: 'https://picsum.photos/id/100/200/200'),
                      CirculeCover(
                          title: 'My Book Cover',
                          author: 'A lot of authors',
                          imagePath: 'https://picsum.photos/id/1000/200/200'),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 15, bottom: 5),
                    child: Text(
                      'New',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Column(
                    children: [
                      NewBooks(
                          title: 'More Then Words',
                          author: 'John Sullivan',
                          imageUrl: 'https://picsum.photos/id/1001/200/300',
                          date: '04 Feb 2021'),
                      Divider(),
                      NewBooks(
                          title: 'Crazy 8\'s',
                          author: 'Jake Knapp',
                          imageUrl: 'https://picsum.photos/id/1002/200/300',
                          date: '25 Apr 2021'),
                      Divider(),
                      NewBooks(
                          title: 'My Book Cover',
                          author: 'A lot of authors',
                          imageUrl: 'https://picsum.photos/id/228/200/400',
                          date: '25 Apr 2021'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: _validationText,
            child: Padding(
              padding: EdgeInsets.only(top: 22),
              child: Text(validation, style: TextStyle(fontSize: 14)),
            ),
          ),
          Visibility(
            visible: _isVisibleSerch,
            child: Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10.0),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return buildBooks(book);
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Color.fromARGB(25, 171, 240, 228),
        padding: EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: BorderSide.none,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10),
                child: Row(
                  children: [
                    Icon(Icons.home_outlined, color: Colors.green[700]),
                    SizedBox(width: 5),
                    Text('Home'),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.auto_awesome_motion_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.explore_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_active_outlined),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Titel, Autor:innen, Genres',
        onChanged: searchBooks,
      );

  void searchBooks(String query) {
    final books = allBooks.where((book) {
      final titltLower = book.title.toLowerCase();
      final authorLower = book.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return titltLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(
      () {
        this.query = query;
        query == '' ? this.books = [] : this.books = books;

        if (query.isNotEmpty) {
          _isVisible = false;
          _isVisibleSerch = true;
        } else {
          _isVisible = true;
          _isVisibleSerch = false;
        }

        if (query.isNotEmpty && books.isEmpty) {
          validation = 'Keine passenden Treffer gefunden';
          _validationText = true;
        } else {
          validation = '';
          _validationText = false; 
        }
      },
    );
  }

  Widget buildBooks(Book book) => Material(
        elevation: 7,
        shadowColor: Color.fromARGB(171, 171, 240, 228),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1))),
          child: SizedBox(
            height: 100,
            child: ListTile(
              title: Row(
                children: [
                  SizedBox(
                    height: 75,
                    width: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: CachedNetworkImage(
                        imageUrl: book.urlImage,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        placeholder: (context, url) => Transform.scale(
                            scale: 0.3,
                            child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(book.title),
                      SizedBox(width: 25, height: 3),
                      Text(book.author,
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey.shade600)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}