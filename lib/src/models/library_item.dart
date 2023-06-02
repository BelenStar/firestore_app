class Book {
  final String name;
  final String genre;
  final double rating;

  Book({required this.name, required this.genre, required this.rating});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      name: json['name'],
      genre: json['genre'],
      rating: json['rating'],
    );
  }
  Map<String, dynamic> toJson() =>
      {'name': name, 'genre': genre, 'rating': rating};
}
