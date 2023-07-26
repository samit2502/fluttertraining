import 'package:flutter/material.dart';

class AlignItems extends StatelessWidget {
  const AlignItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Container(
        //       color: Colors.deepPurpleAccent,
        //       margin: const EdgeInsets.all(20),
        //       height: 100,
        //       width: 100,
        //     ),
        //     Container(
        //       color: Colors.blueGrey,
        //       margin: const EdgeInsets.all(20),
        //       height: 200,
        //       width: 100,
        //     ),
        //     Container(
        //       color: Colors.amberAccent,
        //       margin: const EdgeInsets.all(20),
        //       height: 300,
        //       width: 50,
        //     )
        //   ],
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.deepPurpleAccent,
              margin: const EdgeInsets.all(20),
              height: 100,
              width: 100,
              child: const Text("Hello"),
            ),
            Container(
              color: Colors.blueGrey,
              margin: const EdgeInsets.all(20),
              height: 100,
              width: 150,
            ),
            Container(
              color: Colors.amberAccent,
              margin: const EdgeInsets.all(20),
              height: 100,
              width: 200,
            )
          ],
        ),
      ),
    );
  }
}