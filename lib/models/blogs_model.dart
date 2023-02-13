// To parse this JSON data, do
//
//     final blogsModel = blogsModelFromJson(jsonString);

import 'dart:convert';

List<BlogsModel> blogsModelFromJson(String str) => List<BlogsModel>.from(json.decode(str).map((x) => BlogsModel.fromJson(x)));

String blogsModelToJson(List<BlogsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlogsModel {
    BlogsModel({
        required this.title,
        required this.image,
        required this.desc,
        required this.author,
        required this.link,
    });

    String title;
    String image;
    String desc;
    String author;
    String link;

    factory BlogsModel.fromJson(Map<String, dynamic> json) => BlogsModel(
        title: json["title"],
        image: json["image"],
        desc: json["desc"],
        author: json["author"],
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "desc": desc,
        "author": author,
        "link": link,
    };
}
