import 'dart:convert';
import 'dart:io';
import 'package:flutter_weather_app/core/model/error.dart';
import 'package:flutter_weather_app/core/service/network/exception.dart';
import 'package:http/http.dart';

class APIRequest {
  final Client _client = Client();

  Future<dynamic> get(String endpoint, {bool checkToken = true}) async {
    try {
      final Response response = await _client.get(
        endpoint,
      );
      return await _toJson(response.body);
    } catch (e) {
      final checkConnectivity = await checkInternet();
      if (checkConnectivity == null || !checkConnectivity) {
        throw InternetException();
      } else {
        throw FailureException(ErrorModel(
          message: e.toString(),
        ));
      }
    }
  }

  Future<dynamic> post(String endpoint,
      {Map<String, dynamic> body, bool checkToken = true}) async {
    try {
      final Response response = await _client.post(
        endpoint,
        body: json.encode(body),
      );
      return await _toJson(response.body);
    } on SocketException {
      throw InternetException();
    } catch (e) {
      final checkConnectivity = await checkInternet();
      if (checkConnectivity == null || !checkConnectivity) {
        throw InternetException();
      } else {
        throw FailureException(ErrorModel(
          message: e.toString(),
        ));
      }
    }
  }

  dynamic _toJson(String jsonString) {
    return json.decode(jsonString);
  }

  Future<bool> checkInternet() async {
    bool connect = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result?.isNotEmpty == true &&
          result[0]?.rawAddress?.isNotEmpty == true) {
        connect = true;
      }
    } on SocketException catch (_) {
      connect = false;
    }
    return connect;
  }
}
