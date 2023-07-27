import 'package:flutter/material.dart';
import 'package:fluttertraining/services/users_service.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() {
    return _UsersPage();
  }
}

class _UsersPage extends State<UsersPage> {

  UsersService users = UsersService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.all(5.0),
            child: FutureBuilder(
              future: users.getUsers(),
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
                          title: Text(snapshot.data![index].name, style: const TextStyle(color: Colors.white),),
                          subtitle: Text(snapshot.data![index].address.city, style: const TextStyle(color: Colors.black),),
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

