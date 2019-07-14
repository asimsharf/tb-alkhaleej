import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tb_alkhalij/model/ModelCenters.dart';

class ApiCentersServices {
  static const _serviceUrl = 'http://23.111.185.155:3000/api/hospital';
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
    modelCenters.id = map['id'];
    modelCenters.name = map['name'];
    modelCenters.email = map['email'];
    modelCenters.description = map['description'];
    modelCenters.address = map['address'];
    modelCenters.open = map['open_at'];
    modelCenters.close = map['close_at'];
    return modelCenters;
  }

  String _toJson(ModelCenters modelCenters) {
    var mapData = new Map();
    mapData["_id"] = modelCenters.id;
    mapData["name"] = modelCenters.name;
    mapData["email"] = modelCenters.email;
    mapData["description"] = modelCenters.description;
    mapData["address"] = modelCenters.address;

    String json = jsonEncode(mapData);
    return json;
  }
}
