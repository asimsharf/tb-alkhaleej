class ModelDepartment {
  int center_id;
  int department_id;
  String ar_name;
  String en_name;
  String created_at;
  int visits_per_day;
  int consult_price;

  ModelDepartment(
      {this.center_id,
      this.department_id,
      this.ar_name,
      this.en_name,
      this.created_at,
      this.visits_per_day,
      this.consult_price});

  factory ModelDepartment.fromJson(Map<String, dynamic> json) {
    return ModelDepartment(
      center_id: json['center_id'] as int,
      department_id: json['department_id'] as int,
      ar_name: json['ar_name'] as String,
      en_name: json['en_name'] as String,
      created_at: json['created_at'] as String,
      visits_per_day: json['visits_per_day'] as int,
      consult_price: json['consult_price'] as int,
    );
  }
}
