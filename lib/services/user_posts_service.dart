import 'dart:convert';
import 'package:fluttertraining/models/user_post_model.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertraining/constants/constants.dart';

class UserPostsService {
  Future<List<Users>> getUserPosts() async {
    final response = await http.get(Uri.parse(userPostsUrl));
    var responseBody = json.decode(response.body);

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
}