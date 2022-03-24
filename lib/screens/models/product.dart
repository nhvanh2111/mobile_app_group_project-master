// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<Data> data;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        status: json["status"],
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    required this.content,
    required this.pageable,
    required this.last,
    required this.totalPages,
    required this.totalElements,
    required this.numberOfElements,
    required this.size,
    required this.number,
    required this.sort,
    required this.first,
    required this.empty,
  });

  List<Content> content;
  Pageable pageable;
  bool last;
  int totalPages;
  int totalElements;
  int numberOfElements;
  int size;
  int number;
  Sort sort;
  bool first;
  bool empty;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        last: json["last"] == null ? null : json["last"],
        totalPages: json["totalPages"] == null ? null : json["totalPages"],
        totalElements: json["totalElements"],
        numberOfElements: json["numberOfElements"],
        size: json["size"] == null ? null : json["size"],
        number: json["number"] == null ? null : json["number"],
        sort: Sort.fromJson(json["sort"]),
        first: json["first"] == null ? null : json["first"],
        empty: json["empty"] == null ? null : json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "pageable": pageable == null ? null : pageable.toJson(),
        "last": last == null ? null : last,
        "totalPages": totalPages == null ? null : totalPages,
        "totalElements": totalElements == null ? null : totalElements,
        "numberOfElements": numberOfElements == null ? null : numberOfElements,
        "size": size == null ? null : size,
        "number": number == null ? null : number,
        "sort": sort == null ? null : sort.toJson(),
        "first": first == null ? null : first,
        "empty": empty == null ? null : empty,
      };
}

class Content {
  Content({
    required this.id,
    required this.productName,
    required this.unitPrice,
    required this.quanlity,
    required this.imgLink,
    required this.description,
    required this.categories,
  });

  int id;
  String productName;
  int unitPrice;
  int quanlity;
  String imgLink;
  String description;
  Categories categories;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"] == null ? null : json["id"],
        productName: json["productName"] == null ? null : json["productName"],
        unitPrice: json["unitPrice"] == null ? null : json["unitPrice"],
        quanlity: json["quanlity"] == null ? null : json["quanlity"],
        imgLink: json["imgLink"] == null ? null : json["imgLink"],
        description: json["description"] == null ? null : json["description"],
        categories: Categories.fromJson(json["categories"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "productName": productName == null ? null : productName,
        "unitPrice": unitPrice == null ? null : unitPrice,
        "quanlity": quanlity == null ? null : quanlity,
        "imgLink": imgLink == null ? null : imgLink,
        "description": description == null ? null : description,
        "categories": categories == null ? null : categories.toJson(),
      };
}

class Categories {
  Categories({
    required this.categoryName,
  });

  String categoryName;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        categoryName:
            json["categoryName"] == null ? null : json["categoryName"],
      );

  Map<String, dynamic> toJson() => {
        "categoryName": categoryName == null ? null : categoryName,
      };
}

class Pageable {
  Pageable({
    required this.sort,
    required this.offset,
    required this.pageSize,
    required this.pageNumber,
    required this.paged,
    required this.unpaged,
  });

  Sort sort;
  int offset;
  int pageSize;
  int pageNumber;
  bool paged;
  bool unpaged;

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromJson(json["sort"]),
        offset: json["offset"] == null ? null : json["offset"],
        pageSize: json["pageSize"] == null ? null : json["pageSize"],
        pageNumber: json["pageNumber"] == null ? null : json["pageNumber"],
        paged: json["paged"] == null ? null : json["paged"],
        unpaged: json["unpaged"] == null ? null : json["unpaged"],
      );

  Map<String, dynamic> toJson() => {
        "sort": sort == null ? null : sort.toJson(),
        "offset": offset == null ? null : offset,
        "pageSize": pageSize == null ? null : pageSize,
        "pageNumber": pageNumber == null ? null : pageNumber,
        "paged": paged == null ? null : paged,
        "unpaged": unpaged == null ? null : unpaged,
      };
}

class Sort {
  Sort({
    required this.unsorted,
    required this.sorted,
    required this.empty,
  });

  bool unsorted;
  bool sorted;
  bool empty;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        unsorted: json["unsorted"] == null ? null : json["unsorted"],
        sorted: json["sorted"] == null ? null : json["sorted"],
        empty: json["empty"] == null ? null : json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "unsorted": unsorted == null ? null : unsorted,
        "sorted": sorted == null ? null : sorted,
        "empty": empty == null ? null : empty,
      };
}

// class Product {
//   final String image, productName;
//   final int unitPrice;
//   //final int commission;
//   //final Color bgColor;

//   const Product({
//     required this.image,
//     required this.productName,
//     required this.unitPrice,
//     //required this.commission,
//     // this.bgColor = const Color(0xFFEFEFF2),
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       image: json['image'],
//       productName: json['productName'],
//       unitPrice: json['unitPrice'],
//       //commission: json['commission'],
//     );
//   }
// }
