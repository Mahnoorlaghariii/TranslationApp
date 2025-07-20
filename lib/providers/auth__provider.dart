import 'package:flutter/material.dart';
import 'package:language_translator_app/utils/shared_preferences_helper.dart';

class AuthProvider extends ChangeNotifier{
  bool _LoggedIn = true;
  bool get isLoggedIn => _LoggedIn;

  Future<void> loadLogin() async {
    _LoggedIn = await SharedPreferencesHelper.isLoggedIn();
    notifyListeners();
  }

  Future<void> Login(String email, String pass) async{
    if(email.isNotEmpty && pass.length >4) {
      _LoggedIn = true;
      await SharedPreferencesHelper.saveLoggin(true);
      notifyListeners();
    }
  }

  Future<void> logOut() async {
    _LoggedIn = false;
    await SharedPreferencesHelper.clearAll();
    notifyListeners();
  }
}