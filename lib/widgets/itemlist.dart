import 'package:flutter/material.dart';
import 'package:recipe_app/controller/shopping_listcontroller.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  var items = [
    'egg',
    'chicken',
    'fish',
    'milk',
    'bread',
  ];
  var obj = ShoppingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        // width: 300,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.add,
                                size: 28,
                                color: Colors.orange,
                              ),
                              hintText: 'Add item',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 18)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text(
                        'Done',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Popular items',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) => Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => obj.add(items[index]),
                          child: Card(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                                Text(
                                  items[index],
                                  style: const TextStyle(fontSize: 24),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
