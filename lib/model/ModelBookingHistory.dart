class ModelBookingHistory {
  String id;
  String hospital;
  String department = '';
  Client client;
  String city = '';
  String insurance = '';
  String date;

  ModelBookingHistory({
    this.id,
    this.hospital,
    this.department,
    this.client,
    this.city,
    this.insurance,
    this.date,
  });

  factory ModelBookingHistory.fromJson(Map<String, dynamic> json) {
    return ModelBookingHistory(
      id: json['_id'] as String,
      hospital: json['hospital'] as String,
      department: json['department'] as String,
      client: Client.fromJson(json['client']),
      city: json['city'] as String,
      insurance: json['Insurance'] as String,
      date: json['date'] as String,
    );
  }
}

class Client {
  String first = '';
  String last = '';

  Client({this.first, this.last});

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      first: json['first'] as String,
      last: json['last'] as String,
    );
  }
}
