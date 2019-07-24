import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/ApiRequest.dart';
import '../models/ApiResponse.dart';
import '../models/User.dart';
import '../models/base/EventObject.dart';
import '../utils/constants.dart';

///////////////////////////////////////////////////////////////////////////////

Future<EventObject> loginUser(String emailId, String password) async {
  String baseurl = 'http://23.111.185.155:3000/api/authenticate/login/';

  try {
    final response = await http.get(baseurl + emailId + '/' + password,
        headers: {"Accept": "application/json"});

    if (response != null) {
      if (response.statusCode == APIResponseCode.SC_OK &&
          response.body != null) {
        Map<String, dynamic> responseJson = json.decode(response.body);

        if (responseJson['code'] == 1) {
          return new EventObject(
              id: EventConstants.LOGIN_USER_SUCCESSFUL, object: responseJson);
        } else {
          return new EventObject(id: EventConstants.LOGIN_USER_UN_SUCCESSFUL);
        }
      } else {
        return new EventObject(id: EventConstants.LOGIN_USER_UN_SUCCESSFUL);
      }
    } else {
      return new EventObject();
    }
  } catch (Exception) {
    return EventObject(id: 0);
  }
}

///////////////////////////////////////////////////////////////////////////////
Future<EventObject> registerUser(String city_id,
    String address_text,
    String identity_number,
    String name,
    String gender,
    String phone,
    String email,
    String password,
    String birth_date) async {
  //router.get('/client/register/:city_id/:address_text/:identity_number/:name/:gender/:phone/:email/:password/:birth_date', client_controller.create_client);
//  http://23.111.185.155:4000/takaful/api/client/register/1/'khartoum'/'1122335'/'adam'/1/'0925505684'/'a@a.com'/'123'/'2019-07-24'
  ApiRequest apiRequest = new ApiRequest();

  try {
    final encoding = APIConstants.OCTET_STREAM_ENCODING;

    final response = await http.get(
        'http://23.111.185.155:4000/takaful/api/client/register/' +
            city_id +
            '/' +
            address_text +
            '/' +
            identity_number +
            '/' +
            name +
            '/' +
            gender +
            '/' +
            phone +
            '/' +
            email +
            '/' +
            password +
            '/' +
            birth_date,
        headers: {"Accept": "application/json"});

    print("***********1****************");
    print(response.body.toString());
    print("***********2****************");
    print(encoding.toString());
    print("***********3****************");
    print(APIConstants.API_BASE_URL.toString());
    print("***********4****************");
    print(json.encode(apiRequest.toJson()).toString());
    print("***********5****************");
    if (response != null) {
      if (response.statusCode == APIResponseCode.SC_OK &&
          response.body != null) {
        final responseJson = json.decode(response.body);
        ApiResponse apiResponse = ApiResponse.fromJson(responseJson);
        if (apiResponse.result == APIOperations.SUCCESS) {
          return new EventObject(
              id: EventConstants.USER_REGISTRATION_SUCCESSFUL, object: null);
        } else if (apiResponse.result == APIOperations.FAILURE) {
          return new EventObject(id: EventConstants.USER_ALREADY_REGISTERED);
        } else {
          return new EventObject(
              id: EventConstants.USER_REGISTRATION_UN_SUCCESSFUL);
        }
      } else {
        return new EventObject(
            id: EventConstants.USER_REGISTRATION_UN_SUCCESSFUL);
      }
    } else {
      return new EventObject();
    }
  } catch (Exception) {
    return EventObject();
  }
}

///////////////////////////////////////////////////////////////////////////////
Future<EventObject> changePassword(
    String emailId, String oldPassword, String newPassword) async {
  ApiRequest apiRequest = new ApiRequest();
  User user = new User(
      email: emailId, old_password: oldPassword, new_password: newPassword);

  apiRequest.operation = APIOperations.CHANGE_PASSWORD;
  apiRequest.user = user;

  try {
    final encoding = APIConstants.OCTET_STREAM_ENCODING;
    final response = await http.post(APIConstants.API_BASE_URL,
        body: json.encode(apiRequest.toJson()),
        encoding: Encoding.getByName(encoding));
    if (response != null) {
      if (response.statusCode == APIResponseCode.SC_OK &&
          response.body != null) {
        final responseJson = json.decode(response.body);
        ApiResponse apiResponse = ApiResponse.fromJson(responseJson);
        if (apiResponse.result == APIOperations.SUCCESS) {
          return new EventObject(
              id: EventConstants.CHANGE_PASSWORD_SUCCESSFUL, object: null);
        } else if (apiResponse.result == APIOperations.FAILURE) {
          return new EventObject(id: EventConstants.INVALID_OLD_PASSWORD);
        } else {
          return new EventObject(
              id: EventConstants.CHANGE_PASSWORD_UN_SUCCESSFUL);
        }
      } else {
        return new EventObject(
            id: EventConstants.CHANGE_PASSWORD_UN_SUCCESSFUL);
      }
    } else {
      return new EventObject();
    }
  } catch (Exception) {
    return EventObject();
  }
}
///////////////////////////////////////////////////////////////////////////////
