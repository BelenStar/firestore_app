import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff403E40),
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: GoogleFonts.bitter(
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        actions: [
          IconButton(
            onPressed: () => {
              setState(() {
                FirebaseAuth.instance.signOut();
              })
            },
            icon: const Icon(Icons.logout_rounded),
            iconSize: 30,
          )
        ],
        backgroundColor: const Color(0xffBABFD9),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.account_circle_sharp,
              size: 100, color: Color(0xff8F92A6)),
          Text('Welcome back ${user?.email}'),
          ElevatedButton(
              onPressed: () => {
                    setState(() {
                      FirebaseAuth.instance.signOut();
                    })
                  },
              child: const Text('Sign out')),
        ],
      )),
    );
  }
}
