
import 'package:our_test_project/database_models/slide_celis_model.dart';

import 'borrow_model.dart';

class Slide {
  int? id;
  String? arabicName;
  int? count;
  int? slideNo;
  int? cupBoard;
  String? engName;
  List<Cell>? cells = [];
  List<Borrow>? borrowList = [];

  Slide(
      {this.arabicName, this.count, this.slideNo, this.cupBoard, this.engName})
      : super();

  Slide.fromJson(Map<String, dynamic> json) {
    arabicName = json["arabicName"];
    count = json['count'];
    slideNo = json['slideNo'];
    cupBoard = json['cupBoard'];
    engName = json['engName'];
    if (json["cells"] != null) {
      cells = [];
      json["cells"].forEach((v) {
        cells?.add(Cell.fromJson(v));
      });

      if (json["borrowList"] != null) {
        borrowList = [];
        json["borrowList"].forEach((v) {
          borrowList?.add(Borrow.fromJson(v));
        });
      }
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["arabicName"] = arabicName;
    map["count"] = count;
    map["slideNo"] = slideNo;
    map["cupBoard"] = cupBoard;
    map["engName"] = engName;

    if (cells != null) {
      map["cells"] = cells?.map((v) => v.toJson()).toList();
    }

    if (borrowList != null) {
      map["borrowList"] = borrowList?.map((v) => v.toJson()).toList();
    }

    return map;
  }
}
