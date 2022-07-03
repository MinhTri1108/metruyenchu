class Vbook {
  int userId;
  int id;
  String title;
  String body;

  Vbook({this.userId, this.id, this.title, this.body});

  Vbook.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
// class Vbook {
//   String mota;
//   String theloai;
//   String tiendo;
//   String tacgia;
//   String tentruyen;
//   String id;
//   String url;

//   Vbook(
//       {this.mota,
//         this.theloai,
//         this.tiendo,
//         this.tacgia,
//         this.tentruyen,
//         this.id,
//         this.url});

//   Vbook.fromJson(Map<String, dynamic> json) {
//     mota = json['mota'];
//     theloai = json['theloai'];
//     tiendo = json['tiendo'];
//     tacgia = json['tacgia'];
//     tentruyen = json['tentruyen'];
//     id = json['id'];
//     url = json['url'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['mota'] = this.mota;
//     data['theloai'] = this.theloai;
//     data['tiendo'] = this.tiendo;
//     data['tacgia'] = this.tacgia;
//     data['tentruyen'] = this.tentruyen;
//     data['id'] = this.id;
//     data['url'] = this.url;
//     return data;
//   }
// }