import 'package:flutter/material.dart';
import 'package:fluttertraining/services/user_posts_service.dart';

class UserPosts extends StatefulWidget {

  const UserPosts({super.key, this.userId = 0});
  final int? userId;

  @override
  State<UserPosts> createState() {
    return _UserPostsState();
  }
}

class _UserPostsState extends State<UserPosts> {

  UserPostsService userPostsService = UserPostsService();
  late int? userId;

  @override
  void initState() {
    super.initState();
    userId = widget.userId!;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.all(5.0),
            child: FutureBuilder(
              future: userPostsService.getUserPosts(userId),
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
                          title: Text(snapshot.data![index].userId.toString(), style: const TextStyle(color: Colors.white),),
                          subtitle: Text(snapshot.data![index].body, style: const TextStyle(color: Colors.black),),
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

