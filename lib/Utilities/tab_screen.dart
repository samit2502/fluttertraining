import 'package:flutter/material.dart';
import 'package:fluttertraining/flutter_login.dart';
import 'package:fluttertraining/user_posts.dart';
import 'package:fluttertraining/users_page.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Tab View'),
          ),
          body: const DefaultTabController(
            length: 3,
            child: Column(
              children: <Widget>[
                TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.blueAccent,
                  indicatorColor: Colors.redAccent,
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial',
                      fontSize: 20.0),
                  tabs: [
                    Tab(text: "Network"),
                    Tab(text: "First"),
                    Tab(text: "Second")
                  ],
                ),
                Expanded(
                  child: TabBarView(
                      children: [FlutterLogin(), UsersPage(), UserPosts()]),
                )
              ],
            ),
          )),
    );
  }
}
