class Borrow {
  DateTime? sDate;
  DateTime? eDate;
  DateTime? reDate;
  String? notes;
  String? supervisor;
  String? course;
  int? level;
  String? state;
  String? fNumber;

  Borrow(
      {this.sDate,
      this.eDate,
      this.reDate,
      this.notes,
      this.supervisor,
      this.course,
      this.level,
      this.state,
      this.fNumber})
      : super();

  Borrow.fromJson(Map<String, dynamic> json) {
    sDate = json['sDate'];
    eDate = json['eDate'];
    reDate = json['reDate'];
    notes = json['notes'];
    supervisor = json['supervisor'];
    course = json['course'];
    level = json['level'];
    state = json['state'];
    fNumber = json['fNumber'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['sDate'] = sDate;
    map['eDate'] = eDate;
    map['reDate'] = reDate;
    map['notes'] = notes;
    map['supervisor'] = supervisor;
    map['course'] = course;
    map['level'] = level;
    map['state'] = state;
    map['fNumber'] = fNumber;
    return map;
  }
}
