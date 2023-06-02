import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
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
                child: ListView.builder(
                  itemCount: 2,
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
                                title: const Text('Zookeeper'),
                                trailing: const Text('3/5'),
                                subtitle: const Text('Drama'),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(15.5)))));
                  },
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
