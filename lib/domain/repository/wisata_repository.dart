import 'package:tha_maps/data/api/response_model.dart';

abstract class WisataRepository {
  Future<ResponseModel> getWisata(String token);
  Future<ResponseModel> getDetailWisata(String token, String id);
  Future<ResponseModel> getWisatabyCategory(String token, String id);
  Future<ResponseModel> getCategory(String token);
}
