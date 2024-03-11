import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/view/bottom_nav/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recipe_app/view/loginregister/loginscreen.dart';

class ApiServices {
  // var obj = SharedPrefController();
  var baseurl = 'http://10.0.2.2:8000/';

  //// user login
  void login(
      {required String username,
      required String password,
      required var context}) async {
    var url = Uri.parse("$baseurl/api/user/login/");
    var response =
        await http.post(url, body: {"email": username, "password": password});
    Map jsonresponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      var token = jsonresponse['tokens']['access'];
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      prefs.setBool('login', true);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNav(),
          ),
          (route) => false);
    }
  }

  // userregister
  void register(
      {required var context,
      required String username,
      required String email,
      required String password}) async {
    var url = Uri.parse("$baseurl/getusers/");
    // try {
    var response = await http.post(url, body: {
      "username": username,
      "email": email,
      "password": password,
    });
    // print(response.body);
    var jsonresponse = jsonDecode(response.body);
    // print(response.statusCode);
    // print(response.body);
    //  List? usernames = jsonresponse["email"];
    if (response.statusCode == 201) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("registration success")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text("${jsonresponse['email'][0]} ${jsonresponse['username']}")));
      //   }
      // } catch (e) {
      //   // print(e);
    }
  }

  //  get using token

  httpget(String endurl, var token) async {
    var url = Uri.parse('$baseurl/$endurl/');
    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});
    var responsedata = response.body;
    // print(responsedata);
    return responsedata;
  }

  // post using token
  httppost(String endurl, var token, var data) async {
    var url = Uri.parse('$baseurl/$endurl/');
    var response = await http.post(url,
        headers: {'Authorization': 'Bearer $token'}, body: data);
    print(response.statusCode);

    // var responsedata = response.body;
    // print(responsedata);
  }

  // put using token
  httpput(
      {required String endurl,
      required var token,
      required Map data,
      required int id}) async {
    var url = Uri.parse('$baseurl/$endurl/$id/');
    await http.put(url,
        headers: {'Authorization': 'Bearer $token'}, body: data);
  }

  // delete using token
  httpdelete(String endurl, var token, int id) async {
    var url = Uri.parse('$baseurl/$endurl/$id/');

    await http.delete(url, headers: {'Authorization': 'token $token'});
  }
}
