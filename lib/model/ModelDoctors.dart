class ModelDoctors {
  int center_id;
  int department_id;
  int doc_id;
  String center;
  String center_address;
  String center_website;
  String ar_department;
  String en_department;
  String ar_degree;
  String en_degree;
  String name;
  String phone;
  String doc_email;
  String hire_date;
  int visits_per_day;
  int consult_price;
  String gender;

  ModelDoctors({
    this.center_id,
    this.department_id,
    this.doc_id,
    this.center,
    this.center_address,
    this.center_website,
    this.ar_department,
    this.en_department,
    this.ar_degree,
    this.en_degree,
    this.name,
    this.phone,
    this.doc_email,
    this.hire_date,
    this.visits_per_day,
    this.consult_price,
    this.gender,
  });

  factory ModelDoctors.fromJson(Map<String, dynamic> json) {
    return ModelDoctors(
      center_id: json['center_id'] as int,
      department_id: json['department_id'] as int,
      doc_id: json['doc_id'] as int,
      center: json['center'] as String,
      center_address: json['center_address'] as String,
      center_website: json['center_website'] as String,
      ar_department: json['ar_department'] as String,
      en_department: json['en_department'] as String,
      ar_degree: json['ar_degree'] as String,
      en_degree: json['en_degree'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      doc_email: json['doc_email'] as String,
      hire_date: json['hire_date'] as String,
      visits_per_day: json['visits_per_day'] as int,
      consult_price: json['consult_price'] as int,
      gender: json['gender'] as String,
    );
  }
}
