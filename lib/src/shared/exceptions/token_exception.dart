// ignore_for_file: unnecessary_null_comparison

class TokenException implements Exception {
  final String errors;

  TokenException(this.errors);

  @override
  String toString() {
    Object? message = errors;
    if (message == null) return "Exception";
    return message.toString();
  }
}
