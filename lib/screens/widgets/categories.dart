// import 'dart:convert';
// import 'dart:html';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:http/http.dart' as http;
// import 'package:mobile_app_group_project/config.dart';
// import 'package:mobile_app_group_project/screens/models/category.dart';
// import 'package:mobile_app_group_project/screens/views/category_list_view.dart';
// import 'package:mobile_app_group_project/screens/widgets/section_title.dart';

// // Future<List<Category>> fetchCategory() async {
// //   final response = await http
// //       .get(Uri.parse('https://qtpq.azurewebsites.net/api/category/getList'));

// //   if (response.statusCode == 200) {
// //     // If the server did return a 200 OK response,
// //     // then parse the JSON.
// //     print(response.statusCode);
// //     print(jsonDecode(response.body)['data']);
// //     //return Category.fromJson(jsonDecode(response.body));
// //     // Map data = jsonDecode(response.body);
// //     // Iterable list = data['content'];
// //     // final vehicles = list.cast<Map<String, dynamic>>();
// //     // final listofvehicles = await vehicles.map<Product>((json) {
// //     //   return Product.fromJson(json);
// //     // }).toList();
// //     // return listofvehicles;

// //     var jsonString = response.body;
// //     Iterable list = json.decode(jsonString);

// //     final Categories = list.cast<Map<String, dynamic>>();
// //     final listOfCategories = Categories.map<Category>((json) {
// //       return Category.fromJson(json);
// //     }).toList();
// //     return listOfCategories;
// //   } else {
// //     // If the server did not return a 200 OK response,
// //     // then throw an exception.
// //     throw Exception('Failed to load product');
// //   }
// // }

// class Categories extends StatefulWidget {
//   const Categories({Key? key}) : super(key: key);

//   @override
//   State<Categories> createState() => _CategoriesState();
// }

// class DataList {
//   DataList(this.categoriesList);
//   List<CategoriesItem> categoriesList;

//   DataList.fromJson(Map<String, dynamic> json) 
//       : categoriesList = List<dynamic>.from(json['data']['categoryName']).map((i) => CategoriesItem(categoryName: .fromJson(i))).toList(); 
// }

// class CategoriesItem {
//   CategoriesItem({
//     required this.categoryName,
//   });
//   final String categoryName;

//   String categoriesList(List<CategoriesItem>? categoryList ) {
//     String text = "";
//     for (var i = 0; i < categoryList!.length; i++) {
//       text = text + categoryList.toString();
//     }
//     return text;
//   }

//   @override
//   String toString() {
//     return "\n $categoryName";
//   }

//   factory CategoriesItem.fromJson(Map<dynamic, dynamic> json) {
//     return CategoriesItem(
//       categoryName: json["categoryName"],
//     );
//   }
// }

// // class _CategoriesState extends State<Categories> {
// //   // late Future<Product> futureProduct;
// //   late Future<List<Category>> futureProduct;
// //   final map = Map<String, dynamic>();

// //   @override
// //   void initState() {
// //     super.initState();
// //     futureProduct = fetchCategory();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         Padding(
// //           padding: const EdgeInsets.symmetric(vertical: defaultPadding),
// //           child: SectionTitle(
// //             title: "Categories",
// //             pressSeeAll: () => Navigator.of(context).pushReplacement(
// //               MaterialPageRoute(builder: (_) => CategoryList()),
// //             ),
// //           ),
// //         ),
// //         SizedBox(
// //           height: 84,
// //           child: ListView.separated(
// //             scrollDirection: Axis.horizontal,
// //             itemCount: map.length,
// //             itemBuilder: (context, index) => CategoryCard(
// //               icon: map[index].icon,
// //               title: map[index].title,
// //               press: () {},
// //             ),
// //             separatorBuilder: (context, index) =>
// //                 const SizedBox(width: defaultPadding),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class CategoryCard extends StatelessWidget {
// //   const CategoryCard({
// //     Key? key,
// //     required this.icon,
// //     required this.title,
// //     required this.press,
// //   }) : super(key: key);

// //   final String icon, title;
// //   final VoidCallback press;

// //   @override
// //   Widget build(BuildContext context) {
// //     return OutlinedButton(
// //       onPressed: press,
// //       style: OutlinedButton.styleFrom(
// //         shape: const RoundedRectangleBorder(
// //           borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
// //         ),
// //       ),
// //       child: Padding(
// //         padding: const EdgeInsets.symmetric(
// //             vertical: defaultPadding / 2, horizontal: defaultPadding / 4),
// //         child: Column(
// //           children: [
// //             SvgPicture.asset(icon),
// //             const SizedBox(height: defaultPadding / 2),
// //             Text(
// //               title,
// //               style: Theme.of(context).textTheme.subtitle2,
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }




// // st
// // String text = "nothing now!!";
// //   @override
// //   Widget build(BuildContext context) {
// //     //List<Data>? dataList;
// //     return Container(
// //       padding: EdgeInsets.all(50),
// //       child: Column(
// //         children: [
// //           ElevatedButton(
// //             onPressed: () async {
// //               var url = Uri.parse('https://qtpq.azurewebsites.net/api/menu/getMenuById/1');
// //               var response = await http.get(url);

// //               setState(() {
// //                 text = DataList.fromJson(jsonDecode(response.body)).toString();
// //               });
// //             },
// //             child: Text("HIT ME"),
// //           ),
// //           Text(text),
// //         ],
// //       ),
// //     );
// //   }



// // Future<List<Datum>> fetchCategory() async {
// //   final response = await http
// //       .get(Uri.parse('https://qtpq.azurewebsites.net/api/category/getList'));
// //   if (response.statusCode == 200) {
// //     // If the server did return a 200 OK response,
// //     // then parse the JSON.
// //     print(response.statusCode);
// //     print(jsonDecode(response.body)['data']);
// //     Category category = categoryFromJson(response.body);
// //     List<Datum> arrData = category.data;
// //     return arrData;
// //   } else {
// //     // If the server did not return a 200 OK response,
// //     // then throw an exception.
// //     throw Exception('Failed to load product');
// //   }
// // }

// // class Categories extends StatefulWidget {
// //   const Categories({Key? key}) : super(key: key);

// //   @override
// //   State<Categories> createState() => _CategoriesState();
// // }

// // class _CategoriesState extends State<Categories> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         Padding(
// //           padding: const EdgeInsets.symmetric(vertical: defaultPadding),
// //           child: SectionTitle(
// //             title: "Categories",
// //             pressSeeAll: () => Navigator.of(context).pushReplacement(
// //               MaterialPageRoute(builder: (_) => CategoryList()),
// //             ),
// //           ),
// //         ),
// //         FutureBuilder(
// //             future: fetchCategory(),
// //             builder: (BuildContext context, AsyncSnapshot snapshot) {
// //               if (snapshot.connectionState != ConnectionState.done) {
// //                 return CircularProgressIndicator();
// //               }
// //               if (snapshot.hasData) {
// //                 return ListView.builder(
// //                     itemBuilder: (BuildContext context, int index) {
// //                   return Text("h");
// //                 });
// //               }
// //               return Text("H");
// //             }),
// //         SizedBox(
// //           height: 84,
// //           child: ListView.separated(
// //             scrollDirection: Axis.horizontal,
// //             itemCount: map.length,
// //             itemBuilder: (context, index) => CategoryCard(
// //               icon: map[index].icon,
// //               title: map[index].title,
// //               press: () {},
// //             ),
// //             separatorBuilder: (context, index) =>
// //                 const SizedBox(width: defaultPadding),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class Categories extends StatelessWidget {
// //   const Categories({
// //     Key? key,
// //   }) : super(key: key);
