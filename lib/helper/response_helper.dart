import 'dart:convert';
import 'package:http/http.dart' as http;

import '../data/api/response_model.dart';

class ResponseHelper {
  static ResponseModel response(http.Response response) {
    if (response.statusCode == 401) {
      return ResponseModel(
        statusCode: 401,
        message: jsonDecode(response.body)['message'] ?? 'Unauthorized',
        data: jsonDecode(response.body),
      );
    }

    if (response.statusCode == 422) {
      return ResponseModel(
        statusCode: 422,
        message: jsonDecode(response.body)['message'],
        data: jsonDecode(response.body)['message'],
      );
    }

    if (response.statusCode == 200) {
      return ResponseModel(
        statusCode: 200,
        message: jsonDecode(response.body)['message'] ?? 'success',
        data: jsonDecode(response.body),
      );
    }

    if (response.statusCode == 222) {
      return ResponseModel(
        statusCode: 222,
        message: jsonDecode(response.body)['message'] ?? 'success',
        data: jsonDecode(response.body),
      );
    }

    if (response.statusCode == 500) {
      return ResponseModel(
        statusCode: 500,
        message: 'Internal Server Error',
        data: 'Internal Server Error',
      );
    }

    if (response.statusCode == 408) {
      return ResponseModel(
        statusCode: 408,
        message: 'Request Timeout',
        data: 'Request Timeout',
      );
    }

    return ResponseModel(
      statusCode: response.statusCode,
      message: 'unknown error',
      data: jsonDecode(response.body),
    );
  }
}
