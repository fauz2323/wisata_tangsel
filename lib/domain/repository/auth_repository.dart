import '../../data/api/response_model.dart';

abstract class AuthRepository {
  Future<ResponseModel> login(String username, String password);
  Future<ResponseModel> register(
      String username, String name, String email, String password);
  Future<ResponseModel> auth(String token);
  Future<ResponseModel> version();
}
