//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestone_app/src/models/library_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firestone_app/src/providers/book_provider.dart';
import 'package:provider/provider.dart';

class EditBookPage extends StatefulWidget {
  const EditBookPage({super.key});

  @override
  State<EditBookPage> createState() => _EditBookPageState();
}

class _EditBookPageState extends State<EditBookPage> {
  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<LibraryProvider>(context);
    final Book book = ModalRoute.of(context)!.settings.arguments as Book;
    final id = book.id;
    final nameController = TextEditingController(text: book.name);
    final genreController = TextEditingController(text: book.genre);
    final ratingController =
        TextEditingController(text: (book.rating).toString());

    return Scaffold(
      backgroundColor: const Color(0xff403E40),
      appBar: AppBar(
        title: Text(
          'Edit Book',
          style: GoogleFonts.bitter(
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        backgroundColor: const Color(0xffBABFD9),
      ),
      body: Center(
          child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(
            height: 10,
          ),
          const Icon(
            Icons.book_rounded,
            //Icons.menu_book_sharp,
            size: 100,
            //color: Color(0xffBABFD9),
            color: Color(0xff8F92A6),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              'Change what you need',
              style: GoogleFonts.bitter(
                  textStyle:
                      const TextStyle(color: Color(0xff8F92A6), fontSize: 15)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              label: const Text('Name'),
              labelStyle: GoogleFonts.bitter(color: const Color(0xffE4EAF2)),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Color(0xff262526))),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Color(0xffE4EAF2))),
            ),
            style: GoogleFonts.bitter(color: Colors.white),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: genreController,
            // initialValue: book.genre,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: const Text('Genre(s)'),
              labelStyle: GoogleFonts.bitter(color: const Color(0xffE4EAF2)),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Color(0xff262526))),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Color(0xffE4EAF2))),
            ),
            style: GoogleFonts.bitter(color: Colors.white),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: ratingController,
            // initialValue: (book.rating).toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: const Text('Rating'),
              hintText: '1-5',
              hintStyle: GoogleFonts.bitter(color: const Color(0xffE4EAF2)),
              labelStyle: GoogleFonts.bitter(color: const Color(0xffE4EAF2)),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Color(0xff262526))),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Color(0xffE4EAF2))),
            ),
            style: GoogleFonts.bitter(color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                final book = Book(
                  id: id,
                  user: bookProvider.user,
                  name: nameController.text,
                  genre: genreController.text,
                  rating: double.parse(ratingController.text),
                );

                bookProvider.editBook(book);
                Navigator.pushNamed(context, '/library');
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xffBABFD9)),
              ),
              child: Text('Update Book',
                  style: GoogleFonts.bitter(
                      textStyle: const TextStyle(color: Color(0xff403E40))))),
        ],
      )),
    );
  }
}
