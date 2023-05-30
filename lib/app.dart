import 'package:firestone_app/src/auth/auth.dart';
import 'package:firestone_app/src/pages/sign_up.dart';
import 'package:flutter/material.dart';

import 'src/pages/add_book.dart';
import 'src/pages/home.dart';
import 'src/pages/library.dart';
import 'src/pages/main_page.dart';
import 'src/pages/sign_in.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      routes: <String, WidgetBuilder>{
        '/signIn': (context) => const SignInPage(),
        '/signUp': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
        '/main': (context) => const MainPage(),
        '/library': (context) => const LibraryPage(),
        '/addBook': (context) => const AddBookPage(),
      },
    );
  }
}
