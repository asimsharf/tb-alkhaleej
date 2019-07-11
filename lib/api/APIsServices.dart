import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:tb_alkhalij/model/ModelAdmin.dart';
import 'package:tb_alkhalij/model/ModelCard.dart';
import 'package:tb_alkhalij/model/ModelCenters.dart';
import 'package:tb_alkhalij/model/ModelClient.dart';
import 'package:tb_alkhalij/model/ModelDoctors.dart';

class ApiCentersServices {
  static const _serviceUrl = 'http://149.255.57.16:4000/tb_alkhalij/api/center';
  static final _headers = {'Content-Type': 'application/json'};

  Future<ModelCenters> createCenters(ModelCenters modelCenters) async {
    try {
      String json = _toJson(modelCenters);
      final response =
          await http.post(_serviceUrl, headers: _headers, body: json).then(
        (response) {
          print("Response status: ${response.statusCode}");
          print("Response body: ${response.body}");
        },
      );
      var c = _fromJson(response.body);
      return c;
    } catch (e) {
      print('Server Exception!!!');
      print(e);
      return null;
    }
  }

  ModelCenters _fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    var modelCenters = new ModelCenters();
    modelCenters.center_id = map['center_id'];
    modelCenters.admin_id = map['admin_id'];
    modelCenters.center = map['center'];
    modelCenters.type_id = map['type_id'];
    modelCenters.password = map['password'];
    modelCenters.type_ar = map['type_ar'];
    modelCenters.type_en = map['type_en'];
    modelCenters.description = map['description'];
    modelCenters.administrator = map['administrator'];
    modelCenters.identity_number = map['identity_number'];
    modelCenters.email = map['email'];
    modelCenters.address = map['address'];
    modelCenters.longitude = map['longitude'];
    modelCenters.latitude = map['latitude'];
    modelCenters.logo = map['logo'];
    modelCenters.profile = map['profile'];
    modelCenters.open_at = map['open_at'];
    modelCenters.close_at = map['close_at'];
    modelCenters.website = map['website'];
    modelCenters.facebook = map['facebook'];
    modelCenters.google = map['google'];
    modelCenters.phone = map['phone'];
    modelCenters.twitter = map['twitter'];
    modelCenters.linkedin = map['linkedin'];
    modelCenters.license = map['license'];
    modelCenters.country_ar = map['country_ar'];
    modelCenters.country_en = map['country_en'];
    modelCenters.country_code = map['country_code'];
    modelCenters.city_ar = map['city_ar'];
    modelCenters.city_en = map['city_en'];
    modelCenters.city_id = map['city_id'];
    modelCenters.admin_join_date = map['admin_join_date'];
    modelCenters.Expire_from = map['Expire_from'];
    modelCenters.Expire_to = map['Expire_to'];
    modelCenters.join_date = map['join_date'];
    return modelCenters;
  }

  String _toJson(ModelCenters modelCenters) {
    var mapData = new Map();
    mapData["center"] = modelCenters.center;
    mapData["type_id"] = modelCenters.type_id;
    mapData["password"] = modelCenters.password;
    mapData["description"] = modelCenters.description;
    mapData["administrator"] = modelCenters.administrator;
    mapData["identity_number"] = modelCenters.identity_number;
    mapData["email"] = modelCenters.email;
    mapData["address"] = modelCenters.address;
    mapData["longitude"] = modelCenters.longitude;
    mapData["latitude"] = modelCenters.latitude;
    mapData["phone"] = modelCenters.phone;
    mapData["logo"] = modelCenters.logo;
    mapData["open_at"] = modelCenters.open_at;
    mapData["close_at"] = modelCenters.close_at;
    mapData["website"] = modelCenters.website;
    mapData["facebook"] = modelCenters.facebook;
    mapData["google"] = modelCenters.google;
    mapData["twitter"] = modelCenters.twitter;
    mapData["linkedin"] = modelCenters.linkedin;
    mapData["license"] = modelCenters.license;
    mapData["city_id"] = modelCenters.city_id;

    String json = jsonEncode(mapData);
    return json;
  }
}

class ApiEditCentersServices {
  static const _serviceUrl = 'http://149.255.57.16:4000/tb_alkhalij/api/center';
  static final _headers = {'Content-Type': 'application/json'};

  Future<ModelCenters> editCenters(ModelCenters modelCenters) async {
    try {
      String json = _toJson(modelCenters);
      final response =
          await http.post(_serviceUrl, headers: _headers, body: json).then(
        (response) {
          print("Response status: ${response.statusCode}");
          print("Response body: ${response.body}");
        },
      );
      var c = _fromJson(response.body);
      return c;
    } catch (e) {
      print('Server Exception!!!');
      print(e);
      return null;
    }
  }

  ModelCenters _fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    var modelCenters = new ModelCenters();
    modelCenters.center_id = map['center_id'];
    modelCenters.admin_id = map['admin_id'];
    modelCenters.center = map['center'];
    modelCenters.type_id = map['type_id'];
    modelCenters.password = map['password'];
    modelCenters.type_ar = map['type_ar'];
    modelCenters.type_en = map['type_en'];
    modelCenters.description = map['description'];
    modelCenters.administrator = map['administrator'];
    modelCenters.identity_number = map['identity_number'];
    modelCenters.email = map['email'];
    modelCenters.address = map['address'];
    modelCenters.longitude = map['longitude'];
    modelCenters.latitude = map['latitude'];
    modelCenters.logo = map['logo'];
    modelCenters.profile = map['profile'];
    modelCenters.open_at = map['open_at'];
    modelCenters.close_at = map['close_at'];
    modelCenters.website = map['website'];
    modelCenters.facebook = map['facebook'];
    modelCenters.google = map['google'];
    modelCenters.phone = map['phone'];
    modelCenters.twitter = map['twitter'];
    modelCenters.linkedin = map['linkedin'];
    modelCenters.license = map['license'];
    modelCenters.country_ar = map['country_ar'];
    modelCenters.country_en = map['country_en'];
    modelCenters.country_code = map['country_code'];
    modelCenters.city_ar = map['city_ar'];
    modelCenters.city_en = map['city_en'];
    modelCenters.city_id = map['city_id'];
    modelCenters.admin_join_date = map['admin_join_date'];
    modelCenters.Expire_from = map['Expire_from'];
    modelCenters.Expire_to = map['Expire_to'];
    modelCenters.join_date = map['join_date'];
    return modelCenters;
  }

  String _toJson(ModelCenters modelCenters) {
    var mapData = new Map();
    mapData["center"] = modelCenters.center;
    mapData["type_id"] = modelCenters.type_id;
    mapData["password"] = modelCenters.password;
    mapData["description"] = modelCenters.description;
    mapData["administrator"] = modelCenters.administrator;
    mapData["identity_number"] = modelCenters.identity_number;
    mapData["email"] = modelCenters.email;
    mapData["address"] = modelCenters.address;
    mapData["longitude"] = modelCenters.longitude;
    mapData["latitude"] = modelCenters.latitude;
    mapData["phone"] = modelCenters.phone;
    mapData["logo"] = modelCenters.logo;
    mapData["open_at"] = modelCenters.open_at;
    mapData["close_at"] = modelCenters.close_at;
    mapData["website"] = modelCenters.website;
    mapData["facebook"] = modelCenters.facebook;
    mapData["google"] = modelCenters.google;
    mapData["twitter"] = modelCenters.twitter;
    mapData["linkedin"] = modelCenters.linkedin;
    mapData["license"] = modelCenters.license;
    mapData["city_id"] = modelCenters.city_id;

    String json = jsonEncode(mapData);
    return json;
  }
}

class ApiEditAdministratorServices {
  static const _serviceUrl = 'http://149.255.57.16:4000/tb_alkhalij/api/center';
  static final _headers = {'Content-Type': 'application/json'};

  Future<ModelCenters> editAdministrator(ModelCenters modelCenters) async {
    try {
      String json = _toJson(modelCenters);
      final response =
          await http.post(_serviceUrl, headers: _headers, body: json).then(
        (response) {
          print("Response status: ${response.statusCode}");
          print("Response body: ${response.body}");
        },
      );
      var c = _fromJson(response.body);
      return c;
    } catch (e) {
      print('Server Exception!!!');
      print(e);
      return null;
    }
  }

  ModelCenters _fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    var modelCenters = new ModelCenters();
    modelCenters.center_id = map['center_id'];
    modelCenters.admin_id = map['admin_id'];
    modelCenters.center = map['center'];
    modelCenters.type_id = map['type_id'];
    modelCenters.password = map['password'];
    modelCenters.type_ar = map['type_ar'];
    modelCenters.type_en = map['type_en'];
    modelCenters.description = map['description'];
    modelCenters.administrator = map['administrator'];
    modelCenters.identity_number = map['identity_number'];
    modelCenters.email = map['email'];
    modelCenters.address = map['address'];
    modelCenters.longitude = map['longitude'];
    modelCenters.latitude = map['latitude'];
    modelCenters.logo = map['logo'];
    modelCenters.profile = map['profile'];
    modelCenters.open_at = map['open_at'];
    modelCenters.close_at = map['close_at'];
    modelCenters.website = map['website'];
    modelCenters.facebook = map['facebook'];
    modelCenters.google = map['google'];
    modelCenters.phone = map['phone'];
    modelCenters.twitter = map['twitter'];
    modelCenters.linkedin = map['linkedin'];
    modelCenters.license = map['license'];
    modelCenters.country_ar = map['country_ar'];
    modelCenters.country_en = map['country_en'];
    modelCenters.country_code = map['country_code'];
    modelCenters.city_ar = map['city_ar'];
    modelCenters.city_en = map['city_en'];
    modelCenters.city_id = map['city_id'];
    modelCenters.admin_join_date = map['admin_join_date'];
    modelCenters.Expire_from = map['Expire_from'];
    modelCenters.Expire_to = map['Expire_to'];
    modelCenters.join_date = map['join_date'];
    return modelCenters;
  }

  String _toJson(ModelCenters modelCenters) {
    var mapData = new Map();
    mapData["center"] = modelCenters.center;
    mapData["type_id"] = modelCenters.type_id;
    mapData["password"] = modelCenters.password;
    mapData["description"] = modelCenters.description;
    mapData["administrator"] = modelCenters.administrator;
    mapData["identity_number"] = modelCenters.identity_number;
    mapData["email"] = modelCenters.email;
    mapData["address"] = modelCenters.address;
    mapData["longitude"] = modelCenters.longitude;
    mapData["latitude"] = modelCenters.latitude;
    mapData["phone"] = modelCenters.phone;
    mapData["logo"] = modelCenters.logo;
    mapData["open_at"] = modelCenters.open_at;
    mapData["close_at"] = modelCenters.close_at;
    mapData["website"] = modelCenters.website;
    mapData["facebook"] = modelCenters.facebook;
    mapData["google"] = modelCenters.google;
    mapData["twitter"] = modelCenters.twitter;
    mapData["linkedin"] = modelCenters.linkedin;
    mapData["license"] = modelCenters.license;
    mapData["city_id"] = modelCenters.city_id;

    String json = jsonEncode(mapData);
    return json;
  }
}

class ApiAdminServices {
  static const _serviceUrl = 'http://149.255.57.16:4000/tb_alkhalij/api/admin';
  static final _headers = {'Content-Type': 'application/json'};

  Future<ModelAdmin> createCard(ModelAdmin modelAdmin) async {
    try {
      String json = _toJson(modelAdmin);
      final response =
          await http.post(_serviceUrl, headers: _headers, body: json);
      var c = _fromJson(response.body);
      return c;
    } catch (e) {
      print('Server Exception!!!');
      print(e);
      return null;
    }
  }

  ModelAdmin _fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    var modelAdmin = new ModelAdmin();

    modelAdmin.admin_level = map['admin_level'];
    modelAdmin.name = map['name'];
    modelAdmin.identity_number = map['identity_number'];
    modelAdmin.phone = map['phone'];
    modelAdmin.email = map['email'];
    modelAdmin.password = map['password'];
    return modelAdmin;
  }

  String _toJson(ModelAdmin modelAdmin) {
    var mapData = new Map();
    mapData["admin_level"] = modelAdmin.admin_level;
    mapData["name"] = modelAdmin.name;
    mapData["identity_number"] = modelAdmin.identity_number;
    mapData["phone"] = modelAdmin.phone;
    mapData["email"] = modelAdmin.email;
    mapData["password"] = modelAdmin.password;
    String json = jsonEncode(mapData);
    return json;
  }
}

class ApiCardServices {
  static const _serviceUrl = 'http://149.255.57.16:4000/tb_alkhalij/api/card';
  static final _headers = {'Content-Type': 'application/json'};

  Future<ModelCard> createCard(ModelCard modelCard) async {
    try {
      String json = _toJson(modelCard);
      final response =
          await http.post(_serviceUrl, headers: _headers, body: json);
      var c = _fromJson(response.body);
      return c;
    } catch (e) {
      print('???????????????????????????????????????????????????????????????');
      print('#####################Server Exception!!!#######################');
      print(e);
      print('???????????????????????????????????????????????????????????????');
      return null;
    }
  }

  ModelCard _fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    var modelCard = new ModelCard();
    //modelCard.client_id = map['client_id'];
    modelCard.full_name = map['full_name'];
    modelCard.phone = map['phone'];
    modelCard.email = map['email'];
    modelCard.nationality = map['nationality'];
    modelCard.address = map['address'];
    modelCard.gender = map['gender'];
    modelCard.identity_number = map['identity_number'];
    modelCard.birth_date = DateFormat.yMd().parseStrict(map['birth_date']);
    modelCard.city_code = map['city_code'];
    return modelCard;
  }

  String _toJson(ModelCard modelCard) {
    var mapData = new Map();
    //mapData["client_id"] = modelCard.client_id;
    mapData["full_name"] = modelCard.full_name;
    mapData["phone"] = modelCard.phone;
    mapData["email"] = modelCard.email;
    mapData["nationality"] = modelCard.nationality;
    mapData["address"] = modelCard.address;
    mapData["gender"] = modelCard.gender;
    mapData["identity_number"] = modelCard.identity_number;
    mapData["birth_date"] = DateFormat.yMd().format(modelCard.birth_date);
    mapData["city_code"] = modelCard.city_code;
    String json = jsonEncode(mapData);
    return json;
  }
}

class ApiClientServices {
  static const _serviceUrl = 'http://149.255.57.16:4000/tb_alkhalij/api/client';
  static final _headers = {'Content-Type': 'application/json'};

  Future<Model_Client> createClient(Model_Client modelClientinstans) async {
    try {
      String json = _toJson(modelClientinstans);
      final response =
          await http.post(_serviceUrl, headers: _headers, body: json);

      var c = _fromJson(response.body);
      return c;
    } catch (e) {
      print('Server Exception!!!');
      print(e);
      return null;
    }
  }

  Model_Client _fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    var modelClientinstans = new Model_Client();
    modelClientinstans.city_id = map['city_id'];
    modelClientinstans.address_text = map['address_text'];
    modelClientinstans.subscription_number = map['subscription_number'];
    modelClientinstans.identity_number = map['identity_number'];
    modelClientinstans.name = map['name'];
    modelClientinstans.gender = map['gender'];
    modelClientinstans.phone = map['phone'];
    modelClientinstans.email = map['email'];
    modelClientinstans.password = map['password'];
    modelClientinstans.birth_date =
        DateFormat.yMd().parseStrict(map['birth_date']);
    return modelClientinstans;
  }

  String _toJson(Model_Client modelClientinstans) {
    var mapData = new Map();
    mapData["city_id"] = modelClientinstans.city_id;
    mapData["address_text"] = modelClientinstans.address_text;
    mapData["subscription_number"] = modelClientinstans.subscription_number;
    mapData["identity_number"] = modelClientinstans.identity_number;
    mapData["name"] = modelClientinstans.name;
    mapData["gender"] = modelClientinstans.gender;
    mapData["phone"] = modelClientinstans.phone;
    mapData["email"] = modelClientinstans.email;
    mapData["password"] = modelClientinstans.password;
    mapData["birth_date"] =
        DateFormat.yMd().format(modelClientinstans.birth_date);
    String json = jsonEncode(mapData);
    return json;
  }
}

class ApiDoctorsServices {
  static const _serviceUrl = 'http://127.0.0.1:4000/tb_alkhalij/api/doctor';
  static final _headers = {'Content-Type': 'application/json'};

  Future<ModelDoctors> createClient(ModelDoctors modelDoctorsinstans) async {
    try {
      String json = _toJson(modelDoctorsinstans);
      final response =
          await http.post(_serviceUrl, headers: _headers, body: json);
      var c = _fromJson(response.body);
      return c;
    } catch (e) {
      print('Server Exception!!!');
      print(e);
      return null;
    }
  }

  ModelDoctors _fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    var modelDoctorsinstans = new ModelDoctors();
    modelDoctorsinstans.ar_degree = map['ar_degree'];
    modelDoctorsinstans.department_id = map['department_id'];
    modelDoctorsinstans.en_degree = map['en_degree'];
    modelDoctorsinstans.name = map['name'];
    modelDoctorsinstans.phone = map['phone'];
    modelDoctorsinstans.doc_email = map['doc_email'];
    modelDoctorsinstans.gender = map['gender'];
    return modelDoctorsinstans;
  }

  String _toJson(ModelDoctors modelDoctorsinstans) {
    var mapData = new Map();
    mapData["department_id"] = modelDoctorsinstans.department_id;
    mapData["ar_degree"] = modelDoctorsinstans.ar_degree;
    mapData["en_degree"] = modelDoctorsinstans.en_degree;
    mapData["name"] = modelDoctorsinstans.name;
    mapData["phone"] = modelDoctorsinstans.phone;
    mapData["doc_email"] = modelDoctorsinstans.doc_email;
    mapData["gender"] = modelDoctorsinstans.gender;
    String json = jsonEncode(mapData);
    return json;
  }
}

class ApiLoginServices {
  static const _serviceUrl =
      'http://149.255.57.16:4000/tb_alkhalij/api/client_login';
  static final _headers = {'Content-Type': 'application/json'};

  Future<Model_Client> createClients(Model_Client modelClient) async {
    try {
      String json = _toJson(modelClient);
      final response =
          await http.post(_serviceUrl, headers: _headers, body: json);
      var c = _fromJson(response.body);
      return c;
    } catch (e) {
      print('Server Exception!!!');
      print(e);
      return null;
    }
  }

  Model_Client _fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    var modelClient = new Model_Client();
    modelClient.city_id = map['city_id'];
    modelClient.name = map['name'];
    modelClient.address_text = map['address_text'];
    modelClient.ar_country = map['ar_country'];
    modelClient.ar_city = map['ar_city'];
    modelClient.en_city = map['en_city'];
    modelClient.subscription_number = map['subscription_number'];
    modelClient.identity_number = map['identity_number'];
    modelClient.photo = map['photo'];
    modelClient.gender = map['gender'];
    modelClient.phone = map['phone'];
    modelClient.email = map['email'];
    modelClient.birth_date = DateFormat.yMd().parseStrict(map['birth_date']);
    return modelClient;
  }

  String _toJson(Model_Client modelClient) {
    var mapData = new Map();
    mapData["city_id"] = modelClient.city_id;
    mapData["name"] = modelClient.name;
    mapData["address_text"] = modelClient.address_text;
    mapData["ar_country"] = modelClient.ar_country;
    mapData["ar_city"] = modelClient.ar_city;
    mapData["en_city"] = modelClient.en_city;
    mapData["subscription_number"] = modelClient.subscription_number;
    mapData["identity_number"] = modelClient.identity_number;
    mapData["photo"] = modelClient.photo;
    mapData["gender"] = modelClient.gender;
    mapData["phone"] = modelClient.phone;
    mapData["email"] = modelClient.email;
    mapData["birth_date"] = DateFormat.yMd().format(modelClient.birth_date);
    String json = jsonEncode(mapData);
    return json;
  }
}
