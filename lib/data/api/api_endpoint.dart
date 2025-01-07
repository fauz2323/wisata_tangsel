class ApiEndpoint {
  static String baseUrl = "http://pesonakabupaten.site/";

  static Uri login = Uri.parse("$baseUrl/api/login");
  static Uri register = Uri.parse("$baseUrl/api/register");
  static Uri getCategory = Uri.parse("$baseUrl/api/wisata/category");
  static Uri getDetailWisata = Uri.parse("$baseUrl/api/wisata/detail");
  static Uri getWisata = Uri.parse("$baseUrl/api/wisata");
  static Uri getWisataByCategory = Uri.parse("$baseUrl/api/wisata/by/category");
  static Uri auth = Uri.parse("$baseUrl/api/auth");
  static Uri version = Uri.parse("$baseUrl/api/version");

  getHeaderGet(var token) {
    Map<String, String> data = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return data;
  }

  getHeaderPost(var token) {
    Map<String, String> data = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return data;
  }
}
