
import 'dart:async';

import 'package:apidemo/models/validation.dart';


class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passwordController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passwordController.stream;

  bool isValidInfo(String username, String pass) {
    if(!Validation.isValidUser(username)){
      _userController.sink.addError("Tài khoản không hợp lệ");
      return false;
    }
    _userController.sink.add("Ok");

    if(!Validation.isValidPass(pass)){
      _passwordController.sink.addError("Mật khẩu không hợp lệ");
      return false;
    }
    _passwordController.sink.add("OK");

    return true;
  }
  void dispose(){
    _userController.close();
    _passwordController.close();
  }
}