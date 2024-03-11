import 'package:flutter/material.dart';
import 'package:recipe_app/view/explore_page/explore_page.dart';
import 'package:recipe_app/view/homescreen/homepage.dart';
import 'package:recipe_app/view/favourite_page/favourite_page.dart';
import 'package:recipe_app/view/list_screen/list_screen.dart';
import 'package:recipe_app/view/planner_screen/planner_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  List screens = [
    const HomePage(),
    const ExplorePage(),
    const favoratePage(),
    const PlannerScreen(),
    const ListPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() => currentIndex = value);
          },
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.orange,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_add_outlined,
                size: 30,
              ),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today_outlined,
                size: 30,
              ),
              label: 'planner',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list_alt,
                size: 30,
              ),
              label: 'Lists',
            ),
          ]),
    );
  }
}
