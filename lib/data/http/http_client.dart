import '../../domain/entities/entities.dart';

abstract class HttpClient {
  Future<AccountEntity>? request(
      {required String url, required String method, Map body});
}
