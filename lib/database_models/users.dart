/// id : 3
/// name : "Madyson Wyman"
/// email : "ethan.rempel@example.com"
/// phone : "(725) 722-5583"
/// type : "student"
/// ssn : "4"
/// blocked : null
/// created_at : "2023-04-25T16:41:00.000000Z"
/// updated_at : "2023-04-25T16:41:00.000000Z"
/// email_verified_at : "2023-04-25T18:41:00.000000Z"

class Users {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? type;
  String? ssn;
  int? blocked;
  String? createdAt;
  String? updatedAt;
  String? emailVerifiedAt;

  Users({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.type,
    this.ssn,
    this.blocked,
    this.createdAt,
    this.updatedAt,
    this.emailVerifiedAt,
  });

  Users.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    type = json["type"];
    ssn = json["ssn"];
    blocked = json["blocked"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    emailVerifiedAt = json["email_verified_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id.toString();
    map["name"] = name;
    map["email"] = email;
    map["password"] = password;
    map["phone"] = phone;
    map["type"] = type;
    map["ssn"] = ssn;
    map["blocked"] = blocked.toString();
    return map;
  }
}