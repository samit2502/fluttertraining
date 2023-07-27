import 'dart:convert';
import 'package:fluttertraining/constants/constants.dart';
import 'package:fluttertraining/models/user_post_model.dart';
import 'package:http/http.dart' as http;

class UserPostsService {
  Future<List<UserPosts>> getUserPosts(int userId) async {
    final response = await http.get(Uri.parse(getUserPostsUrl).replace(query: 'userId=$userId'));
    var responseBody = json.decode(response.body);

    //Creating a list to store the response body
    List<UserPosts> users = [];
    for(var singleUser in responseBody) {
      UserPosts user = UserPosts(
          id: singleUser["id"],
          userId: singleUser["userId"],
          title: singleUser["title"],
          body: singleUser["body"]
      );
      users.add(user);
    }
    return users;
  }
}