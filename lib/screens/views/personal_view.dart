// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:mobile_app_group_project/config.dart';
// import 'package:mobile_app_group_project/screens/views/login_view.dart';
// import 'package:mobile_app_group_project/screens/widgets/personal_menu.dart';
// import 'package:mobile_app_group_project/screens/widgets/profile_picture.dart';

// class PersonalView extends StatelessWidget {
//   const PersonalView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       //resizeToAvoidBottomInset: false,
//       // appBar: AppBar(
//       //   centerTitle: true,
//       //   elevation: 0,
//       //   leading: IconButton(
//       //     onPressed: () {
//       //       Navigator.pop(context);
//       //     },
//       //     icon: const Icon(
//       //       Icons.arrow_back_rounded,
//       //       color: Colors.black,
//       //     ),
//       //   ),
//       //   title: const Text(
//       //     "Personal",
//       //     style: TextStyle(color: Colors.black),
//       //   ),
//       //   backgroundColor: Colors.white,
//       // ),
//       appBar: CupertinoNavigationBar(
//         leading: GestureDetector(
//           child: Icon(CupertinoIcons.back),
//           onTap: () {},
//         ),
//         middle: Text(
//           "Pesonal",
//           style: TextStyle(fontSize: 22),
//         ),
//         trailing: GestureDetector(
//           child: Text(
//             "Save",
//             style: TextStyle(
//               fontSize: 16,
//               color: kPrimaryColor,
//             ),
//           ),
//           onTap: () {},
//         ),
//         border: Border(
//             bottom: BorderSide(
//           width: 0,
//           color: CupertinoColors.white,
//         )),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             SizedBox(height: defaultPadding * 2),
//             Center(
//               child: ProfilePicture(),
//             ),
//             SizedBox(height: defaultPadding),
//             Center(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.2),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: const Offset(0, 3),
//                     ),
//                   ],
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 height: size.height * 0.45,
//                 width: size.width * 0.9,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 40, vertical: 10),
//                       child: TextFormField(
//                         decoration: const InputDecoration(
//                           border: UnderlineInputBorder(),
//                           labelText: 'Company Name',
//                           labelStyle: TextStyle(
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 40),
//                       child: TextFormField(
//                         decoration: const InputDecoration(
//                           border: UnderlineInputBorder(),
//                           labelText: 'Email',
//                           labelStyle: TextStyle(
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 40),
//                       child: TextFormField(
//                         decoration: const InputDecoration(
//                           border: UnderlineInputBorder(),
//                           labelText: 'Date Of Birth',
//                           labelStyle: TextStyle(
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 40),
//                       child: TextFormField(
//                         decoration: const InputDecoration(
//                           border: UnderlineInputBorder(),
//                           labelText: 'Address',
//                           labelStyle: TextStyle(
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 40),
//                       child: TextFormField(
//                         decoration: const InputDecoration(
//                           border: UnderlineInputBorder(),
//                           labelText: 'Phone',
//                           labelStyle: TextStyle(
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: defaultPadding),
//             Center(
//               child: Column(
//                 children: [
//                   PersonalMenu(
//                     text: "Change Password",
//                     icon: "assets/icons/Key.svg",
//                     press: () {},
//                   ),
//                   PersonalMenu(
//                     text: "Log Out",
//                     icon: "assets/icons/Log out.svg",
//                     press: () => Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(
//                         builder: (_) => LoginView(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_group_project/config.dart';
import 'package:mobile_app_group_project/screens/models/user.dart';
import 'package:mobile_app_group_project/screens/views/login_view.dart';
import 'package:provider/provider.dart';

class PersonalView extends StatefulWidget {
  const PersonalView({Key? key}) : super(key: key);

  @override
  State<PersonalView> createState() => _PersonalViewState();
}

class _PersonalViewState extends State<PersonalView> {
  final _formKey = GlobalKey<FormState>();
  bool isEditable = false;

  get kPrimaryColor => null;
  @override
  Widget build(BuildContext context) {
    String company = Provider.of<UserProvider>(context, listen: false).company;
    String address = Provider.of<UserProvider>(context, listen: false).address;
    String email = Provider.of<UserProvider>(context, listen: false).email;
    int phone = Provider.of<UserProvider>(context, listen: false).phone;
    print('$company - $address - $email');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   title: const Text(
      //     "Personal",
      //     style: TextStyle(color: Colors.black),
      //   ),
      // ),
      appBar: CupertinoNavigationBar(
        leading: GestureDetector(
          child: Icon(CupertinoIcons.back),
          onTap: () {},
        ),
        middle: Text(
          "Pesonal",
          style: TextStyle(fontSize: 22),
        ),
        trailing: GestureDetector(
          child: Text(
            "Save",
            style: TextStyle(
              fontSize: 16,
              color: kPrimaryColor,
            ),
          ),
          onTap: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                  radius: 50, child: Image.asset("assets/images/profile.png")),
              SizedBox(height: 30),
              Container(
                height: size.height * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.black),
                  color: Colors.grey[200],
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Icon(Icons.edit),
                        ),
                        TextFormField(
                          key: const ValueKey("CompanyName"),
                          enabled: isEditable,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a valid Company Name';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: company,
                            labelStyle: TextStyle(fontSize: 16),
                          ),
                        ),
                        TextFormField(
                          key: const ValueKey("phone"),
                          enabled: isEditable,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !value.contains(RegExp(r'[0-9]'))) {
                              return 'Please enter a Phone number';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "0$phone",
                            labelStyle: TextStyle(fontSize: 16),
                          ),
                        ),
                        TextFormField(
                          key: const ValueKey("email"),
                          enabled: isEditable,
                          validator: (value) {
                            if (value!.isEmpty || value.contains('@')) {
                              return 'Please enter a vail email';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: email,
                            labelStyle: TextStyle(fontSize: 16),
                          ),
                        ),
                        TextFormField(
                          key: const ValueKey("address"),
                          enabled: isEditable,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a valid address';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                            labelText: address,
                            labelStyle: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.black),
                  color: Colors.grey[200],
                ),
                height: size.height * 0.15,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //iconButton(Icons.settings, "Change Welcome Statement", () {}),
                    iconButton(Icons.vpn_key_rounded, "Change Password", () {}),
                    iconButton(
                      Icons.logout_outlined,
                      "Logout",
                      () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => LoginView()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector iconButton(IconData icon, String text, VoidCallback func) {
    return GestureDetector(
      onTap: func,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 35,
            color: Color(0xFF407BFF),
          ),
          Text(
            "  $text",
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
