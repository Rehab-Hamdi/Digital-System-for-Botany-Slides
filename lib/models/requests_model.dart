class Request
{
  final String ssn;
  final String name;
  final String email;
  final String slideName;
  final String date;

  Request({
    required this.ssn,
    required this.name,
    required this.email,
    required this.slideName,
    required this.date,
  });

  // Define a named constructor to create a Request object from a JSON map
  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      ssn: json['ssn'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      slideName: json['slideName'] as String,
      date: json['date'] as String,
    );
  }
}