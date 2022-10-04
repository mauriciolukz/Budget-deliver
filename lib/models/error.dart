class Error{

  final int statusCode;
  final String message;
  final String error;

  Error({
    required this.statusCode,
    required this.message,
    required this.error,
  });

  factory Error.fromJson(dynamic json) {
    return Error(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
      error: json['error'] as String,
    );
  }

}