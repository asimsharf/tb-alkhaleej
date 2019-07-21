class ModelClinicDepartment {
  String id;
  String name;
  String description;
  Image image;

  ModelClinicDepartment({this.id, this.name, this.description, this.image});

  factory ModelClinicDepartment.fromJson(Map<String, dynamic> json) {
    return ModelClinicDepartment(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      image: Image.fromJson(json['image']),
    );
  }
}

class Image {
  final String filename;
  final int size;
  final String mimetype;
  final String path;
  final String originalname;
  final String url;

  Image(
      {this.filename,
      this.size,
      this.mimetype,
      this.path,
      this.originalname,
      this.url});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      filename: json['filename'] as String,
      size: json['size'] as int,
      mimetype: json['mimetype'] as String,
      path: json['path'] as String,
      originalname: json['originalname'] as String,
      url: json['url'] as String,
    );
  }
}
