import 'package:flutter/material.dart';

class ChefDetails extends StatefulWidget {
  const ChefDetails({super.key});
  @override
  State<ChefDetails> createState() => _ChefDetailsState();
}

class _ChefDetailsState extends State<ChefDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  maxRadius: 50,
                  child: Icon(
                    Icons.person,
                    size: 60,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Name',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Container(
            color: Colors.grey.shade100,
            height: 560,
            width: double.infinity,
            child: const Column(
              children: [
                Text(
                  'created Recipes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.orange,
                  ),
                ),

                // ListView.builder(
                //   scrollDirection: Axis.vertical,
                //   itemCount: 6,
                //   itemBuilder: (context, index) => Container(
                //     height: 50,
                //     color: Colors.red,
                //   ),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
