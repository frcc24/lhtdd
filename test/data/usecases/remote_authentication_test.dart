import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled1/domain/domain.dart';
import 'package:untitled1/usecases/usecases.dart';

void main() {
  late HttpClientSpy httpClient;
  late String url;
  late RemoteAuthentication sut;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient with correct values', () async {
    final email = faker.internet.email();
    final password = faker.internet.password(length: 10);

    await sut.auth(AuthenticationParams(email: email, password: password));

    verify(() => httpClient.request(
        url: url,
        method: 'post',
        body: {'email': email, 'password': password})).called(1);
  });
}

class HttpClientSpy extends Mock implements HttpClient {}

abstract class HttpClient {
  Future<AccountEntity>? request(
      {required String url, required String method, Map body});
}

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({required this.httpClient, required this.url});

  Future<AccountEntity?>? auth(AuthenticationParams params) async {
    final body = {'email': params.email, 'password': params.password};
    return await httpClient.request(url: url, method: 'post', body: body);
  }
}
