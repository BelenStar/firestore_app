import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final name = TextEditingController();
  final genre = TextEditingController();
  final rating = TextEditingController();

  Future addBook() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff403E40),
      appBar: AppBar(
        title: const Text('New Book'),
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
              'Tell us about the new book',
              style: GoogleFonts.bitter(
                  textStyle:
                      const TextStyle(color: Color(0xff8F92A6), fontSize: 15)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: name,
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
          ),
          const SizedBox(height: 10),
          TextField(
              controller: genre,
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
              )),
          const SizedBox(height: 10),
          TextField(
              controller: rating,
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
              )),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                //CREATE BOOK MODEL
                /* final book_name = name.text;
                final book_genre = genre.text;
                final book_rating = rating.text;

                addBook(
                    name: book_name, rating: book_rating, genre: book_genre); */
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xffBABFD9)),
              ),
              child: Text('Add Book',
                  style: GoogleFonts.bitter(
                      textStyle: const TextStyle(color: Color(0xff403E40))))),
        ],
      )),
    );
  }
}
