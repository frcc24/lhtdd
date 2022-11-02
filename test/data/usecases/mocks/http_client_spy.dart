import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled1/data/http/http.dart';

class HttpClientSpy extends Mock implements HttpClient {
  //todo accessToken and name comes from API

  When mockRequest() => when(() => request(
      url: any(named: 'url'),
      method: any(named: 'method'),
      body: any(named: 'body')));

  void mockClientCall(
          {required String url,
          required String method,
          Map? body,
          String? accessToken}) =>
      mockRequest().thenAnswer((_) async =>
          {'accessToken': accessToken, 'name': faker.person.name()});

  void mockClientCallInvalid(
          {required String url,
          required String method,
          Map? body,
          String? accessToken}) =>
      mockRequest().thenAnswer((_) async => {'invalid': 'invalid'});

  void mockClientCallError(HttpError error) => mockRequest().thenThrow(error);
}
