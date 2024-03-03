class ResponseModel {
  final int statusCode;
  final String message;
  final dynamic data;

  ResponseModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });
}
