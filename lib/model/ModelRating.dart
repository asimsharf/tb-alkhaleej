class ModelRating {
  String id;
  Client client;
  String center;
  double rate;
  String comment;
  double total;

  ModelRating(
      {this.id, this.client, this.center, this.rate, this.comment, this.total});

  factory ModelRating.fromJson(Map<String, dynamic> json) {
    return ModelRating(
      id: json['_id'] as String,
      client: Client.fromJson(json['client']),
      center: json['center'] as String,
      rate: json['rate'] as double,
      comment: json['comment'] as String,
      total: json['total'] as double,
    );
  }
}

class Client {
  String first;
  String last;

  Client({this.first, this.last});

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(first: json['first'] as String, last: json['last'] as String);
  }
}
