import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tb_alkhalij/model/ModelRating.dart';

class ApiCentersServices {
  static const _serviceUrl = 'http://23.111.185.155:3000/api/rating';
  static final _headers = {'Content-Type': 'application/json'};

  Future<ModelRating> createCenters(ModelRating modelRateings) async {
    try {
      String json = _toJson(modelRateings);
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

  ModelRating _fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    var modelRateings = new ModelRating();
    modelRateings.id = map['_id'];
    modelRateings.client = map['client'];
    modelRateings.comment = map['comment'];
    modelRateings.rate = map['rate'];

    return modelRateings;
  }

  String _toJson(ModelRating modelRateings) {
    var mapData = new Map();
    mapData["_id"] = modelRateings.id;
    mapData["client"] = modelRateings.client;
    mapData["comment"] = modelRateings.comment;
    mapData["rate"] = modelRateings.rate;

    String json = jsonEncode(mapData);
    return json;
  }
}
