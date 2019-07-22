class ModelInsurance {
  String id;
  String name;
  Logo logo;

  ModelInsurance({
    this.id,
    this.name,
    this.logo,
  });

  factory ModelInsurance.fromJson(Map<String, dynamic> json) {
    return ModelInsurance(
      id: json['_id'] as String,
      name: json['name'] as String,
      logo: Logo.fromJson(json['logo']),
    );
  }
}

class Logo {
  String filename;
  int size;
  String mimetype;
  String path;
  String originalname;
  String url;

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
