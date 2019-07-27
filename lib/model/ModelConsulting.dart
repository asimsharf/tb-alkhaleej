class ModelConsulting {
  final String id;
  final String name;
  final String email;
  final String description;
  final String close;
  final String open;
  final String lat;
  final String lang;
  final bool isActive;
  final bool inviled;
  String centerType;
  final Address address;
  final Logo logo;
  final List<dynamic> committee;
  final List<dynamic> days;

  ModelConsulting({
    this.id,
    this.name,
    this.email,
    this.description,
    this.close,
    this.open,
    this.isActive,
    this.inviled,
    this.lat,
    this.lang,
    this.centerType,
    this.address,
    this.logo,
    this.committee,
    this.days,
  });

  factory ModelConsulting.fromJson(Map<String, dynamic> json) {
    return ModelConsulting(
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
      centerType: json['center_type'] as String,
      address: Address.fromJson(json['address']),
      logo: Logo.fromJson(json['logo']),
      committee: _committee(json['committee']),
      days: _days(json['days']),
    );
  }

  static List<dynamic> _committee(committee) {
    List<dynamic> _committee = new List<dynamic>.from(committee);
    return _committee;
  }

  static List<dynamic> _days(days) {
    List<dynamic> _days = new List<dynamic>.from(days);
    return _days;
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
