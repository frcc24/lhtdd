import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled1/data/data.dart';
import 'package:untitled1/domain/domain.dart';

import 'mocks/mocks.dart';

void main() {
  late HttpClientSpy httpClient;
  late String url;
  late RemoteAuthentication sut;
  final email = faker.internet.email();
  final password = faker.internet.password(length: 10);
  final params = AuthenticationParams(email: email, password: password);

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient with correct values', () async {
    httpClient.mockClientCall(url: url, method: 'post');

    await sut.auth(params);

    verify(() => httpClient.request(
        url: url,
        method: 'post',
        body: {'email': email, 'password': password}));
  });

  test('Should return UnexpectedError if returns 400', () async {
    httpClient.mockClientCallError(HttpError.badRequest);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should return UnexpectedError if returns 404', () async {
    httpClient.mockClientCallError(HttpError.notFound);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should return UnexpectedError if returns 500', () async {
    httpClient.mockClientCallError(HttpError.serverError);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });
}
