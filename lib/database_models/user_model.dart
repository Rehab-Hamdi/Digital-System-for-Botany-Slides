import 'borrow_model.dart';

class Person {
  int? uId;
  String? name;
  double? phone;
  String? email;
  String? type;
  List<Borrow>? borrowedList = [];

  Person({this.name, this.email, this.phone, this.type}) : super();

  Person.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];

    if (json["borrowedList"] != null) {
      borrowedList = [];
      json["borrowedList"].forEach((v) {
        borrowedList?.add(Borrow.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['type'] = type;
    map['phone'] = phone;

    if (borrowedList != null) {
      map["borrowedList"] = borrowedList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}