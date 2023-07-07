import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestone_app/src/providers/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<LibraryProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff403E40),
      appBar: AppBar(
          backgroundColor: const Color(0xffBABFD9),
          title: Text(
            'Your Home',
            style: GoogleFonts.bitter(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          )),
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome back!!!',
                  style: GoogleFonts.bitter(
                      textStyle: const TextStyle(
                          color: Color(0xff8F92A6), fontSize: 15))),
              SizedBox(
                height: 60,
                width: 250,
                child: Card(
                    child: ListTile(
                  leading: const Icon(Icons.library_books_rounded),
                  title: Text('Books added:',
                      style: GoogleFonts.bitter(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))),
                  trailing: Text('${bookProvider.getBooksAddedCount}'),
                )),
              ),
              ElevatedButton(
                  onPressed: () => {
                        setState(() {
                          FirebaseAuth.instance.signOut();
                        })
                      },
                  child: const Text('Sign out')),
            ],
          ),
        )),
      ),
    );
  }
}
