import 'dart:convert';

import 'package:http/http.dart';
import 'package:untitled1/data/http/http_client.dart';

class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter({required this.client});

  @override
  Future<Map> request(
      {required String url, required String method, Map? body}) async {
    final headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };
    final bodyToSend = body != null ? jsonEncode(body) : null;

    final response =
        await client.post(Uri.parse(url), headers: headers, body: bodyToSend);

    //todo change to test with null later
    if (response.statusCode == 200) {
      return response.body.isNotEmpty ? jsonDecode(response.body) : {};
    } else {
      //todo change to test with null later
      return {};
    }
  }
}
