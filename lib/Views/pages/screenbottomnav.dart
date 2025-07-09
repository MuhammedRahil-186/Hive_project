import 'package:first_project_hive/Views/pages/screenhome.dart';
import 'package:first_project_hive/Views/pages/screenpiechart.dart';
import 'package:first_project_hive/Views/pages/screenprofile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ScreenBottomnav extends StatefulWidget {
  const ScreenBottomnav({super.key});

  @override
  State<ScreenBottomnav> createState() => _ScreenBottomnavState();
}

class _ScreenBottomnavState extends State<ScreenBottomnav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
     Screenhome(),
     Screenpiechart(),
     Screenprofile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 10,
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          gap: 8,
          backgroundColor: Colors.white,
          activeColor: Colors.white,
          color: Colors.blueAccent,
          tabBackgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.pie_chart,
              text: 'Chart',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
