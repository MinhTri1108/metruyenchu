import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();

}
class RegisterPageState extends State<RegisterPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.blue),
        elevation: 0,
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: BoxConstraints.expand(),
          child: SingleChildScrollView(
              child: Column(
                children: <Widget> [
                  SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 6),
                    child: Text(
                      "App Movies",
                      style: TextStyle(color: Colors.red, fontSize: 22),
                    ),
                  ),
                  Text(
                    "skadnjskabdjkasdasd",
                    style: TextStyle(fontSize: 22, color: Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 80, 0, 20),
                    child: TextField(
                      style: TextStyle(fontSize: 22, color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Name",
                        prefixIcon: Container(width: 50,),
                        border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.pink, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                      ),
                    ),
                  ),
                  TextField(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      labelText:  "Phone Number",
                      prefixIcon: Container(width: 50,),
                      border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.pink, width: 1),
                        borderRadius:
                        BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: TextField(
                      style: TextStyle(
                          fontSize: 18, color: Colors.black
                      ),
                      decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Container(width: 50,),
                          border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.pink, width: 1),
                            borderRadius:
                            BorderRadius.all(Radius.circular(6)),
                          )
                      ),
                    ),
                  ),
                  TextField(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Container(width: 50,),
                        border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.pink, width: 1),
                          borderRadius:
                          BorderRadius.all(Radius.circular(6)),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                    child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: RichText(
                        text: TextSpan(
                            text: "Already a User?",
                            style: TextStyle(color: Colors.pink, fontSize: 16),
                            children: <TextSpan> [
                              TextSpan(
                                  text: "Login now",
                                  style: TextStyle(color: Colors.pink, fontSize: 16)
                              )
                            ]
                        )
                    ),
                  )
                ],
              )
          )
      ),
    );
  }
}