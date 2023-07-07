import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestone_app/src/models/user_item.dart';
import 'package:firestone_app/src/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
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
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.account_circle_sharp,
                  size: 100, color: Color(0xffBABFD9)),
              Text('This is your personal information',
                  style: GoogleFonts.bitter(
                      textStyle: const TextStyle(
                          color: Color(0xff8F92A6), fontSize: 15))),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: StreamBuilder<List<UserLog>>(
                      stream: userProvider.getUserDetails(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Card(
                                      elevation: 15,
                                      shadowColor: Colors.black,
                                      child: ListTile(
                                        leading: const Icon(
                                          Icons.person,
                                          size: 30,
                                        ),
                                        title: Text(
                                          snapshot.data![index].firstName,
                                          style: GoogleFonts.bitter(
                                              textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        subtitle: Text(
                                          'First Name',
                                          style: GoogleFonts.bitter(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.5)),
                                      )),
                                  Card(
                                      elevation: 15,
                                      shadowColor: Colors.black,
                                      child: ListTile(
                                        leading: const Icon(
                                          Icons.person,
                                          size: 30,
                                        ),
                                        title: Text(
                                          snapshot.data![index].lastName,
                                          style: GoogleFonts.bitter(
                                              textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        subtitle: Text(
                                          'Last Name',
                                          style: GoogleFonts.bitter(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.5)),
                                      )),
                                  Card(
                                      elevation: 15,
                                      shadowColor: Colors.black,
                                      child: ListTile(
                                        leading: const Icon(
                                          Icons.cake,
                                          size: 30,
                                        ),
                                        title: Text(
                                          (snapshot.data![index].age)
                                              .toString(),
                                          style: GoogleFonts.bitter(
                                              textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        subtitle: Text(
                                          'Age',
                                          style: GoogleFonts.bitter(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.5)),
                                      )),
                                  Card(
                                      elevation: 10,
                                      shadowColor: Colors.black,
                                      child: ListTile(
                                        leading: const Icon(
                                          Icons.alternate_email_sharp,
                                          size: 30,
                                        ),
                                        title: Text(
                                          snapshot.data![index].email,
                                          style: GoogleFonts.bitter(
                                              textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        subtitle: Text(
                                          'Email',
                                          style: GoogleFonts.bitter(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.5)),
                                      ))
                                ],
                              );
                            },
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      })),
            ],
          ),
        )),
      ),
    );
  }
}
