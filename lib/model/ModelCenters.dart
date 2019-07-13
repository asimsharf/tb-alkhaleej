class ModelCenters {
  String id;
  String name;
  String email;
  String description;
  String close;
  String open;
  String lat;
  String lang;
  bool isActive;
  bool inviled;
  String center_type;
  Address address;
  Logo logo;
  List<String> city;

  ModelCenters(
      {this.id,
      this.name,
      this.email,
      this.description,
      this.close,
      this.open,
      this.isActive,
      this.inviled,
      this.lat,
      this.lang,
      this.center_type,
      this.address,
      this.logo,
      this.city});

  factory ModelCenters.fromJson(Map<String, dynamic> json) {
    return ModelCenters(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      description: json['description'] as String,
      close: json['close'] as String,
      open: json['open'] as String,
      lat: json['lat'] as String,
      lang: json['lang'] as String,
      isActive: json['isActive'] as bool,
      inviled: json['inviled'] as bool,
      center_type: json['center_type'] as String,
      address: Address.fromJson(json['address']),
      logo: Logo.fromJson(json['logo']),
      city: City(json['city']),
    );
  }

  static List<String> City(city) {
    List<String> City = new List<String>.from(city);
    return City;
  }
}

class Logo {
  final String filename;
  final int size;
  final String mimetype;
  final String path;
  final String originalname;
  final String url;

  Logo(
      {this.filename,
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

class Address {
  final String country;
  final String postcode;
  final String state;
  final String street1;
  final String suburb;

  Address({this.country, this.postcode, this.state, this.street1, this.suburb});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      country: json['country'] as String,
      postcode: json['postcode'] as String,
      state: json['state'] as String,
      street1: json['street1'] as String,
      suburb: json['suburb'] as String,
    );
  }
}
