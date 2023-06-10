class PlantsModel {
  String? latine_name;
  String? ceilName;
  String? speciman;
  var plant_image;
  int? slide_id;
  int? cupboard;
  int? count;
  String? arabicName;
  String? groupName;
  String? family;
  String? boxNumber;
  int? slideNumber;
  String? sectionType;
  PlantsModel({
    required this.plant_image,
    this.latine_name,
    this.ceilName,
    this.speciman,
    this.slide_id,
    this.arabicName,
    this.groupName,
    this.family,
    this.count,
    this.cupboard,
    this.boxNumber,
    this.slideNumber,
    this.sectionType
  });
}
