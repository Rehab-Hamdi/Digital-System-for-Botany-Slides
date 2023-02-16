import 'package:our_test_project/models/slide_model.dart';

class Box {
  int? boxId;
  int? boxNumber;
  List<Slide>? slides;

  Box({
    this.boxId,
    this.boxNumber,
    this.slides,
  }) : super();

  Box.fromJson(Map<String, dynamic> json) {
    boxId = json["boxId"];
    boxNumber = json["boxNumber"];
    if (json["slides"] != null) {
      slides = [];
      json["slides"].forEach((v) {
        slides?.add(Slide.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["boxId"] = boxId;
    map["boxNumber"] = boxNumber;
    if (slides != null) {
      map["slides"] = slides?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}