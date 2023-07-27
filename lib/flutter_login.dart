import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grouped_buttons_ns/grouped_buttons_ns.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlutterLogin extends StatefulWidget {
  const FlutterLogin({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<FlutterLogin> {
  String username = "";
  String password = "";
  TextEditingController passwordTextField = TextEditingController();
  TextEditingController usernameTextFiled = TextEditingController();
  List<String> checkedValue = [];
  bool checkedOrNot = false;
  AndroidOptions _androidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  @override
  void initState(){
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    var usernameS = await secureStorage.read(key: 'usernameS', aOptions: _androidOptions()) ?? '';
    var passwordS = await secureStorage.read(key: 'passwordS', aOptions: _androidOptions()) ?? '';
    print("usernameS is $usernameS");
    print("passwordS is $passwordS");
    usernameTextFiled.text = prefs.getString('username') ?? '';
    passwordTextField.text = prefs.getString('password') ?? '';
    setState(() {
      checkedValue = prefs.getStringList('checkedValue') ?? [];
    });
  }

  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    if(checkedValue.isNotEmpty && (checkedValue.first.toLowerCase() == "Remember Me".toLowerCase())) {
      await secureStorage.write(key: 'usernameS', value: usernameTextFiled.text, aOptions: _androidOptions());
      await secureStorage.write(key: 'passwordS', value: passwordTextField.text, aOptions: _androidOptions());
      prefs.setString('username', usernameTextFiled.text);
      prefs.setString('password', passwordTextField.text);
      prefs.setStringList('checkedValue', checkedValue);
      _loadSavedData();
    } else {
      await prefs.remove("username");
      await prefs.remove("password");
      await prefs.remove("checkedValue");
      await secureStorage.deleteAll();
    }
  }

  processText() {
    setState(() {
      password = passwordTextField.text;
      username = usernameTextFiled.text;
    });
    if(username == "samitanjaya.mishra@rolls-royce.com" && password == "password@123") {
      loginAlertBox("Login Successful!");
    } else {
      loginAlertBox("Invalid username/password");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child:
                  Image.asset("images/flutter_image.png", height: 50, width: 50,)
                )
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100, width: 310,
                  child:
                    TextField(
                      onSubmitted: (String inputText) =>
                        setState(() {
                          username = inputText;
                        }),
                      controller: usernameTextFiled,
                      decoration: InputDecoration(
                        hintText: "Username",
                        hintStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.black, width: 0.0)
                        )
                      ),
                    ),
                )
              ],
            ),
            // const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100, width: 310,
                  child:
                    TextField(
                      onSubmitted: (String inputText) =>
                          setState(() {
                            username = inputText;
                          }),
                      controller: passwordTextField,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: const TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.black, width: 0.0)
                          )
                      ),
                    ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CheckboxGroup(labels: const <String>[
                  "Remember me"
                ],
                checked: checkedValue,
                onSelected: (List<String> checked) {
                  setState(() {
                    checkedValue = checked;
                    _saveData();
                  });
                },
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: processText,
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ), child: const Text("Login"),)
              ],
            ),
          ],
        )
    );
  }

  Future loginAlertBox(String? message){
    var alert = showDialog(context: context, barrierDismissible: false ,builder: (BuildContext context) =>
        AlertDialog(
          title: const Text("Alert", style: TextStyle(color: Colors.black),),
          content: Text("$message"),
          backgroundColor: Colors.cyanAccent,
          actions: [
            TextButton(onPressed: () =>
                Navigator.of(context).pop(), child: const Text("Ok", style: TextStyle(color: Colors.black),)
            ),
            TextButton(onPressed: () =>
                Navigator.of(context).pop(), child: const Text("Cancel", style: TextStyle(color: Colors.black),)
            )
          ],
        )
    );
    return alert;
  }
}