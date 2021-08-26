import 'package:cric_addict/pages/book_ticket.dart';
import 'package:cric_addict/pages/home_page.dart';
import 'package:cric_addict/pages/map_page.dart';
import 'package:cric_addict/pages/profile_page.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    BookTicket(),
    MapPage(),
    ProfilePage()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.mail,
              color: Colors.black,
            ),
            title: Text('Book Tickets'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.navigation,
              color: Colors.black,
            ),
            title: Text('Map'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text('Profile')),
        ],
      ),
    );
  }
}
