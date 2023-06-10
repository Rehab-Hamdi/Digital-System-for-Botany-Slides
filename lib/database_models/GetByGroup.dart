/// payload : [{"id":1,"arabicName":"باتراخوسبرموم","count":100,"slide_number":1,"cupbord":1,"english_name":"null","image":"","group_name":"Phycology","SectionType":"null","family":"Batrachospermaceae","latine_name":"Batrachospermum","box_numbers":"1","ceil_names":"x"},{"id":2,"arabicName":"كيتوفورا","count":100,"slide_number":2,"cupbord":1,"english_name":"null","image":null,"group_name":"Phycology","SectionType":"null","family":"Chaetophoraceae","latine_name":"Chaetophora","box_numbers":"1","ceil_names":"x"},{"id":3,"arabicName":"كلادفورا","count":100,"slide_number":3,"cupbord":1,"english_name":"null","image":null,"group_name":"Phycology","SectionType":"null","family":"Cladophoraceae","latine_name":"Cladophora","box_numbers":"1","ceil_names":"x"},{"id":4,"arabicName":"دياتومات","count":100,"slide_number":4,"cupbord":1,"english_name":"null","image":null,"group_name":"Phycology","SectionType":"null","family":"null","latine_name":"Diatoms","box_numbers":"1,2","ceil_names":"x"},{"id":5,"arabicName":"دكتيوتا","count":100,"slide_number":5,"cupbord":1,"english_name":"null","image":null,"group_name":"Phycology","SectionType":"null","family":"Dictyotaceae","latine_name":"Dictyota","box_numbers":"3","ceil_names":"x"},{"id":6,"arabicName":"انتيرومورفا","count":100,"slide_number":6,"cupbord":1,"english_name":"nulll","image":null,"group_name":"Phycology","SectionType":"null","family":"Ulvaceae","latine_name":"Enteromorpha","box_numbers":"3","ceil_names":"x"}]

class GetByGroup {
  GetByGroup({
      this.payload,});

  GetByGroup.fromJson(dynamic json) {
    if (json['payload'] != null) {
      payload = [];
      json['payload'].forEach((v) {
        payload?.add(Payload.fromJson(v));
      });
    }
  }
  List<Payload>? payload;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (payload != null) {
      map['payload'] = payload?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// arabicName : "باتراخوسبرموم"
/// count : 100
/// slide_number : 1
/// cupbord : 1
/// english_name : "null"
/// image : ""
/// group_name : "Phycology"
/// SectionType : "null"
/// family : "Batrachospermaceae"
/// latine_name : "Batrachospermum"
/// box_numbers : "1"
/// ceil_names : "x"

class Payload {
  Payload({
      this.id, 
      this.arabicName, 
      this.count, 
      this.slideNumber, 
      this.cupbord, 
      this.englishName, 
      this.image, 
      this.groupName, 
      this.sectionType, 
      this.family, 
      this.latineName, 
      this.boxNumbers, 
      this.ceilNames,
    this.specimen,
  });

  Payload.fromJson(dynamic json) {
    id = json['id'];
    arabicName = json['arabicName'];
    count = json['count'];
    slideNumber = json['slide_number'];
    cupbord = json['cupbord'];
    englishName = json['english_name'];
    image = json['image'];
    groupName = json['group_name'];
    sectionType = json['SectionType'];
    family = json['family'];
    latineName = json['latine_name'];
    boxNumbers = json['box_numbers'];
    ceilNames = json['ceil_names'];
    specimen= json['specimen'];
  }
  int? id;
  String? arabicName;
  int? count;
  int? slideNumber;
  int? cupbord;
  String? englishName;
  String? image;
  String? groupName;
  String? sectionType;
  String? family;
  String? latineName;
  String? boxNumbers;
  String? ceilNames;
  String?specimen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['arabicName'] = arabicName;
    map['count'] = count;
    map['slide_number'] = slideNumber;
    map['cupbord'] = cupbord;
    map['english_name'] = englishName;
    map['image'] = image;
    map['group_name'] = groupName;
    map['SectionType'] = sectionType;
    map['family'] = family;
    map['latine_name'] = latineName;
    map['box_numbers'] = boxNumbers;
    map['ceil_names'] = ceilNames;
    map['specimen']=specimen;
    return map;
  }

}