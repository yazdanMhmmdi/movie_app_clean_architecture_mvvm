class ServerException implements Exception {
  String? message;
  ServerException({this.message});
}

class CacheException implements Exception {
  String? message;
  CacheException({this.message});
}