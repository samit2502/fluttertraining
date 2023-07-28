import 'package:flutter/material.dart';
// 1. snack bar  2. custom fonts
class SnackBarWid extends StatefulWidget {
  const SnackBarWid({Key? key}) : super(key: key);

  @override
  State<SnackBarWid> createState() => _SnackBarWidState();
}

class _SnackBarWidState extends State<SnackBarWid> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SnackBar"), backgroundColor: Colors.black26,),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(onPressed: (){
                  final snackBar = SnackBar(
                    content: const Text('Snackbar Message',
                        style:TextStyle(fontFamily: 'Angelina', fontSize: 25, color: Colors.red) ),
                    action: SnackBarAction(
                      label: 'CLICK ME',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );

                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }, child: const Text("Show Message"))
              ],
            ),
            const SizedBox(height: 30,),
            const Row(),
          ],
        ),
      ),
    );
  }
}