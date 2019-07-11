class ModelCard {
  int id;
  //int client_id;
  String full_name;
  String phone;
  String email;
  String nationality;
  String address;
  String gender;
  String identity_number;
  DateTime birth_date;
  String city_code;

  ModelCard({
    this.id,
    //this.client_id,
    this.full_name,
    this.phone,
    this.email,
    this.nationality,
    this.address,
    this.gender,
    this.identity_number,
    this.birth_date,
    this.city_code,
  });

  factory ModelCard.fromJson(Map<String, dynamic> json) {
    return ModelCard(
      //client_id: json['client_id'] as int,
      full_name: json['full_name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      nationality: json['nationality'] as String,
      address: json['address'] as String,
      gender: json['gender'] as String,
      identity_number: json['identity_number'] as String,
      birth_date: json['birth_date'] as DateTime,
      city_code: json['city_code'] as String,
    );
  }
}
