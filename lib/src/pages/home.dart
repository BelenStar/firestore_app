import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Welcome back ${user?.email}'),
          ElevatedButton(
              onPressed: () => {
                    setState(() {
                      FirebaseAuth.instance.signOut();
                    })
                  },
              child: const Text('Sign out'))
        ],
      )),
    );
  }
}