/// status : "success"
/// data : [{"id":3,"email":"mahmoud.wa7eed.moh@gmail.com","name":"Mahmoud waheed dahab","arabicName":"كيتوفورا","english_name":"null","requested_at":"2023-05-05 01:33:36","updated_at":"2023-05-15 10:18:22","end_date":"2023-05-16","slide_id":2,"returned_state":1,"returned_date":"2023-05-23","start_date":"2023-05-17","notes":"بيرجعها في معادها"},{"id":4,"email":"mahmoud.waheed.moh@gmail.com","name":"hagar","arabicName":"كيتوفورا","english_name":"null","requested_at":"2023-05-13 09:05:18","updated_at":"2023-05-13 09:05:18","end_date":"2022-05-16","slide_id":2,"returned_state":null,"returned_date":null,"start_date":"2022-05-05","notes":"مفيش"},{"id":6,"email":"omar@gmail.com","name":"Omar Abdelaliem","arabicName":"كيتوفورا","english_name":"null","requested_at":"2023-05-12 19:19:47","updated_at":"2023-05-15 10:32:07","end_date":"2023-05-18","slide_id":2,"returned_state":1,"returned_date":"2023-05-17","start_date":"2023-05-16","notes":"\"تعالى خد الشريحة تانى و تالت و عاشر معلش \""}]

class GetAllRequests {
  GetAllRequests({
      this.status, 
      this.requests,});

  GetAllRequests.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      requests = [];
      json['data'].forEach((v) {
        requests?.add(Requests.fromJson(v));
      });
    }
  }
  String? status;
  List<Requests>? requests;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (requests != null) {
      map['data'] = requests?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// email : "mahmoud.wa7eed.moh@gmail.com"
/// name : "Mahmoud waheed dahab"
/// arabicName : "كيتوفورا"
/// english_name : "null"
/// requested_at : "2023-05-05 01:33:36"
/// updated_at : "2023-05-15 10:18:22"
/// end_date : "2023-05-16"
/// slide_id : 2
/// returned_state : 1
/// returned_date : "2023-05-23"
/// start_date : "2023-05-17"
/// notes : "بيرجعها في معادها"

class Requests {
  Requests({
      this.id, 
      this.email, 
      this.userName,
      this.arabicName, 
      this.englishName, 
      this.requestedAt, 
      this.updatedAt, 
      this.endDate, 
      this.slideId, 
      this.returnedState, 
      this.returnedDate, 
      this.startDate, 
      this.notes,});

  Requests.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    userName = json['name'];
    arabicName = json['arabicName'];
    englishName = json['english_name'];
    requestedAt = json['requested_at'];
    updatedAt = json['updated_at'];
    endDate = json['end_date'];
    slideId = json['slide_id'];
    returnedState = json['returned_state'];
    returnedDate = json['returned_date'];
    startDate = json['start_date'];
    notes = json['notes'];
  }
  int? id;
  String? email;
  String? userName;
  String? arabicName;
  String? englishName;
  String? requestedAt;
  String? updatedAt;
  String? endDate;
  int? slideId;
  int? returnedState;
  String? returnedDate;
  String? startDate;
  String? notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['name'] = userName;
    map['arabicName'] = arabicName;
    map['english_name'] = englishName;
    map['requested_at'] = requestedAt;
    map['updated_at'] = updatedAt;
    map['end_date'] = endDate;
    map['slide_id'] = slideId;
    map['returned_state'] = returnedState;
    map['returned_date'] = returnedDate;
    map['start_date'] = startDate;
    map['notes'] = notes;
    return map;
  }

}