import 'package:flutter/material.dart';

import 'blogs.dart';
import '../home.dart';
import 'ngo_maps.dart';
import 'settings.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int selectedPageIndex = 0;

  final List<String> _pageTitles = ['Home', 'Local NGOs', 'Blogs', 'Settings'];

  final List<Widget> _pages = [
    const HomePage(),
    const NgoMaps(),
    const Blogs(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitles[selectedPageIndex]),
        backgroundColor: Colors.green.shade100,
        elevation: 1,
        automaticallyImplyLeading: false,
      ),
      body: _pages[selectedPageIndex],
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 500),
        height: 75,
        selectedIndex: selectedPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.location_on),
            icon: Icon(Icons.location_on_outlined),
            label: 'Local NGOs',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.book),
            icon: Icon(Icons.book_outlined),
            label: 'Blogs',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
