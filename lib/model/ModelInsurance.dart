class ModelInsurance {
  String id;
  String name;

  ModelInsurance({
    this.id,
    this.name,
  });

  factory ModelInsurance.fromJson(Map<String, dynamic> json) {
    return ModelInsurance(
      id: json['_id'] as String,
      name: json['name'] as String,
    );
  }
}
