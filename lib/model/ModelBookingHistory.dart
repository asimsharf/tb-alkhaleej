class ModelBookingHistory {
  String id;
  String hospital;
  String department;
  Patient patient;
  Logo logo;
  String city;
  String committee;
  String date;

  ModelBookingHistory({
    this.id,
    this.hospital,
    this.department,
    this.patient,
    this.logo,
    this.city,
    this.committee,
    this.date,
  });

  factory ModelBookingHistory.fromJson(Map<String, dynamic> json) {
    return ModelBookingHistory(
      id: json['_id'] as String,
      hospital: json['hospital'] as String,
      department: json['department'] as String,
      patient: Patient.fromJson(json['patient']),
      logo: Logo.fromJson(json['logo']),
      city: json['city'] as String,
      committee: json['committee'] as String,
      date: json['date'] as String,
    );
  }
}

class Patient {
  String first = '';
  String last = '';

  Patient({this.first, this.last});

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      first: json['first'] as String,
      last: json['last'] as String,
    );
  }
}

class Logo {
  final String filename;
  final int size;
  final String mimetype;
  final String path;
  final String originalname;
  final String url;

  Logo({this.filename,
    this.size,
    this.mimetype,
    this.path,
    this.originalname,
    this.url});

  factory Logo.fromJson(Map<String, dynamic> json) {
    return Logo(
      filename: json['filename'] as String,
      size: json['size'] as int,
      mimetype: json['mimetype'] as String,
      path: json['path'] as String,
      originalname: json['originalname'] as String,
      url: json['url'] as String,
    );
  }
}
