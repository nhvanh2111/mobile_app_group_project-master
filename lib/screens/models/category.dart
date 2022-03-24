// import 'package:flutter/material.dart';

// class Category {
//   final String icon, title;

//   Category({required this.icon, required this.title});
// }

// List<Category> demo_categories = [
//   Category(
//     icon: "assets/icons/Tshirt.svg",
//     title: "Gifts",
//   ),
//   Category(
//     icon: "assets/icons/Tshirt.svg",
//     title: "Jewelry",
//   ),
//   Category(
//     icon: "assets/icons/Tshirt.svg",
//     title: "Souvenirs",
//   ),
//   Category(
//     icon: "assets/icons/Tshirt.svg",
//     title: "Food",
//   ),
//   Category(
//     icon: "assets/icons/Tshirt.svg",
//     title: "Food",
//   ),
//   Category(
//     icon: "assets/icons/Tshirt.svg",
//     title: "Food",
//   ),
//   Category(
//     icon: "assets/icons/Tshirt.svg",
//     title: "Food",
//   ),
//   Category(
//     icon: "assets/icons/Tshirt.svg",
//     title: "Food",
//   ),
// ];

// To parse this JSON data, do
//
//     final category = categoryFromMap(jsonString);

// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.categoryName,
  });

  String categoryName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        categoryName: json["categoryName"],
      );

  Map<String, dynamic> toJson() => {
        "categoryName": categoryName,
      };
}
