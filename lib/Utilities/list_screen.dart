import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // child: getListView(),
        child: getLongListView(),
      )
    );
  }

  Widget getListView() {
    var listView = ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.accessibility),
          title: const Text("List Title 1"),
          subtitle: const Text("List Subtitle 1"),
          trailing: const Icon(Icons.access_alarm),
          onTap: () => print("List 1 Clicked!"),
        ),
        ListTile(
          leading: const Icon(Icons.accessibility),
          title: const Text("List Title 2"),
          subtitle: const Text("List Subtitle 2"),
          trailing: const Icon(Icons.access_alarm),
          onTap: () => print("List 2 Clicked!"),
        ),
        ListTile(
          leading: const Icon(Icons.accessibility),
          title: const Text("List Title 3"),
          subtitle: const Text("List Subtitle 3"),
          trailing: const Icon(Icons.access_alarm),
          onTap: () => print("List 3 Clicked!"),
        ),
      ],
    );
    return listView;
  }

  List<String> getListItems() {
    var items = List<String>.generate(100, (counter) => "item is $counter");
    return items;
  }

  Widget getLongListView() {
    var listItems = getListItems();
    var listView = ListView.builder(itemCount: listItems.length, itemBuilder: (context, index) =>
        ListTile(
          title: Text(listItems[index]),
          onTap: () =>
              // print("selected ${listItems[index]}")
              showDialog(context: context, barrierDismissible: false ,builder: (BuildContext context) =>
                  AlertDialog(
                    title: const Text("Alert", style: TextStyle(color: Colors.white),),
                    content: Text("Selected ${listItems[index]}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
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
              )
      ),
    );
    return listView;
  }
}