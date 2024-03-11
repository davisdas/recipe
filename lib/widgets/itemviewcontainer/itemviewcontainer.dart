import 'dart:io';

import 'package:flutter/material.dart';

class ItemviewContainer extends StatelessWidget {
  const ItemviewContainer({
    super.key,
    required this.image,
    required this.title,
    required this.username,
  });
  // final String profilepic
  final String image;
  final String title;
  final String username;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 232, 229, 229)
          // color: Colors.blue,
          ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://tse1.mm.bing.net/th?id=OIP.vN2hhBBkpLnxnvmMHXLk5gHaE8&pid=Api&P=0&h=180"),
            ),
            subtitle: Text(
              "By $username",
              style: const TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
            ),
            title: Text(
              title,
              style: const TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.width * .70,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.contain),
                borderRadius: BorderRadius.circular(20)),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    child: Row(
                  children: [
                    Icon(
                      Icons.favorite_outline,
                      size: 30,
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 30,
                    ),
                  ],
                )),
                Icon(
                  Icons.bookmark_outline,
                  size: 30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
