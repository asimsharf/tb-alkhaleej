class ModelSpecialties {
  int center_id;
  int department_id;
  int center_dept_id;
  String center;
  String center_website;
  String center_address;
  String department_ar_name;
  String department_en_name;
  String created_at;
  int visits_per_day;
  int consult_price;

  ModelSpecialties(
      {this.center_id,
      this.department_id,
      this.center_dept_id,
      this.center,
      this.center_website,
      this.center_address,
      this.department_ar_name,
      this.department_en_name,
      this.created_at,
      this.visits_per_day,
      this.consult_price});

  factory ModelSpecialties.fromJson(Map<String, dynamic> json) {
    return ModelSpecialties(
      center_id: json['center_id'] as int,
      department_id: json['department_id'] as int,
      center_dept_id: json['center_dept_id'] as int,
      center: json['center'] as String,
      center_website: json['center_website'] as String,
      center_address: json['center_address'] as String,
      department_ar_name: json['department_ar_name'] as String,
      department_en_name: json['department_en_name'] as String,
      created_at: json['created_at'] as String,
      visits_per_day: json['visits_per_day'] as int,
      consult_price: json['consult_price'] as int,
    );
  }
}
