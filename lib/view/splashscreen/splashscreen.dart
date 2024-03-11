import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/controller/sharedprefcontroller/sharedprefcontroller.dart';
import 'package:recipe_app/view/intropage/intropage.dart';
import 'package:recipe_app/view/bottom_nav/bottom_nav.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Provider.of<SharedPrefController>(context, listen: false).getlogindetails();
    Future.delayed(const Duration(seconds: 2)).then((value) =>
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Provider.of<SharedPrefController>(context).login == true
                        ? const BottomNav()
                        : const IntroPage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "Recipee",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}
