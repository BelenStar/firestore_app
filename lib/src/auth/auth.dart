import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestone_app/src/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'logs.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //return const HomePage();
            return const MainPage();
          } else {
            return const LogsPage();
          }
        },
      ),
    );
  }
}
