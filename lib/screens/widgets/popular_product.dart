import 'package:flutter/material.dart';
import 'package:mobile_app_group_project/config.dart';
import 'package:mobile_app_group_project/screens/models/product.dart';
import 'package:mobile_app_group_project/screens/views/product_list_view.dart';
import 'package:mobile_app_group_project/screens/widgets/product_menu_card.dart';
import 'section_title.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<Product>> fetchProduct() async {
  final response = await http
      .get(Uri.parse('https://qtpq.azurewebsites.net/api/menu/getMenuById/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // // then parse the JSON.
    // print(response.statusCode);
    // print(jsonDecode(response.body)['data']);
    // return Product.fromJson(jsonDecode(response.body));
    // Map data = jsonDecode(response.body);
    // Iterable list = data['content'];
    // final vehicles = list.cast<Map<String, dynamic>>();
    // final listofvehicles = await vehicles.map<Product>((json) {
    //   return Product.fromJson(json);
    // }).toList();
    // return listofvehicles;

    // print(list);
    // final bookingsAccept = list.cast<Map<String, dynamic>>();
    // final listOfBookingsAccept = bookingsAccept.map<Product>((json) {
    //   return Product.fromJson(json);
    // }).toList();
    // print(listOfBookingsAccept.length);

    var jsonString = (response.body);
    var json = jsonDecode(jsonString);
    var list = List<dynamic>.from(json['data']['products'])
        .map((i) => Product.fromJson(i))
        .toList();

    return list;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load product');
  }
}

class Product {
  final String image, productName;
  final double unitPrice;
  final double commission;
  //final Color bgColor;
  @override
  String toString() {
    return "$productName - $image - $unitPrice - $commission \n";
  }

  const Product({
    required this.image,
    required this.productName,
    required this.unitPrice,
    required this.commission,
    // this.bgColor = const Color(0xFFEFEFF2),
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      image: json['imgLink'],
      productName: json['productName'],
      unitPrice: json['unitPrice'],
      commission: json['unitPrice'] * 0.03,
    );
  }
}

class PopularProducts extends StatefulWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  // late Future<Product> futureProduct;
  late var futureProduct = fetchProduct();
  final map = Map<String, dynamic>();
  List futureproduct = [];

  @override
  void initState() {
    getListPop();
    super.initState();
  }

  void getListPop() async {
    futureproduct = await fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Popular Souvenir",
            pressSeeAll: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => ProductList()),
            ),
          ),
        ),
        Container(
          height: size.height * 0.6,
          child: FutureBuilder(
            future: futureProduct,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: futureproduct.length,
                    itemBuilder: (_, i) {
                      return ProductCard(
                        image: futureproduct[i].image,
                        title: futureproduct[i].productName,
                        price: futureproduct[i].unitPrice,
                        commission: futureproduct[i].commission,
                        press: () {},
                      );
                    });
              }
              if (snapshot.hasError) {
                return Text("Error");
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ],
    );
  }
}
