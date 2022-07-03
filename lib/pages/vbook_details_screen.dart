import 'package:apidemo/models/vbook_model.dart';
import 'package:flutter/material.dart';

class VbookDetailsScreen extends StatelessWidget {
  // static const routeName = '/movie-details';
  final Vbook vbook;

  const VbookDetailsScreen({Key key, this.vbook}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final routeArgs =
    // ModalRoute.of(context).settings.arguments as Map<String, String>;
    // final id = routeArgs['id'];
    // final rating = routeArgs['rating'];

    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        // title: Text('Movie Details'),
        backgroundColor: Color(0xfff4f4f4),
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: <Widget>[
            Center(
              child: Card(
                elevation: 5,
                child: Hero(
                  tag: vbook.id,
                  child: Container(
                    height: 450,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://innovavietnam.vn/wp-content/uploads/poster-561x800.jpg',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              vbook.title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     Card(
            //       elevation: 5,
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(
            //           vertical: 10,
            //           horizontal: 20,
            //         ),
            //         child: Column(
            //           children: <Widget>[
            //
            //             SizedBox(
            //               height: 10,
            //             ),
            //             // Text(
            //             //   routeArgs['body'],
            //             //   style: TextStyle(
            //             //       fontSize: 14, fontWeight: FontWeight.bold),
            //             // ),
            //           ],
            //         ),
            //       ),
            //     ),
            //
            //   ],
            // ),
            SizedBox(
              height: 20,
            ),
            Text(
              vbook.body,
              style: TextStyle(
                fontSize: 18,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              onPressed: () {},
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.play_circle_outline,
                  ),
                  Text(
                    'Thêm phim vào vỏ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              onPressed: () {},
              color: Colors.yellowAccent,
              textColor: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.check_circle_outline,
                  ),
                  Container(
                    height: 5,
                    width: 5,
                  ),
                  Text(
                    'Đọc truyện',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}