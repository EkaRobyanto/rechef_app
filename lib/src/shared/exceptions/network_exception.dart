class NetworkException implements Exception {
  final String errors;

  NetworkException(this.errors);
  @override
  String toString() {
    Object? message = errors;
    if (message == '') return "Exception";
    return message.toString();
  }
}


