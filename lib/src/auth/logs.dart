import 'package:flutter/material.dart';

import '../pages/sign_in.dart';
import '../pages/sign_up.dart';

class LogsPage extends StatefulWidget {
  const LogsPage({super.key});

  @override
  State<LogsPage> createState() => _LogsPage();
}

class _LogsPage extends State<LogsPage> {
  bool showSignInPage = true;

  @override
  Widget build(BuildContext context) {
    if (showSignInPage) {
      return const SignInPage();
    } else {
      return const SignUpPage();
    }
  }
}
