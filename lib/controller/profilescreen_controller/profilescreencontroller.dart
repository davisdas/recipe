import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:recipe_app/apiservices/api_services.dart';
import 'package:recipe_app/model/recipiemodel/recipiemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreenController extends ChangeNotifier {
  var apiservicesobj = ApiServices();

  var myrecipies;
  getrecipe() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var responsedate =
        await apiservicesobj.httpget("api/recipe/my-recipes", token);
    var decodedata = jsonDecode(responsedate);
    myrecipies = decodedata.map((e) => RecipeModel.fromJson(e)).toList();
    notifyListeners();
  }
}
