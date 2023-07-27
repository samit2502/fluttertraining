import 'dart:convert';
import 'package:fluttertraining/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertraining/constants/constants.dart';

class UsersService {
  Future<List<Users>> getUsers() async {
    final response = await http.get(Uri.parse(getUsersUrl));
    var responseBody = json.decode(response.body);

    //Creating a list to store the response body
    List<Users> users = [];
    for(var singleUser in responseBody) {
      Users user = Users(
          id: singleUser["id"],
          name: singleUser["name"],
          email: singleUser["email"],
          address: Address(
            street: singleUser["address"]["street"],
            suite: singleUser["address"]["suite"],
            city: singleUser["address"]["city"],
            zipcode: singleUser["address"]["zipcode"],
            geo: Geo(
              lat: singleUser["address"]["geo"]["lat"],
              lng: singleUser["address"]["geo"]["lng"],
            )
          ),
          phone: singleUser["phone"],
          website: singleUser["website"],
          company: Company(
            name: singleUser["company"]["name"],
            catchPhrase: singleUser["company"]["catchPhrase"],
            bs: singleUser["company"]["bs"]
          ),
      );
      users.add(user);
    }
    return users;
  }
}