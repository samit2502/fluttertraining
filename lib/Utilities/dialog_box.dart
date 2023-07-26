import 'package:flutter/material.dart';

class AlertDialogBox extends StatelessWidget {
  const AlertDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () =>
      showDialog(context: context, barrierDismissible: false ,builder: (BuildContext context) =>
          AlertDialog(
          title: const Text("Alert", style: TextStyle(color: Colors.white),),
          content: SizedBox(
            height: 100,
            width: 100,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Image.asset("images/test_image.png", height: 50, width: 50,))
                  ],
                ),
                const Row(
                  children: [
                    Expanded(child: Text("This is a sample alert"))
                  ],
                )
              ],
            ),
          ),
          backgroundColor: Colors.deepPurpleAccent,
          actions: [
            TextButton(onPressed: () =>
              Navigator.of(context).pop(), child: const Text("Ok", style: TextStyle(color: Colors.white),)
            ),
            TextButton(onPressed: () =>
              Navigator.of(context).pop(), child: const Text("Cancel", style: TextStyle(color: Colors.white),)
            )
          ],
        )
      ),
        child: const Text("Show Dialog"),
    );
  }
}