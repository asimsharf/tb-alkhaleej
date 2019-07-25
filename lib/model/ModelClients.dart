class ModelClients {
  Profile profile;

  ModelClients({
    this.profile,
  });
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
}

class Name {
  String last;
  String first;

  Name({
    this.last,
    this.first,
  });
}
