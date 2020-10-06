import 'package:flutter/material.dart';
import 'package:login_page/ui/shared/globals.dart';

class HomeModel extends ChangeNotifier{
  get isVisible => _isVisible;
  bool _isVisible = false;

  set isVisible(value){
    _isVisible = value;
    notifyListeners();
  }

  get isValid => _isValid;
  bool _isValid = false;

  void isValidEmail(String input){
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);

    _isValid = regExp.hasMatch(input);

    notifyListeners();
  }
}