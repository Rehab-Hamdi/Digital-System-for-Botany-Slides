class Request {
   int? id;
   String name;
   String email;
   String slideName;
   String requestedAt;
   String? updatedAt;
   String? endDate;
   int? slide_id;
   String? notes;
   int? returnedState;
   String? startDate;
   String? returnedDate;

  Request({
    required this.id,
    required this.name,
    required this.email,
    required this.slideName,
    required this.requestedAt,
     this.updatedAt,
     this.endDate,
    this.slide_id,
    this.notes,
    this.returnedState,
    this.startDate,
    this.returnedDate
  });

}