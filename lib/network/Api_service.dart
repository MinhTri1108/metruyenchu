import 'dart:convert';
import 'package:apidemo/models/vbook_model.dart';
import 'package:http/http.dart' as http;

class FetchVbookList {
  var data = [];
  List<Vbook> results = [];
  // String urlList = 'https://3sp0iqqnze.execute-api.us-east-1.amazonaws.com/dev/GetTruyen';
  String urlList = 'https://jsonplaceholder.typicode.com/posts';
  Future<List<Vbook>> getvbookList({String query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => Vbook.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) => element.title
                  .toLowerCase()
                  .contains((query.toLowerCase())))
              .toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}
