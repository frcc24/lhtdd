import '../../../domain/domain.dart';
import '../../data.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({required this.httpClient, required this.url});

  Future<AccountEntity> auth(AuthenticationParams params) async {
    final body = RemoteAuthenticationParams.fromModel(params).toJson();

    try {
      return await httpClient.request(url: url, method: 'post', body: body);
    } on HttpError catch (error) {
      switch (error) {
        case HttpError.unauthorized:
          throw DomainError.invalidCredentials;
        case HttpError.badRequest:
        case HttpError.notFound:
        case HttpError.serverError:
          throw DomainError.unexpected;
      }
    }
  }
}

class RemoteAuthenticationParams {
  final String email;
  final String password;

  RemoteAuthenticationParams({required this.email, required this.password});

  factory RemoteAuthenticationParams.fromModel(AuthenticationParams params) =>
      RemoteAuthenticationParams(
          email: params.email, password: params.password);
  //todo change to API correct names when needed
  Map toJson() => {'email': email, 'password': password};
}
