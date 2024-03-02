class ServerException implements Exception {
  final String exceptionName;
  const ServerException({
    required this.exceptionName,
  });
}
class EmailNotVerifiedException implements Exception{
  
}
