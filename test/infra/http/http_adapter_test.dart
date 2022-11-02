import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled1/infra/http/http_adapter.dart';

void main() async {
  late HttpAdapter sut;
  late ClientSpy client;
  late String url;

  setUp(() {
    registerFallbackValue(Uri.parse(faker.internet.httpUrl()));
    client = ClientSpy();
    sut = HttpAdapter(client: client);
    url = faker.internet.httpUrl();
  });

  group('post | ', () {
    test('Should call post with correct values', () async {
      when(() => client.post(any(),
              headers: any(named: 'headers'), body: any(named: 'body')))
          .thenAnswer((_) async => Response('{"anyKey": "anyValue"}', 200));

      await sut.request(url: url, method: 'post');

      verify(() => client.post(
            Uri.parse(url),
            headers: {
              'content-type': 'application/json',
              'accept': 'application/json',
            },
          )).called(1);
    });

    test('Should call post without body ', () async {
      when(() => client.post(any(),
              headers: any(named: 'headers'), body: any(named: 'body')))
          .thenAnswer((_) async => Response('{"anyKey": "anyValue"}', 200));

      await sut.request(url: url, method: 'post');

      verify(() => client.post(
            any(),
            headers: any(named: 'headers'),
          )).called(1);
    });

    test('Should call post with correct values with body', () async {
      // client.clientResponse(200);

      when(() => client.post(any(),
              headers: any(named: 'headers'), body: any(named: 'body')))
          .thenAnswer((_) async => Response('{"anyKey": "anyValue"}', 200));

      await sut.request(url: url, method: 'post', body: {'anyKey': 'anyValue'});

      verify(() => client.post(Uri.parse(url),
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json',
          },
          body: any(named: 'body'))).called(1);
    });

    test('Should return data if response = 200 ', () async {
      when(() => client.post(any(),
              headers: any(named: 'headers'), body: any(named: 'body')))
          .thenAnswer((_) async => Response('{"anyKey": "anyValue"}', 200));

      final response = await sut.request(url: url, method: 'post');

      expect(response, {'anyKey': 'anyValue'});
    });

    test('Should return null/empty if response = 204 with data', () async {
      when(() => client.post(any(),
              headers: any(named: 'headers'), body: any(named: 'body')))
          .thenAnswer((_) async => Response('{"anyKey": "anyValue"}', 204));

      final response = await sut.request(url: url, method: 'post');

      expect(response, {});
    });

    test('Should return empty/ornull if response = 204 with no data', () async {
      when(() => client.post(any(),
          headers: any(named: 'headers'),
          body: any(named: 'body'))).thenAnswer((_) async => Response('', 204));

      final response = await sut.request(url: url, method: 'post');

      //todo test with null later
      expect(response, {});
    });

    test('Should return empty/ornull if response = 200 with no data', () async {
      when(() => client.post(any(),
          headers: any(named: 'headers'),
          body: any(named: 'body'))).thenAnswer((_) async => Response('', 200));

      final response = await sut.request(url: url, method: 'post');

      //todo test with null later
      expect(response, {});
    });
  });
}

class ClientSpy extends Mock implements Client {}
