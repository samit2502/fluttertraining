import 'package:flutter/material.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text("Large Text", style: Theme.of(context).textTheme.displayLarge,)
              )
            ],
          ),
          const SizedBox(height: 30.0),
          Row(
            children: [
              Container(
                color: Theme.of(context).colorScheme.secondary,
                child: ElevatedButton(onPressed: (){}, child: const Text("Click Me"),),
              )
            ],
          ),
          const SizedBox(height: 30),
          const Row(
            children: [
              Text("My Custom Fonts", style: TextStyle(fontFamily: 'Schyler', fontSize: 44, color: Colors.red),)
            ],
          )
        ],
      )
    );
  }
}