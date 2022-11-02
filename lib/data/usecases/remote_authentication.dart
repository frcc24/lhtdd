import '../../domain/domain.dart';
import '../data.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({required this.httpClient, required this.url});

  Future<AccountEntity?>? auth(AuthenticationParams params) async {
    final body = params.toJson();
    return await httpClient.request(url: url, method: 'post', body: body);
  }
}
