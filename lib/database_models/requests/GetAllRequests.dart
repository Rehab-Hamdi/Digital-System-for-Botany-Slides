/// status : "success"
/// message : ""
/// data : [{"id":3,"email":"ethan.rempel@example.com","name":"Madyson Wyman","arabicName":"كيتوفورا","english_name":"null","requested_at":"2023-05-05 01:33:36","updated_at":"2023-05-05 12:47:02","end_date":"2022-05-05"}]

class GetAllRequests {
  String? status;
  String? message;
  List<Requests>? requests;

  GetAllRequests({
    this.status,
    this.message,
    this.requests,
  });

  GetAllRequests.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      requests = [];
      json['data'].forEach((v) {
        requests?.add(Requests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (requests != null) {
      map['data'] = requests?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 3
/// email : "ethan.rempel@example.com"
/// name : "Madyson Wyman"
/// arabicName : "كيتوفورا"
/// english_name : "null"
/// requested_at : "2023-05-05 01:33:36"
/// updated_at : "2023-05-05 12:47:02"
/// end_date : "2022-05-05"

class Requests {
  int? id;
  String? email;
  String? userName;
  String? arabicName;
  String? englishName;
  String? requestedAt;
  String? updatedAt;
  String? endDate;
  int? slide_id;
  Requests({
    this.id,
    this.email,
    this.userName,
    this.arabicName,
    this.englishName,
    this.requestedAt,
    this.updatedAt,
    this.endDate,
    this.slide_id,
  });

  Requests.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    userName = json['name'];
    arabicName = json['arabicName'];
    englishName = json['english_name'];
    requestedAt = json['requested_at'];
    updatedAt = json['updated_at'];
    endDate = json['end_date'];
    slide_id= json['slide_id'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['requested_at'] = requestedAt;
    map['updated_at'] = updatedAt;
    map['end_date'] = endDate;
    map['slide_id']= slide_id;
    return map;
  }

}
