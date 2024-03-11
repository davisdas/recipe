import 'package:flutter/material.dart';
import 'package:recipe_app/controller/shopping_listcontroller.dart';
import 'package:recipe_app/widgets/itemlist.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<ListPage> {
  ShoppingController obj = ShoppingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ItemList())),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
        body: Container(
          // color: Colors.grey,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shopping List',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
