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
  TextStyle purpleFont =
      TextStyle(color: Colors.deepPurple[700], fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSearch(),
            Visibility(
              visible: _isVisible,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [Text('Continue', style: purpleFont)],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      CirculeCover(
                          title: 'My Book Cover',
                          author: 'A Lot of authores',
                          imagePath: 'https://picsum.photos/id/101/200/200'),
                      CirculeCover(
                          title: 'My Book Cover',
                          author: 'A Lot of authores',
                          imagePath: 'https://picsum.photos/id/100/200/200'),
                      CirculeCover(
                          title: 'My Book Cover',
                          author: 'A Lot of authores',
                          imagePath: 'https://picsum.photos/id/1000/200/200'),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 15),
                    child: Row(
                      children: [Text('New', style: purpleFont)],
                    ),
                  ),
                  Column(
                    children: [
                      NewBooks(
                          title: 'More Then Words',
                          author: 'John Sullivan',
                          imageUrl: 'https://picsum.photos/id/236/200/400',
                          date: '04 Feb 2021'),
                      NewBooks(
                          title: 'Crazy 8\'s',
                          author: 'Jake Knapp',
                          imageUrl: 'https://picsum.photos/id/238/200/400',
                          date: '25 Apr 2021'),
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
            Padding(
              padding: EdgeInsets.only(top: hightSize),
              child: Text(validation, style: TextStyle(fontSize: fontSize)),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10.0),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return buildBooks(book);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          backgroundColor: Colors.blueAccent,
          iconSize: 25,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Colors.deepPurple[700]),
              label: '',
              backgroundColor: Color.fromARGB(255, 243, 250, 244),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_awesome_motion_outlined,
                  color: Colors.deepPurple),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined, color: Colors.deepPurple),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code, color: Colors.deepPurple),
              label: '',
            ),
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
        } else {
          _isVisible = true;
        }

        if (query.isNotEmpty && books.isEmpty) {
          validation = 'Keine passenden Treffer gefunden';
          fontSize = 14;
          hightSize = 22;
        } else {
          validation = '';
          fontSize = 0;
          hightSize = 0;
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
                            child: CircularProgressIndicator(
                                color: Colors.deepPurple[700])),
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
