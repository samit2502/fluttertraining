import 'package:flutter/material.dart';
import 'package:fluttertraining/landing_page.dart';
import 'package:fluttertraining/user_posts.dart';
import 'package:fluttertraining/users_page.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() {
    return _NavigationBarPage();
  }
}

class _NavigationBarPage extends State<NavigationBarPage> {

  int myCurrentIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    LandingPage(),
    UsersPage(),
    UserPosts(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      myCurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(myCurrentIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myCurrentIndex,
        iconSize: 30,
        selectedFontSize: 20,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: Colors.cyan,
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.verified_user),
              backgroundColor: Colors.cyan,
              label: "Users"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.post_add),
              backgroundColor: Colors.cyan,
              label: "Posts"
          ),
        ],
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }
}

