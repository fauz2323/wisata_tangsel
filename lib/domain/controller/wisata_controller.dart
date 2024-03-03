import 'package:tha_maps/data/api/response_model.dart';
import 'package:tha_maps/domain/repository/wisata_repository.dart';
import 'package:http/http.dart' as http;

import '../../data/api/api_endpoint.dart';
import '../../helper/response_helper.dart';

class WisataController implements WisataRepository {
  @override
  Future<ResponseModel> getCategory(String token) async {
    var request = await http
        .get(
      ApiEndpoint.getCategory,
      headers: ApiEndpoint().getHeaderGet(token),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return http.Response('{"message":"Connection Timeout"}', 408);
    });

    return ResponseHelper.response(request);
  }

  @override
  Future<ResponseModel> getDetailWisata(String token, String id) async {
    Map body = {
      'id': id,
    };
    var request = await http
        .post(
      ApiEndpoint.getDetailWisata,
      body: body,
      headers: ApiEndpoint().getHeaderPost(token),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return http.Response('{"message":"Connection Timeout"}', 408);
    });

    return ResponseHelper.response(request);
  }

  @override
  Future<ResponseModel> getWisata(String token) async {
    var request = await http
        .get(
      ApiEndpoint.getWisata,
      headers: ApiEndpoint().getHeaderGet(token),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return http.Response('{"message":"Connection Timeout"}', 408);
    });

    return ResponseHelper.response(request);
  }

  @override
  Future<ResponseModel> getWisatabyCategory(String token, String id) async {
    Map body = {
      'id': id,
    };
    var request = await http
        .post(
      ApiEndpoint.getWisataByCategory,
      body: body,
      headers: ApiEndpoint().getHeaderPost(token),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return http.Response('{"message":"Connection Timeout"}', 408);
    });

    return ResponseHelper.response(request);
  }
}
