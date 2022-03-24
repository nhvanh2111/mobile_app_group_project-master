import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  int id;
  int phone;
  String company;
  String email;
  String address;

  UserProvider({
    this.id = 0,
    this.address = "",
    this.company = "",
    this.email = "",
    this.phone = 0,
  });

  void setUser(
      String newCompany, String newEmail, int newPhone, String newAddress) {
    company = newCompany;
    email = newEmail;
    phone = newPhone;
    address = newAddress;
    notifyListeners();
  }

  void userLoginId(int newId) {
    id = newId;
    notifyListeners();
  }
}
