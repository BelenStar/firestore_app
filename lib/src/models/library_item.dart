class Book {
  final String name;
  final String genre;
  final double rating;
  final String? user;

  Book(
      {required this.user,
      required this.name,
      required this.genre,
      required this.rating});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      user: json['user_id'],
      name: json['name'],
      genre: json['genre'],
      rating: json['rating'],
    );
  }
  Map<String, dynamic> toJson() =>
      {'name': name, 'genre': genre, 'rating': rating, 'user_id': user};
}
