import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
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
                  const Icon(
                    Icons.menu_book_sharp,
                    size: 120,
                    color: Color(0xffBABFD9),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Welcome to BookLand',
                    style: GoogleFonts.bitter(
                        textStyle: const TextStyle(
                            color: Color(0xff8F92A6),
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Sign in with your credentials booklover',
                    style: GoogleFonts.bitter(
                        textStyle: const TextStyle(
                            color: Color(0xff8F92A6), fontSize: 15)),
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
                          labelStyle: GoogleFonts.bitter(
                              color: const Color(0xffE4EAF2)),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(color: Color(0xff262526))),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Color(0xffE4EAF2)))),
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: signIn,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xffBABFD9)),
                    ),
                    child: Text('Sign in',
                        style: GoogleFonts.bitter(
                            textStyle:
                                const TextStyle(color: Color(0xff403E40)))),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an account? ',
                        style: GoogleFonts.bitter(
                            textStyle:
                                const TextStyle(color: Color(0Xff8F92A6))),
                      ),
                      TextButton(
                          onPressed: () => {
                                setState(() {
                                  Navigator.pushNamed(context, '/signUp');
                                })
                              },
                          child: Text('Sign Up',
                              style: GoogleFonts.bitter(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffE4EAF2)))))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
