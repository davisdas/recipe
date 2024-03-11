import 'dart:convert';

List<RecipeModel> recipeModelFromJson(String str) => List<RecipeModel>.from(json.decode(str).map((x) => RecipeModel.fromJson(x)));

String recipeModelToJson(List<RecipeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecipeModel {
    int? id;
    String? picture;
    String? title;
    String? desc;
    String? cookTime;
    List<String>? ingredients;
    List<String>? procedure;
    int? author;
    String? username;
    int? totalNumberOfLikes;
    int? totalNumberOfComments;
    int? totalNumberOfBookmarks;

    RecipeModel({
        this.id,
        this.picture,
        this.title,
        this.desc,
        this.cookTime,
        this.ingredients,
        this.procedure,
        this.author,
        this.username,
        this.totalNumberOfLikes,
        this.totalNumberOfComments,
        this.totalNumberOfBookmarks,
    });

    factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        id: json["id"],
        picture: json["picture"],
        title: json["title"],
        desc: json["desc"],
        cookTime: json["cook_time"],
        ingredients: json["ingredients"] == null ? [] : List<String>.from(json["ingredients"]!.map((x) => x)),
        procedure: json["procedure"] == null ? [] : List<String>.from(json["procedure"]!.map((x) => x)),
        author: json["author"],
        username: json["username"],
        totalNumberOfLikes: json["total_number_of_likes"],
        totalNumberOfComments: json["total_number_of_comments"],
        totalNumberOfBookmarks: json["total_number_of_bookmarks"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "picture": picture,
        "title": title,
        "desc": desc,
        "cook_time": cookTime,
        "ingredients": ingredients == null ? [] : List<dynamic>.from(ingredients!.map((x) => x)),
        "procedure": procedure == null ? [] : List<dynamic>.from(procedure!.map((x) => x)),
        "author": author,
        "username": username,
        "total_number_of_likes": totalNumberOfLikes,
        "total_number_of_comments": totalNumberOfComments,
        "total_number_of_bookmarks": totalNumberOfBookmarks,
    };
}
