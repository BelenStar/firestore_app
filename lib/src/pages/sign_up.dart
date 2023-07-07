//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestone_app/src/models/user_item.dart';
import 'package:firestone_app/src/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  var user = UserLog(firstName: "", lastName: "", email: "", age: 0);

  Future signUp(UserProvider userProvider) async {
    user = UserLog(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        age: int.parse(ageController.text));
    if (passwordValidation()) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .whenComplete(() => Navigator.of(context).pop());
      userProvider.addUserDetails(user);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  passwordValidation() {
    if (passwordController.text == confirmPasswordController.text) {
      return true;
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
      passwordController.clear();
      confirmPasswordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff403E40),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 5),
            const Icon(Icons.menu_book_sharp,
                size: 120, color: Color(0xffBABFD9)),
            const SizedBox(height: 10),
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
              height: 50,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: firstNameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText: 'First Name',
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
            const SizedBox(height: 15),
            SizedBox(
              width: 250,
              height: 50,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: lastNameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText: 'Last Name',
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
            const SizedBox(height: 15),
            SizedBox(
              width: 250,
              height: 50,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Age',
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
            const SizedBox(height: 15),
            SizedBox(
              width: 250,
              height: 50,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: emailController,
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
            const SizedBox(height: 15),
            SizedBox(
              width: 250,
              height: 50,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: passwordController,
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
            const SizedBox(height: 15),
            SizedBox(
              width: 250,
              height: 50,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: confirmPasswordController,
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
              onPressed: () => signUp(usersProvider),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xffBABFD9)),
              ),
              child: Text('Sign Up',
                  style: GoogleFonts.bitter(
                      textStyle: const TextStyle(color: Color(0xff403E40)))),
            ),
            const SizedBox(height: 5),
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
