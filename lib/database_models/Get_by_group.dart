/// payload : [{"id":1,"arabicName":"null","count":100,"slide_number":1,"cupbord":1,"english_name":"null","image":null,"group_name":"Phycology","SectionType":"not found","box-number":1,"ceil_name":"x","family":"Batrachospermaceae","latine_name":"Batrachospermum"},{"id":2,"arabicName":"كيتوفورا","count":100,"slide_number":2,"cupbord":1,"english_name":"null","image":null,"group_name":"Phycology","SectionType":"not found","box-number":1,"ceil_name":"x","family":"Chaetophoraceae","latine_name":"Chaetophora"},{"id":3,"arabicName":"كلادفورا","count":100,"slide_number":3,"cupbord":1,"english_name":"null","image":null,"group_name":"Phycology","SectionType":"not found","box-number":1,"ceil_name":"x","family":"Cladophoraceae","latine_name":"Cladophora"},{"id":4,"arabicName":"دياتومات","count":100,"slide_number":4,"cupbord":1,"english_name":"null","image":null,"group_name":"Phycology","SectionType":"not found","box-number":1,"ceil_name":"x","family":"null","latine_name":"Diatoms"},{"id":4,"arabicName":"دياتومات","count":100,"slide_number":4,"cupbord":1,"english_name":"null","image":null,"group_name":"Phycology","SectionType":"not found","box-number":2,"ceil_name":"x","family":"null","latine_name":"Diatoms"},{"id":5,"arabicName":"دكتيوتا","count":100,"slide_number":5,"cupbord":1,"english_name":"null","image":null,"group_name":"Phycology","SectionType":"not found","box-number":3,"ceil_name":"x","family":"Dictyotaceae","latine_name":"Dictyota"}]

class GetByGroup {
  GetByGroup({
    this.payload,
  });

  GetByGroup.fromJson(dynamic json) {
    if (json['payload'] != null) {
      payload = [];
      json['payload'].forEach((v) {
        payload?.add(Slides.fromJson(v));
      });
    }
  }
  List<Slides>? payload;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (payload != null) {
      map['payload'] = payload?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// arabicName : "null"
/// count : 100
/// slide_number : 1
/// cupbord : 1
/// english_name : "null"
/// image : null
/// group_name : "Phycology"
/// SectionType : "not found"
/// box-number : 1
/// ceil_name : "x"
/// family : "Batrachospermaceae"
/// latine_name : "Batrachospermum"

class Slides {
  int? id;
  String? arabicName;
  int? count;
  int? slideNumber;
  int? cupbord;
  String? englishName;
  dynamic? image;
  String? groupName;
  String? sectionType;
  int? boxnumber;
  String? ceilName;
  String? family;
  String? latineName;
  String?specimen;

  Slides({
    this.id,
    this.arabicName,
    this.count,
    this.slideNumber,
    this.cupbord,
    this.englishName,
    this.image,
    this.groupName,
    this.sectionType,
    this.boxnumber,
    this.ceilName,
    this.family,
    this.latineName,
    this.specimen
  });

  Slides.fromJson(dynamic json) {
    id = json['id'];
    arabicName = json['arabicName'];
    count = json['count'];
    slideNumber = json['slide_number'];
    cupbord = json['cupbord'];
    englishName = json['english_name'];
    image = json['image'];
    groupName = json['group_name'];
    sectionType = json['SectionType'];
    boxnumber = json['box-number'];
    ceilName = json['ceil_names'];
    family = json['family'];
    latineName = json['latine_name'];
    specimen= json['specimen'];
  }

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
    map['box-number'] = boxnumber;
    map['ceil_names'] = ceilName;
    map['family'] = family;
    map['latine_name'] = latineName;
    map['specimen']= specimen;
    return map;
  }
}
