import 'package:flutter/material.dart';
import 'dart:math';
import 'Utilities/dialog_box.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        // color: Colors.blueAccent,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Container(height: 50.0, color: Colors.green,
                  child: const Text("Row 1", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),))
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Expanded(child: Container(height: 50.0, color: Colors.limeAccent,
                  child: const Text("Row 2", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),))
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Column(
                  children: [
                    Container(height: 50.0, color: Colors.blueAccent,),
                    Container(height: 50.0, color: Colors.redAccent,)
                  ],
                )),
                Expanded(child: Container(height: 100.0, color: Colors.amberAccent,))
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                RandomText()
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Expanded(child: Container(height: 50.0, color: Colors.deepPurpleAccent,
                  child: Text("Row 2 Random Text: ${getRandomNumber()}", style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),))
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Expanded(child: Image.asset("images/test_image.png", height: 100, width: 100,))
              ],
            ),
            const SizedBox(height: 20,),
            const Row(
              children: [
                  AlertDialogBox()
              ],
            ),
          ],
        )
      ),
    );
  }
}

class RandomText extends StatelessWidget {
  const RandomText({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Text("Text by calling a class",
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueGrey),);
  }
}

int getRandomNumber() {
  var randomNumber = Random();
  return randomNumber.nextInt(100);
}