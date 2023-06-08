import 'package:firestone_app/src/models/library_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/book_provider.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  _shopUpdateDeleteOptions(Book book) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Actions',
                  style: GoogleFonts.bitter(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
              actions: [
                MaterialButton(
                    onPressed: () => {
                          setState(() {
                            Navigator.pushNamed(context, '/editBook',
                                arguments: book);
                          })
                        },
                    child: Text('Edit book',
                        style: GoogleFonts.bitter(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)))),
                MaterialButton(
                    onPressed: () {},
                    child: Text('Delete book',
                        style: GoogleFonts.bitter(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400))))
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<LibraryProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff403E40),
      appBar: AppBar(
        title: Text(
          'My Library',
          style: GoogleFonts.bitter(
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        backgroundColor: const Color(0xffBABFD9),
        leading: const Icon(Icons.auto_stories_rounded),
        actions: [
          IconButton(
              onPressed: () => {
                    setState(() {
                      Navigator.pushNamed(context, '/addBook');
                    })
                  },
              icon: const Icon(Icons.add_box_rounded))
        ],
      ),
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                height: MediaQuery.of(context).size.height * 0.767,
                child: StreamBuilder<List<Book>>(
                    stream: bookProvider.getBooks(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, int index) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Card(
                                    elevation: 15,
                                    shadowColor: Colors.black,
                                    child: ListTile(
                                      leading: const Icon(
                                        Icons.auto_stories_rounded,
                                        size: 40,
                                      ),
                                      title: Text(snapshot.data![index].name),
                                      trailing: Text(
                                          '★ ${snapshot.data![index].rating}/5'),
                                      subtitle:
                                          Text(snapshot.data![index].genre),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.5)),
                                      onLongPress: () {
                                        _shopUpdateDeleteOptions(
                                            snapshot.data![index]);
                                      },
                                    )));
                          },
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              )
            ],
          ),
        )),
      ),
    );
  }
}
