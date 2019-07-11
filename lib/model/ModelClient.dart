class Model_Client {
  String city_id;
  String name;
  String address_text;
  String ar_country;
  String ar_city;
  String en_city;
  String subscription_number = '123456789';
  String identity_number;
  String photo;
  String gender;
  String phone;
  String email;
  String password;
  DateTime birth_date;

  Model_Client(
      {this.city_id,
      this.name,
      this.address_text,
      this.ar_country,
      this.ar_city,
      this.subscription_number,
      this.identity_number,
      this.photo,
      this.gender,
      this.phone,
      this.email,
      this.password,
      this.birth_date});

  factory Model_Client.fromJson(Map<String, dynamic> json) {
    return Model_Client(
      city_id: json['city_id'] as String,
      name: json['name'] as String,
      address_text: json['address_text'] as String,
      ar_country: json['ar_country'] as String,
      ar_city: json['ar_city'] as String,
      subscription_number: json['subscription_number'] as String,
      identity_number: json['identity_number'] as String,
      photo: json['photo'] as String,
      gender: json['gender'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      birth_date: json['birth_date'] as DateTime,
    );
  }
}
