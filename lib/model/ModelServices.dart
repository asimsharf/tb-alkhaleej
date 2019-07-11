class ModelServices {
  int center_id;
  int service_id;
  int price;
  int discount;
  String ar_service;
  String en_service;

  ModelServices({
    this.center_id,
    this.service_id,
    this.price,
    this.discount,
    this.ar_service,
    this.en_service,
  });

  factory ModelServices.fromJson(Map<String, dynamic> json) {
    return ModelServices(
      center_id: json['center_id'] as int,
      service_id: json['service_id'] as int,
      price: json['price'] as int,
      discount: json['discount'] as int,
      ar_service: json['ar_service'] as String,
      en_service: json['en_service'] as String,
    );
  }
}
