import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mks_racing/model/user.dart';

import 'package:http/http.dart' as http;

import '../apiURL.dart';

class AuthProvider with ChangeNotifier {
  User currentUser;

  String token;

  bool isAuth = false;

  login(String email, String password) async {
    try {
      final response = await http.post(loginURL,
          headers: {'ismobile': 'true', 'Content-Type': 'application/json'},
          body: json.encode({'email': email, 'password': password}));
      final data = json.decode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 201) {
        isAuth = true;
        token = data['data']['token'];
        currentUser = User(
            email: data['data']['user']['email'],
            name: data['data']['user']['name'],
            uid: data['data']['user']['userId']);
        notifyListeners();
      } else {
        return Fluttertoast.showToast(msg: data['message'].toString());
      }
    } catch (e) {
      throw e;
    }
  }
}
