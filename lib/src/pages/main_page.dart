import 'package:firestone_app/src/pages/home.dart';
import 'package:firestone_app/src/pages/library.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int currentPageIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const LibraryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.bookmark_add_outlined), label: 'Library'),
            NavigationDestination(
                icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
        appBar: AppBar(),
        body: _pages[currentPageIndex]);
  }
}
