
import 'package:our_test_project/models/slide_model.dart';

class SpecialGroup extends Slide {
  int? specialId;
  String? specimen;

  SpecialGroup({this.specialId, this.specimen});

  SpecialGroup.formJson(Map<String, dynamic> json) {
    specialId = json["specialId"];
    specimen = json["specimen"];
  }

  @override
  Map<String, dynamic> toJson() {
    return {'specialId': specialId, 'specimen': specimen};
  }
}
