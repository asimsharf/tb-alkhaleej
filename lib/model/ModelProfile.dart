// To parse this JSON data, do
//
//     final ModelProfile = ModelProfileFromJson(jsonString);

import 'dart:convert';

ModelProfile ModelProfileFromJson(String str) =>
    ModelProfile.fromJson(json.decode(str));

String ModelProfileToJson(ModelProfile data) => json.encode(data.toJson());

class ModelProfile {
  int code;
  Profile profile;

  ModelProfile({
    this.code,
    this.profile,
  });

  factory ModelProfile.fromJson(Map<String, dynamic> json) => new ModelProfile(
        code: json["code"],
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "profile": profile.toJson(),
      };
}

class Profile {
  String id;
  String password;
  String email;
  int v;
  DateTime birthDay;
  String boold;
  String gender;
  String status;
  int phone;
  DateTime resetPasswordExpires;
  Avatar avatar;
  Name name;

  Profile({
    this.id,
    this.password,
    this.email,
    this.v,
    this.birthDay,
    this.boold,
    this.gender,
    this.status,
    this.phone,
    this.resetPasswordExpires,
    this.avatar,
    this.name,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => new Profile(
        id: json["_id"],
        password: json["password"],
        email: json["email"],
        v: json["__v"],
        birthDay: DateTime.parse(json["birth_day"]),
        boold: json["boold"],
        gender: json["gender"],
        status: json["status"],
        phone: json["phone"],
        resetPasswordExpires: DateTime.parse(json["reset_password_expires"]),
        avatar: Avatar.fromJson(json["avatar"]),
        name: Name.fromJson(json["name"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "password": password,
        "email": email,
        "__v": v,
        "birth_day": birthDay.toIso8601String(),
        "boold": boold,
        "gender": gender,
        "status": status,
        "phone": phone,
        "reset_password_expires": resetPasswordExpires.toIso8601String(),
        "avatar": avatar.toJson(),
        "name": name.toJson(),
      };
}

class Avatar {
  String filename;
  int size;
  String mimetype;
  String path;
  String originalname;
  String url;

  Avatar({
    this.filename,
    this.size,
    this.mimetype,
    this.path,
    this.originalname,
    this.url,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => new Avatar(
        filename: json["filename"],
        size: json["size"],
        mimetype: json["mimetype"],
        path: json["path"],
        originalname: json["originalname"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "filename": filename,
        "size": size,
        "mimetype": mimetype,
        "path": path,
        "originalname": originalname,
        "url": url,
      };
}

class Name {
  String last;
  String first;

  Name({
    this.last,
    this.first,
  });

  factory Name.fromJson(Map<String, dynamic> json) => new Name(
        last: json["last"],
        first: json["first"],
      );

  Map<String, dynamic> toJson() => {
        "last": last,
        "first": first,
      };
}
