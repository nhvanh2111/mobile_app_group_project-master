import 'package:flutter/material.dart';
import 'package:mobile_app_group_project/screens/models/product.dart';
import 'package:mobile_app_group_project/screens/models/user.dart';
import 'package:mobile_app_group_project/screens/views/welcome_view.dart';
import 'package:mobile_app_group_project/screens/widgets/bottom_nav_bar.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);
  static final String title = 'Group Project';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Gordita",
        ),
        home: WelcomeView(),
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => BottomNavBar(),
        //   // CommissionReport.routeName: (context) => const CommissionReport(),
        // },
      ),
    );
  }
}
