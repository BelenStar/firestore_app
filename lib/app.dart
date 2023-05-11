import 'package:firestone_app/src/pages/sign_up.dart';
import 'package:flutter/material.dart';

import 'src/pages/sign_in.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignInPage(),
      routes: <String, WidgetBuilder>{
        'signIn': (context) => const SignInPage(),
        'signUp': (context) => const SignUpPage(),
      },
    );
  }
}
