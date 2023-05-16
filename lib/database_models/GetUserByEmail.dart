/// id : 8
/// name : "Rehab Hamdy"
/// email : "rehab25@gmail.com"
/// phone : "01151008878"
/// type : "student"
/// ssn : "32165498745"
/// blocked : 1
/// created_at : "2023-05-12T12:50:35.000000Z"
/// updated_at : "2023-05-15T10:18:53.000000Z"
/// email_verified_at : null

class GetUserByEmail {
  GetUserByEmail({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.type,
    this.ssn,
    this.blocked,
    this.createdAt,
    this.updatedAt,
    this.emailVerifiedAt,
    this.message,
  });

  GetUserByEmail.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
    ssn = json['ssn'];
    blocked = json['blocked'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    emailVerifiedAt = json['email_verified_at'];
    message = json['message'];
  }
  int? id;
  String? name;
  String? email;
  String? phone;
  String? type;
  String? ssn;
  int? blocked;
  String? createdAt;
  String? updatedAt;
  dynamic emailVerifiedAt;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['type'] = type;
    map['ssn'] = ssn;
    map['blocked'] = blocked;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['email_verified_at'] = emailVerifiedAt;
    map['message'] = message;
    return map;
  }
}
