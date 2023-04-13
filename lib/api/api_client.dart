import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:pca_web/router/router.dart';
import 'package:pca_web/services/services.dart';
import 'package:pca_web/tools/tools.dart';

String _baseUrl = 'https://dev.api.iqstart.mx';
// String _baseUrl = 'https://qa.api.iqstart.mx';

UserPreference _preference = UserPreference();

enum ApiStatus { success, error, validation, forbidden }

int _successApiStatus = 202;
int _errorApiStatus = 400;
int _validationApiStatus = 406;
int _forbiddenApiStatus = 403;

Dio _dio = Dio(
  BaseOptions(
      baseUrl: _baseUrl,
      validateStatus: (status) {
        if (status == _forbiddenApiStatus) {
          _preference.token = '';
        }
        return true;
      }),
);

Map<String, String> _headers({Map<String, String>? headers}) {
  var thirdMap = {
    'content-Type': 'application/json',
    'authorization': "Bearer ${_preference.token}"
  };
  try {
    if (headers != null) {
      thirdMap.addAll(headers);
    }
    // ignore: empty_catches
  } catch (e) {}
  return thirdMap;
}

class API {
  static Future<ApiResponse> get(String path,
      {Map<String, dynamic>? data}) async {
    ApiResponse response = ApiResponse(await _dio.get(path,
        queryParameters: data, options: Options(headers: _headers())));
    return response;
  }

  static Future<ApiResponse> post(String path,
      {dynamic data, Map<String, String> headers = const {}}) async {
    if (data.runtimeType.toString() == 'Uint8List') {
      final resp = await http.post(
        Uri.parse(_baseUrl + path),
        headers: _headers(headers: {
          'content-Type': headers['content-Type'] ??
              lookupMimeType('', headerBytes: data).toString(),
          'Accept': "*/*",
          'Content-Length': data.length.toString(),
          'Connection': 'keep-alive',
          'User-Agent': 'ClinicPlush'
        }),
        body: data,
      );
      return ApiResponse.fromHttp(resp);
    } else {
      data = _prepareRequest(data);
      ApiResponse response = ApiResponse(await _dio.post(path,
          data: data, options: Options(headers: _headers(headers: headers))));
      return response;
    }
  }
}

class ApiResponse {
  int status = _successApiStatus;
  String message = '';
  dynamic body = {};
  String bodyJson = '{}';
  dynamic headers;
  ApiStatus apiStatus = ApiStatus.success;
  Uint8List? data;

  bool get isSucess {
    return apiStatus == ApiStatus.success;
  }

  ApiResponse.fromHttp(dynamic httpResponse) {
    try {
      data = httpResponse.bodyBytes;
      var decodedResponse =
          jsonDecode(utf8.decode(httpResponse.bodyBytes)) as Map;
      status = decodedResponse['status'] ?? _errorApiStatus;
      message = decodedResponse['detail'] ?? '';
      bodyJson = jsonEncode(decodedResponse['body'] ?? '{}');
      body = jsonDecode(bodyJson);
      headers = httpResponse.headers;
      apiStatus = _currentStatus(status);
      if (apiStatus == ApiStatus.validation) {
        NotificationsService.showSnackbar(message);
      }
      if (apiStatus == ApiStatus.forbidden) {
        NavigationService.replaceTo(Flurorouter.anErrorOcurred);
      }
      if (apiStatus == ApiStatus.forbidden) {
        NavigationService.replaceTo(Flurorouter.anErrorOcurred);
      }
    } catch (e) {}
  }
  ApiResponse(Response? response) {
    try {
      status = response!.data['status'] ?? _successApiStatus;
      message = response.data['detail'] ?? '';
      bodyJson = jsonEncode(response.data['body'] ?? '{}');
      body = jsonDecode(bodyJson);
      headers = response.headers;
      apiStatus = _currentStatus(status);
      if (apiStatus == ApiStatus.validation) {
        NotificationsService.showSnackbar(message);
      }
      if (apiStatus == ApiStatus.forbidden) {
        NavigationService.replaceTo(Flurorouter.anErrorOcurred);
      }
      // ignore: empty_catches
    } catch (e) {}
    try {
      data = Uint8List.fromList(response?.data);
      // ignore: empty_catches
    } catch (e) {}
  }
}

ApiStatus _currentStatus(statusCode) {
  if (statusCode == _errorApiStatus) {
    return ApiStatus.error;
  } else if (statusCode == _validationApiStatus) {
    return ApiStatus.validation;
  } else if (statusCode == _forbiddenApiStatus) {
    return ApiStatus.forbidden;
  }
  return ApiStatus.success;
}

dynamic _prepareRequest(elements) {
  try {
    dynamic finalObject = elements;
    try {
      List finalArray = [];
      for (dynamic element in elements) {
        finalArray.add(_prepareRequest(element));
      }
      return finalArray;
    } catch (e) {
      try {
        elements.forEach((k, v) {
          finalObject[k] = _prepareRequest(v);
        });
      } catch (e) {
        if (elements is String) {
          if (elements == '') {
            finalObject = null;
          }
        }
      }
    }
    return finalObject;
  } catch (e) {
    return elements;
  }
}
