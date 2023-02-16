import 'dart:convert';

import 'package:our_test_project/models/slide_model.dart';

class Others extends Slide {
  int? othersId;
  String? family;
  String? latinName;
  List<String>? sectionType;

  Others({this.othersId, this.family, this.latinName, this.sectionType})
      : super();

  Others.fromJson(Map<String, dynamic> json) {
    othersId = json["othersId"];
    family = json["family"];
    latinName = json["latinName"];
    sectionType = jsonDecode(json["sectionType"]);
  }

  @override
  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["othersId"] = othersId;
    map["family"] = family;
    map["latinName"] = latinName;
    map["sectionType"] = jsonEncode(sectionType);
    return map;
  }
}
