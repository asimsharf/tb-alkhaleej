class ModelCities {
  int id;
  int country_id;
  String ar_title;
  String en_title;
  String hin_title;
  String ur_title;

  ModelCities(
      {this.id,
      this.country_id,
      this.ar_title,
      this.en_title,
      this.hin_title,
      this.ur_title});

  factory ModelCities.fromJson(Map<String, dynamic> json){
  	return ModelCities(
		  id: json['id'] as int,
		  country_id: json['country_id'] as int,
		  ar_title: json['ar_title'] as String,
		  en_title: json['en_title'] as String,
		  hin_title: json['hin_title'] as String,
		  ur_title: json['ur_title'] as String,
	  );
  }
}
