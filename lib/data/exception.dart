class ServerException implements Exception {
  const ServerException(
    this.msg,
  );

  final String msg;
}
