import 'package:flutter/material.dart';
import 'package:firestone_app/src/models/library_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LibraryProvider extends ChangeNotifier {
  Future createBook(Book book) async {
    await FirebaseFirestore.instance.collection('books').add(book.toJson());
  }
}
