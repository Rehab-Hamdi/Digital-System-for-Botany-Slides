import 'fake_users.dart';

class AllUsers {
  List<FakeUsers>? fakeUsers;
  AllUsers({this.fakeUsers});

  AllUsers.fromJson(dynamic json) {
    if (json["fakeUsers"] != null) {
      fakeUsers = [];
      json["fakeUsers"].forEach((v) {
        fakeUsers?.add(FakeUsers.fromJson(v));
      });
    }
  }
}