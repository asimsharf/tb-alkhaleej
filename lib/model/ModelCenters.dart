class ModelCenters {
  int center_id;
  int admin_id;
  String type_id;
  String password;
  String center;
  String type_ar;
  String type_en;
  String description;
  String administrator;
  String identity_number;
  String email;
  String address;
  String longitude;
  String latitude;
  String logo;
  String profile;
  String phone;
  String open_at;
  String close_at;
  String website;
  String facebook;
  String google;
  String twitter;
  String linkedin;
  String license;
  String country_ar;
  String country_en;
  String country_code;
  String city_ar;
  String city_en;
  String city_id;
  String admin_join_date;
  String Expire_from;
  String Expire_to;
  String join_date;

  ModelCenters(
      {this.center_id,
      this.admin_id,
      this.type_id,
      this.password,
      this.center,
      this.type_ar,
      this.type_en,
      this.description,
      this.administrator,
      this.identity_number,
      this.email,
      this.address,
      this.longitude,
      this.latitude,
      this.logo,
      this.profile,
      this.open_at,
      this.close_at,
      this.phone,
      this.website,
      this.facebook,
      this.google,
      this.twitter,
      this.linkedin,
      this.license,
      this.country_ar,
      this.country_en,
      this.country_code,
      this.city_ar,
      this.city_en,
      this.city_id,
      this.admin_join_date,
      this.Expire_from,
      this.Expire_to,
      this.join_date});

  factory ModelCenters.fromJson(Map<String, dynamic> json) {
    return ModelCenters(
      center_id: json['center_id'] as int,
      admin_id: json['admin_id'] as int,
      center: json['center'] as String,
      type_ar: json['type_ar'] as String,
      type_en: json['type_en'] as String,
      description: json['description'] as String,
      administrator: json['administrator'] as String,
      identity_number: json['identity_number'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      type_id: json['type_id'] as String,
      address: json['address'] as String,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
      logo: json['logo'] as String,
      profile: json['profile'] as String,
      open_at: json['open_at'] as String,
      close_at: json['close_at'] as String,
      website: json['website'] as String,
      facebook: json['facebook'] as String,
      google: json['google'] as String,
      twitter: json['twitter'] as String,
      linkedin: json['linkedin'] as String,
      license: json['license'] as String,
      country_ar: json['country_ar'] as String,
      country_en: json['country_en'] as String,
      country_code: json['country_code'] as String,
      city_ar: json['city_ar'] as String,
      city_en: json['city_en'] as String,
      admin_join_date: json['admin_join_date'] as String,
      Expire_from: json['Expire_from'] as String,
      Expire_to: json['Expire_to'] as String,
      join_date: json['join_date'] as String,
    );
  }
}
