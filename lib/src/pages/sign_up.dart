import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final age = TextEditingController();

  Future signUp() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.text, password: password.text)
        .whenComplete(() => Navigator.of(context).pop());
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void passwordValidation() {
    if (password.text == confirmPassword.text) {
      signUp();
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color(0xffBABFD9),
            title: Text(
              'Password and Confirmation password not match',
              style: GoogleFonts.bitter(
                  textStyle: const TextStyle(color: Color(0xff403E40))),
            ),
            titleTextStyle: const TextStyle(fontSize: 15, height: 2),
          );
        },
      );
      password.clear();
      confirmPassword.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff403E40),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Icon(Icons.menu_book_sharp,
                size: 120, color: Color(0xffBABFD9)),
            const SizedBox(height: 40),
            Text(
              'Welcome to BookLand',
              style: GoogleFonts.bitter(
                  color: const Color(0xff8F92A6),
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            const SizedBox(height: 10),
            Text(
              'Hey BookLover, what are u waiting? Join us!',
              style: GoogleFonts.bitter(
                  color: const Color(0xff8F92A6), fontSize: 15),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'Email',
                    //errorText: ,
                    labelStyle:
                        GoogleFonts.bitter(color: const Color(0xffE4EAF2)),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Color(0xff262526))),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Color(0xffE4EAF2)))),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle:
                      GoogleFonts.bitter(color: const Color(0xffE4EAF2)),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Color(0xff262526))),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Color(0xffE4EAF2))),
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: confirmPassword,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle:
                      GoogleFonts.bitter(color: const Color(0xffE4EAF2)),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Color(0xff262526))),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Color(0xffE4EAF2))),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: passwordValidation,
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xffBABFD9)),
              ),
              child: Text('Sign Up',
                  style: GoogleFonts.bitter(
                      textStyle: const TextStyle(color: Color(0xff403E40)))),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: GoogleFonts.bitter(
                      textStyle: const TextStyle(color: Color(0Xff8F92A6))),
                ),
                TextButton(
                    onPressed: () => {
                          setState(() {
                            Navigator.pushNamed(context, '/signIn');
                          })
                        },
                    child: Text('Sign In',
                        style: GoogleFonts.bitter(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffE4EAF2)))))
              ],
            )
          ],
        )),
      )),
    );
  }
}
