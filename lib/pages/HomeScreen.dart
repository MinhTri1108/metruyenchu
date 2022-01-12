import 'package:apidemo/models/show_Toast.dart';
import 'package:apidemo/models/vbook_model.dart';
import 'package:apidemo/network/Api_service.dart';
import 'package:apidemo/pages/register.dart';
import 'package:apidemo/pages/search.dart';
import 'package:apidemo/pages/vbook_details_screen.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FetchVbookList _vbookList = FetchVbookList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer (
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Vào coi film chơi nè!'),
              ),
              ListTile(
                title: const Text('Đăng nhập tài khoản'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
                },
              ),
              ListTile(
                title: const Text('Đăng kí tài khoản'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterPage()));
                },
              ),
              ListTile(
                title: const Text('Thông tin liên hệ'),
                onTap: () {
                  showToastMessage("Thông tin liên hệ app nhann");
                },
              ),
              ListTile(
                title: const Text('Đăng xuất'),
                onTap: () {},
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Vbook List'),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchUser());
              },
              icon: Icon(Icons.search_sharp),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_circle),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
          },
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: FutureBuilder<List<Vbook>>(
              future: _vbookList.getvbookList(),
              builder: (context, snapshot) {
                var data = snapshot.data;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return Container(
                        padding: const EdgeInsets.all(10),
                        width: 160,
                          child:  GestureDetector(
                          onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VbookDetailsScreen(vbook:data[index])),
                            );
                         // /*   Navigator.of(context).pushNamed(
                         //      VbookDetailsScreen.routeName,
                         //      arguments: {
                         //        'id': data[index].id,
                         //        'title': data[index].title,
                         //        'body': data[index].body,
                         //        'userId': data[index].userId,
                         //      },
                         //    );*/
                            },
                            child: Card(
                              elevation: 5,
                              child: Row(
                                children: <Widget>[
                                  Hero(
                                    tag: data[index].id,
                                    child: Container(
                                      height: 150,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          topLeft: Radius.circular(5),
                                        ),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            "https://i.imgur.com/9s67Gww.png",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 150,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          data[index].title,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      );
                    });
              }),
        ),
      ),
    );
  }
}