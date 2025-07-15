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
      backgroundColor: Colors.grey.shade100,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 15,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: GNav(
              gap: 10,
              backgroundColor: Colors.white,
              color: Colors.grey[600],
              activeColor: Colors.white,
              tabBackgroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              selectedIndex: _selectedIndex,
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 300),
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.home_rounded,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.pie_chart_rounded,
                  text: 'Chart',
                ),
                GButton(
                  icon: Icons.person_rounded,
                  text: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
