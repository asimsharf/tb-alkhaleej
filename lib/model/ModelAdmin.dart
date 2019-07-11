class ModelAdmin {
  int id;
  int admin_level;
  String name;
  String identity_number;
  String phone;
  String email;
  String password;

  ModelAdmin(
      {this.id,
      this.admin_level,
      this.name,
      this.identity_number,
      this.phone,
      this.email,
      this.password});

  factory ModelAdmin.fromJson(Map<String, dynamic> json) {
    return ModelAdmin(
      id: json['id'] as int,
      admin_level: json['admin_level'] as int,
      name: json['name'] as String,
      identity_number: json['identity_number'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
}
