class Cell {
  int? id;
  String? name;

  Cell({this.id, this.name}) : super();

  Cell.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
