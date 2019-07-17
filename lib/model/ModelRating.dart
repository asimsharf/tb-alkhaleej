class ModelRating {
  String id;
  Client client;
  Logo logo;
  String center;
  double rate;
  String comment;
  double total;

  ModelRating({this.id,
    this.client,
    this.logo,
    this.center,
    this.rate,
    this.comment,
    this.total});

  factory ModelRating.fromJson(Map<String, dynamic> json) {
    return ModelRating(
      id: json['_id'] as String,
      client: Client.fromJson(json['client']),
      logo: Logo.fromJson(json['logo']),
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

class Logo {
  final String filename;
  final int size;
  final String mimetype;
  final String path;
  final String originalname;
  final String url;

  Logo({this.filename,
    this.size,
    this.mimetype,
    this.path,
    this.originalname,
    this.url});

  factory Logo.fromJson(Map<String, dynamic> json) {
    return Logo(
      filename: json['filename'] as String,
      size: json['size'] as int,
      mimetype: json['mimetype'] as String,
      path: json['path'] as String,
      originalname: json['originalname'] as String,
      url: json['url'] as String,
    );
  }
}
