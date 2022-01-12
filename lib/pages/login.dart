
import 'dart:convert';
import 'package:apidemo/models/text_bloc.dart';
import 'package:apidemo/pages/Login_HomeScreen.dart';
import 'package:apidemo/pages/register.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


import '../main.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  LoginBloc bloc = new LoginBloc();
  bool _isLoading = false;
  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //       icon: Icon(Icons.location_city),
        //     onPressed: () {
        //         Navigator.push(context, MaterialPageRoute(builder: (_) => HomeApp()));
        //     },
        //   ),
        // ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        //color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Container(
                width: 70,
                height: 70,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: FlutterLogo(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: Text(
                "Hello Welcome to App",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                  fontSize: 30,
                ),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: StreamBuilder(
                stream: bloc.userStream,
                builder: (context, snapshot) => TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  controller: _userController,
                  decoration: InputDecoration(
                      labelText: "Tài khoản",
                      errorText: snapshot.hasError ? snapshot.error : null,
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget> [
                  StreamBuilder(
                    stream: bloc.passStream,
                    builder: (context, snapshot) => TextField(
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      controller: _passwordController,
                      obscureText: !_showPass,
                      decoration: InputDecoration(
                          labelText: "Mật khẩu",
                          errorText: snapshot.hasError ? snapshot.error : null,
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          )),
                    ),),
                  GestureDetector(
                    onTap: onClickShow,
                    child: Text(
                      _showPass ? "Hide": "Show",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePageLogin()));
                  },//onSigninClick,
                  child: Text("Đăng nhập", style: TextStyle(color: Colors.white,fontSize: 20)),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: RichText(
                  text: TextSpan(
                    text: "New user?",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                    children: <TextSpan> [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap =  () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterPage()));
                            },
                          text: "Sign up for a new account",
                          style: TextStyle(
                              color: Colors.blue, fontSize: 16
                          )
                      ),
                    ],
                  ),
                )
            ),
            // Container(
            //   height: 90,
            //   width: double.infinity,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         "Đăng kí tài khoản nhé?",
            //         style: TextStyle(color: Colors.grey, fontSize: 15),
            //       ),
            //       Text(
            //         "Quên mật khẩu?",
            //         style: TextStyle(color: Colors.grey, fontSize: 15),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  void onClickShow() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSigninClick() {
    if (bloc.isValidInfo(_userController.text, _passwordController.text)){
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => MyApp()));
    }
    TextFormField txtEmail(String title, IconData icon) {
      return TextFormField(
        controller: _userController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: Colors.grey),
          icon: Icon(icon),
        ),
      );
    }
    TextFormField txtPassWord(String title, IconData icon) {
      return TextFormField(
        controller: _passwordController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: Colors.grey),
          icon: Icon(icon),
        ),
      );
    }
  }
}


