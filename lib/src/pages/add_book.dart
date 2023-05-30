import 'package:flutter/material.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final name = TextEditingController();
  final rating = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Book')),
      body: Center(
          child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          TextField(
            controller: name,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(label: Text('Name')),
          ),
          const SizedBox(height: 10),
          TextField(
              controller: rating,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0))))),
          ElevatedButton(onPressed: () {}, child: const Text('Add Book')),
        ],
      )),
    );
  }
}
