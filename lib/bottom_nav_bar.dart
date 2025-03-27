import 'package:flutter/material.dart';
import 'package:google_solution_challenge/settingsPage.dart';
import 'package:google_solution_challenge/SOS/sosPage.dart';

import 'HomePage.dart';
import 'medicalIdPage.dart';

class BottomNavBarPage extends StatefulWidget {
  final String fullname;
  BottomNavBarPage({super.key, required this.fullname});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int selectedIndex = 0;

  void onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(),
      MedicalIdPage(fullname: widget.fullname),
      SOSPage(),
      SettingsPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: onItemSelected,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 25),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_information_outlined, size: 25),
            label: 'Medical ID',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sos_outlined, size: 25),
            label: 'SOS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined, size: 25),
            label: 'Settings',
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
