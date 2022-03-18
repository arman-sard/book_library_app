class  Book {
  final String id;
  final String author;
  final String title;
  final String urlImage;


  const  Book({
    required this.id,
    required this.author,
    required this.title,
    required this.urlImage,
  });

  factory  Book.fromJson(Map<dynamic, dynamic> json) =>  Book(
        id: json['id'] ?? '',
        author: json['author']?? '',
        title: json['title']?? '',
        urlImage: json['download_url']?? '',
      );

  Map<dynamic, dynamic> toJson() => {
        'id': id,
        'author': author,
        'title': title,
        'download_url': urlImage,
      };
}