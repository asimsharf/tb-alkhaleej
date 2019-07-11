class ModelCountry {
  int id;
  String ar_title;
  String en_title;
  String code;

  ModelCountry({this.id, this.ar_title, this.en_title, this.code});

  factory ModelCountry.fromJson(Map<String, dynamic> json) {
    return ModelCountry(
      id: json['id'] as int,
      ar_title: json['ar_title'] as String,
      en_title: json['en_title'] as String,
      code: json['code'] as String,
    );
  }
}
