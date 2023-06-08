import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firestone_app/src/models/library_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LibraryProvider extends ChangeNotifier {
  final user = FirebaseAuth.instance.currentUser?.uid;
  final _book = FirebaseFirestore.instance;

  Stream<List<Book>> getBooks() => FirebaseFirestore.instance
      .collection('books')
      .where('user_id', isEqualTo: user)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Book.fromJson(doc.data())).toList());

  Future createBook(Book book) async {
    await FirebaseFirestore.instance.collection('books').add(book.toJson());
  }

  Future editBook(Book book) async {
    await _book.collection('books').doc(book.id).update(book.toJson());
    /* final updatedBook = FirebaseFirestore.instance.collection('books').doc();

    updatedBook.update(
        {'name': book.name, 'genre': book.genre, 'rating': book.rating}); */
  }
}
