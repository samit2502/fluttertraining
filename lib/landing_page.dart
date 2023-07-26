import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(205, 193, 255, 1.0),
                    Color.fromARGB(255, 252, 99, 99),
                    Color.fromARGB(255, 173, 41, 1),
                  ],
                )
            ),
            child: const Center(
                child: Text("Hello World", textDirection: TextDirection.ltr,
                  style: TextStyle(fontSize: 28, color: Colors.white),)
            )
        )
    );
  }
}