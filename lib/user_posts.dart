import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertraining/models/user_post_model.dart';
import 'package:fluttertraining/constants/constants.dart';

class UserPosts extends StatefulWidget {
  const UserPosts({super.key});

  @override
  State<UserPosts> createState() {
    return _UserPostsState();
  }
}

class _UserPostsState extends State<UserPosts> {

  @override
  void initState() {
    super.initState();
    getUserPosts();
  }

  Future<List<Users>> getUserPosts() async {
    final response = await http.get(Uri.parse(userPostsUrl));
    var responseBody = json.decode(response.body);
    print(response.body);

    //Creating a list to store the response body
    List<Users> users = [];
    for(var singleUser in responseBody) {
      Users user = Users(
        id: singleUser["id"],
        userId: singleUser["userId"],
        title: singleUser["title"],
        body: singleUser["body"]
      );
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.all(5.0),
            child: FutureBuilder(
              future: getUserPosts(),
              builder: (ctx, snapshot) {
                if(snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (ctx, index) => Card(
                        margin: const EdgeInsets.all(10),
                        color: Colors.lightGreen,
                        elevation: 5,
                        child: ListTile(
                          title: Text(snapshot.data![index].title),
                          subtitle: Text(snapshot.data![index].body),
                          contentPadding: const EdgeInsets.only(bottom: 20.0),
                        ),
                      )
                  );
                }
              },
            ),
          ),
        )
    );
  }
}

