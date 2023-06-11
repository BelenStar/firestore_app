class Book {
  final String? id;
  final String name;
  final String genre;
  final double rating;
  final String? user;

  Book(
      {this.id,
      required this.user,
      required this.name,
      required this.genre,
      required this.rating});

  factory Book.fromJson(Map<String, dynamic> json, String id) {
    return Book(
      user: json['user_id'],
      name: json['name'],
      genre: json['genre'],
      rating: json['rating'],
      id: id,
    );
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'genre': genre, 'rating': rating, 'user_id': user};

  @override
  String toString() {
    return 'Book{user: $user, name: $name, genre: $genre, rating: $rating}';
  }
}
