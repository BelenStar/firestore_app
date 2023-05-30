import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Library'),
        leading: Icon(Icons.auto_stories_rounded),
        actions: [
          IconButton(
              onPressed: () => {
                    setState(() {
                      Navigator.pushNamed(context, '/addBook');
                    })
                  },
              icon: Icon(Icons.add_box_rounded))
        ],
      ),
      backgroundColor: Color(0xff403E40),
      body: Text('Building'),
    );
  }
}
