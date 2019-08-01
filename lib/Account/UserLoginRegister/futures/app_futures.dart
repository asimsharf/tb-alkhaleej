import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/ApiRequest.dart';
import '../models/base/EventObject.dart';
import '../utils/constants.dart';

///////////////////////////////////////////////////////////////////////////////
Future<double> getTotalRate(String centerId) async {
  String link = "http://23.111.185.155:3000/api/rating/${centerId}/center";
  double totalRating = 0;
  var res = await http
      .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
  if (res.statusCode == 200) {
    var data = json.decode(res.body);

    totalRating += data['total'] as double;
  }
  return totalRating;
}

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
              id: EventConstants.LOGIN_USER_SUCCESSFUL,
              object: responseJson,
              message: 'تمت عمليه الدخول بنجاح');
        } else {
          return new EventObject(
              id: EventConstants.LOGIN_USER_UN_SUCCESSFUL,
              message: 'عفواً خطأ في كلمة المرور او إسم المستخدم!');
        }
      } else {
        return new EventObject(
            id: EventConstants.LOGIN_USER_UN_SUCCESSFUL,
            message: 'عفواً خطأ في كلمة المرور او إسم المستخدم!');
      }
    } else {
      return new EventObject();
    }
  } catch (Exception) {
    return EventObject(id: 0, message: 'Exception !!!!!!!!!!!!!!!!!!');
  }
}

String _toJson(String firstName, String lastName, String gender, String phone,
    String email, String password, String birthDate) {
  var mapData = new Map();
  mapData["name.first"] = firstName;
  mapData["name.last"] = lastName;
  mapData["gender"] = gender;
  mapData["phone"] = phone;
  mapData["email"] = email;
  mapData["password"] = password;
  mapData["birth_day"] = birthDate;
  String json = jsonEncode(mapData);

  return json;
}

String _bookingToJson(String centerId, String departmentId, String patientId,
    String insuranceId, String bookingDateTime) {
  var mapData = new Map();
  mapData["department"] = departmentId;
  mapData["hospital"] = centerId;
  mapData["committee"] = insuranceId;
  mapData["patient"] = patientId;
  mapData["publishedDate"] = bookingDateTime;

  String json = jsonEncode(mapData);

  return json;
}

//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//
Future<EventObject> registerUser(
    String firstName,
    String lastName,
    String gender,
    String phone,
    String email,
    String password,
    String birthDate) async {
  const _serviceUrl = 'http://23.111.185.155:3000/api/client/register';

  final _headers = {'Content-Type': 'application/json'};

  try {
    final response = await http.post(_serviceUrl,
        headers: _headers,
        body: _toJson(
            firstName, lastName, gender, phone, email, password, birthDate));
    print("***********1****************");
    print('##########' +
        _toJson(
            firstName, lastName, gender, phone, email, password, birthDate));
    print(response.body.toString());

    if (response != null) {
      if (response.statusCode == APIResponseCode.SC_OK &&
          response.body != null) {
        Map<String, dynamic> responseJson = json.decode(response.body);

        if (responseJson['code'] == 1) {
          return new EventObject(
              id: EventConstants.LOGIN_USER_SUCCESSFUL,
              object: responseJson,
              message: 'تمت عمليه التسجيل بنجاح');
        } else {
          return new EventObject(
              id: EventConstants.LOGIN_USER_UN_SUCCESSFUL,
              message: 'عفواً خطأ في كلمة المدخلات');
        }
      } else {
        return new EventObject(
            id: EventConstants.LOGIN_USER_UN_SUCCESSFUL,
            message: 'عفواً خطأ في المدخلات ');
      }
    } else {
      return new EventObject();
    }
  } catch (Exception) {
    return EventObject(id: 0);
  }
}

///////////////////////////////////////////////////////////////////////////////
Future<EventObject> changePassword(
    String emailId, String oldPassword, String newPassword) async {
  ApiRequest apiRequest = new ApiRequest();
  apiRequest.operation = APIOperations.CHANGE_PASSWORD;
  try {
    final encoding = APIConstants.OCTET_STREAM_ENCODING;
    final response = await http.post(
        'http://23.111.185.155:3000/api/auth/reset_password',
        body: _changePasswordToJson(emailId, oldPassword, newPassword),
        encoding: Encoding.getByName(encoding));

    if (response != null) {
      if (response.statusCode == APIResponseCode.SC_OK &&
          response.body != null) {
        Map<String, dynamic> responseJson = json.decode(response.body);

        if (responseJson['code'] == 1) {
          return new EventObject(
              id: EventConstants.LOGIN_USER_SUCCESSFUL,
              object: responseJson,
              message: 'تمت عمليه الدخول بنجاح');
        } else {
          return new EventObject(
              id: EventConstants.LOGIN_USER_UN_SUCCESSFUL,
              message: 'عفواً خطأ في كلمة المرور او إسم المستخدم!');
        }
      } else {
        return new EventObject(
            id: EventConstants.LOGIN_USER_UN_SUCCESSFUL,
            message: 'عفواً خطأ في كلمة المرور او إسم المستخدم!');
      }
    } else {
      return new EventObject();
    }
  } catch (Exception) {
    return EventObject();
  }
}

///////////////////////////////////////////////////////////////////////////////
String _changePasswordToJson(
    String emailId, String oldPassword, String newPassword) {
  var mapData = new Map();

  mapData["email"] = emailId;
  mapData["password"] = oldPassword;
  mapData["newPassword"] = newPassword;

  String json = jsonEncode(mapData);

  return json;
}

///////////////////////////////////////////////////////////////////////////////
String _upDateToJson(
    String firstName, String lastName, String phone, String email) {
  var mapData = new Map();

  mapData["name.first"] = firstName;
  mapData["name.last"] = lastName;
  mapData["phone"] = phone;
  mapData["email"] = email;

  String json = jsonEncode(mapData);

  return json;
}

//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//

Future<EventObject> patientAppointment(String centerId, String departmentId,
    String patientId, String insuranceId, String bookingDateTime) async {
  const _serviceUrl = 'http://23.111.185.155:3000/api/booking';

  final _headers = {'Content-Type': 'application/json'};

  try {
    final response = await http.post(_serviceUrl,
        headers: _headers,
        body: _bookingToJson(
            centerId, departmentId, patientId, insuranceId, bookingDateTime));
    print("***********1****************");
    print(response.body.toString());

    if (response != null) {
      if (response.statusCode == APIResponseCode.SC_OK &&
          response.body != null) {
        Map<String, dynamic> responseJson = json.decode(response.body);

        if (responseJson['code'] == 1) {
          return new EventObject(
              id: EventConstants.LOGIN_USER_SUCCESSFUL,
              object: responseJson,
              message: 'تمت عمليه الحجز بنجاح');
        } else {
          return new EventObject(
              id: EventConstants.LOGIN_USER_UN_SUCCESSFUL,
              message: 'عفواً خطأ في كلمة المدخلات');
        }
      } else {
        return new EventObject(
            id: EventConstants.LOGIN_USER_UN_SUCCESSFUL,
            message: 'عفواً خطأ في المدخلات ');
      }
    } else {
      return new EventObject();
    }
  } catch (Exception) {
    return EventObject(id: 0);
  }
}

//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//
Future<EventObject> updateUserInfo(String firstName, String lastName,
    String phone, String email, String userId) async {
  String id = '';
  if (userId != null) {
    id = userId;
  }

  final _headers = {'Content-Type': 'application/json'};

  try {
    final response = await http.put(
        'http://23.111.185.155:3000/api/client/' + id + '/update',
        headers: _headers,
        body: _upDateToJson(firstName, lastName, phone, email));
    print("***********1****************");
    print('##########' + _upDateToJson(firstName, lastName, phone, email));
    print(response.body.toString());

    if (response != null) {
      if (response.statusCode == APIResponseCode.SC_OK &&
          response.body != null) {
        Map<String, dynamic> responseJson = json.decode(response.body);

        if (responseJson['code'] == 1) {
          return new EventObject(
              id: EventConstants.LOGIN_USER_SUCCESSFUL,
              object: responseJson,
              message: 'تمت عمليه التسجيل بنجاح');
        } else {
          return new EventObject(
              id: EventConstants.LOGIN_USER_UN_SUCCESSFUL,
              message: 'عفواً خطأ في كلمة المدخلات');
        }
      } else {
        return new EventObject(
            id: EventConstants.LOGIN_USER_UN_SUCCESSFUL,
            message: 'عفواً خطأ في المدخلات ');
      }
    } else {
      return new EventObject();
    }
  } catch (Exception) {
    return EventObject(id: 0);
  }
}
