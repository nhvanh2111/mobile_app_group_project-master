// import 'package:flutter/material.dart';
// import 'package:mobile_app_group_project/config.dart';
// import 'package:mobile_app_group_project/screens/widgets/bottom_nav_bar.dart';
// import 'package:mobile_app_group_project/screens/widgets/rounded_button.dart';
// import 'package:mobile_app_group_project/screens/widgets/rounded_input_field.dart';
// import 'package:mobile_app_group_project/screens/widgets/rounded_password_field.dart';

// class LoginView extends StatelessWidget {
//   const LoginView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           width: double.infinity,
//           height: size.height,
//           child: Stack(
//             alignment: Alignment.center,
//             children: <Widget>[
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 child: Image.asset(
//                   "assets/images/asset_3.png",
//                   width: size.width * 0.35,
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 right: 0,
//                 child: Image.asset(
//                   "assets/images/asset_2.png",
//                   width: size.width * 0.4,
//                 ),
//               ),
//               Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               "LOGIN",
//               style: TextStyle(
//                 fontFamily: "Gordita",
//                 fontWeight: FontWeight.bold,
//                 fontSize: 24,
//               ),
//             ),
//             SizedBox(height: size.height * 0.02),
//             Image.asset(
//               "assets/images/login.png",
//               height: size.height * 0.3,
//             ),
//             SizedBox(height: size.height * 0.02),
//             RoundedInputField(
//               hintText: "Email",
//               onChanged: (value) {},
//             ),
//             RoundedPasswordField(
//               onChanged: (value) {},
//             ),
//             SizedBox(height: size.height * 0.01),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 GestureDetector(
//                   onTap: () {},
//                   // => Navigator.of(context).pushReplacement(
//                   //     MaterialPageRoute(builder: (_) => HomeScreen())),
//                   child: Text(
//                     "Forgot Password ?",
//                     style: TextStyle(
//                       color: kPrimaryColor,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: size.height * 0.01),
//             RoundedButton(
//               text: "Sign In",
//               press: ()  => Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (_) => BottomNavBar()),
//               ),
//             ),
//           ],
//         ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mobile_app_group_project/config.dart';
import 'package:mobile_app_group_project/screens/models/user.dart';
import 'package:mobile_app_group_project/screens/widgets/bottom_nav_bar.dart';
import 'package:mobile_app_group_project/screens/widgets/rounded_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile_app_group_project/screens/widgets/text_field_container.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/asset_3.png",
                  width: size.width * 0.35,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/asset_2.png",
                  width: size.width * 0.4,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "LOGIN",
                    style: TextStyle(
                      fontFamily: "Gordita",
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Image.asset(
                    "assets/images/login.png",
                    height: size.height * 0.3,
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFieldContainer(
                    child: TextFormField(
                      controller: usernameController,
                      //onChanged: onChanged,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: kPrimaryColor,
                        ),
                        hintText: "Username",
                        //border: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      controller: passwordController,
                      //onChanged: onChanged,
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: kPrimaryColor,
                        ),
                        hintText: "Password",
                        //border: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        // => Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(builder: (_) => HomeScreen())),
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  RoundedButton(
                    text: "Sign In",
                    press: () {
                      loginAPI();
                    },
                    // press: ( )=> Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(builder: (_) => BottomNavBar()),
                    // ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginAPI() async {
    if (passwordController.text.isNotEmpty &&
        usernameController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse("https://qtpq.azurewebsites.net/api/seller/login"),
          headers: ({
            "Accept": "application/json",
            "content-type": "application/json",
          }),
          body: jsonEncode({
            "username": usernameController.text,
            "password": passwordController.text,
          }));
      // if (response.statusCode == 200) {
      var message = jsonDecode(response.body)['data'];
      var status = jsonDecode(response.body)['status'];

      print(message);

      if (status == 0) {
        Provider.of<UserProvider>(context, listen: false)
            .userLoginId(message['sellerId']);

        print(Provider.of<UserProvider>(context, listen: false).id);
        Provider.of<UserProvider>(context, listen: false).setUser(
          message['sellerName'],
          message['email'],
          int.parse(message['phone']),
          message['address'],
        );

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BottomNavBar()));
      } else if (status == 1 || message == 'Your password is wrong') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Password")));
      } else if (status == 1 || message == 'This username maybe wrong') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Username")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Blank Field Not Allowed")));
      }
    }
  }
}
