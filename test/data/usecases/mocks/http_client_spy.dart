import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled1/data/http/http.dart';
import 'package:untitled1/domain/domain.dart';

class HttpClientSpy extends Mock implements HttpClient {
  void mockClientCall(
          {required String url, required String method, Map? body}) =>
      when(() => request(url: url, method: method, body: body ?? {}))
          .thenAnswer((_) async => AccountEntity(token: faker.guid.guid()));

  void mockClientCallError(HttpError error) => when(() => request(
      url: any(named: 'url'),
      method: any(named: 'method'),
      body: any(named: 'body'))).thenThrow(error);
}
