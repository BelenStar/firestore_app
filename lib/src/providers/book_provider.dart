import 'package:flutter/material.dart';
import 'package:firestone_app/src/models/library_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LibraryProvider extends ChangeNotifier {
  Stream<List<Book>> getBooks() => FirebaseFirestore.instance
      .collection('books')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Book.fromJson(doc.data())).toList());

  Future createBook(Book book) async {
    await FirebaseFirestore.instance.collection('books').add(book.toJson());
  }
}
