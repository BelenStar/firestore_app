import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firestone_app/src/models/library_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LibraryProvider extends ChangeNotifier {
  final user = FirebaseAuth.instance.currentUser?.uid;
  int totalBooks = 0;

  LibraryProvider() {
    getBooksAdded().then((value) => totalBooks = value);
    notifyListeners();
  }

  Future<int> getBooksAdded() async {
    var myRef = FirebaseFirestore.instance
        .collection('books')
        .where('user_id', isEqualTo: user);
    var querySnapshot = await myRef.get();
    return querySnapshot.size;
  }

  Stream<List<Book>> getBooks() => FirebaseFirestore.instance
      .collection('books')
      .where('user_id', isEqualTo: user)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Book.fromJson(doc.data(), doc.id))
          .toList());

  Future createBook(Book book) async {
    await FirebaseFirestore.instance.collection('books').add(book.toJson());
    await getBooksAdded().then((value) => totalBooks = value);
  }

  Future editBook(Book book) async {
    final docRef = FirebaseFirestore.instance.collection('books').doc(book.id);
    await docRef.update(book.toJson());
  }

  Future<void> deleteBook(Book book) {
    return FirebaseFirestore.instance.collection('books').doc(book.id).delete();
  }

  get getBooksAddedCount => totalBooks;
}
