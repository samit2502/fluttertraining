import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  String username = "";
  String password = "";
  TextEditingController passwordTextField = TextEditingController();

  processText() {
    setState(() {
      password = passwordTextField.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                    onChanged: (String inputText) =>
                        setState(() {
                          username = inputText;
                        })
                ),
              )
            ],
          ),
          const SizedBox(height: 30,),
          Row(
            children: [
              Expanded(
                child: Text("Username is $username", style: const TextStyle(fontSize: 20),)
              )
            ],
          ),
          const SizedBox(height: 30,),
          Row(
            children: [
              Expanded(child: TextField(controller: passwordTextField, obscureText: true,)
              )
            ],
          ),
          const SizedBox(height: 30,),
          Row(
            children: [
              ElevatedButton(onPressed: processText, child: const Text("Click Me!"))
            ],
          ),
          const SizedBox(height: 30,),
          Row(
            children: [
              Expanded(
                  child: Text("password is $password", style: const TextStyle(fontSize: 20),)
              )
            ],
          ),
        ],
      )
    );
  }
}