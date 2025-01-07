import 'package:tha_maps/data/api/response_model.dart';
import 'package:tha_maps/domain/repository/auth_repository.dart';
import 'package:http/http.dart' as http;
import 'package:tha_maps/helper/response_helper.dart';

import '../../data/api/api_endpoint.dart';

class AuthController implements AuthRepository {
  @override
  Future<ResponseModel> auth(String token) async {
    var request = await http
        .get(
      ApiEndpoint.auth,
      headers: ApiEndpoint().getHeaderGet(token),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return http.Response('{"message":"Connection Timeout"}', 408);
    });

    return ResponseHelper.response(request);
  }

  @override
  Future<ResponseModel> login(String username, String password) async {
    Map body = {
      'username': username,
      'password': password,
    };
    var request = await http
        .post(
      ApiEndpoint.login,
      body: body,
      headers: ApiEndpoint().getHeaderPost('-'),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return http.Response('{"message":"Connection Timeout"}', 408);
    });

    return ResponseHelper.response(request);
  }

  @override
  Future<ResponseModel> register(
      String username, String name, String email, String password) async {
    Map body = {
      'username': username,
      'password': password,
      'name': name,
      'email': email
    };
    var request = await http
        .post(
      ApiEndpoint.register,
      body: body,
      headers: ApiEndpoint().getHeaderPost('-'),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return http.Response('{"message":"Connection Timeout"}', 408);
    });

    return ResponseHelper.response(request);
  }

  @override
  Future<ResponseModel> version() async {
    var request = await http
        .get(
      ApiEndpoint.version,
      headers: ApiEndpoint().getHeaderPost('-'),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return http.Response('{"message":"Connection Timeout"}', 408);
    });

    print(request.body);

    return ResponseHelper.response(request);
  }
}
