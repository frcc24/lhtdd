import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:untitled1/data/http/http.dart';
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

    var response = Response('', 500);
    try {
      if (method == 'post') {
        response = await client.post(Uri.parse(url),
            headers: headers, body: bodyToSend);
      } else {
        throw HttpError.serverError;
      }
    } catch (error) {
      debugPrint(error.toString());
      throw HttpError.serverError;
    }

    return handleResponse(response);
  }

  Map handleResponse(Response response) {
    //todo change to test with null later
    if (response.statusCode == 200) {
      return response.body.isNotEmpty ? jsonDecode(response.body) : {};
    } else if (response.statusCode == 400) {
      throw HttpError.badRequest;
    } else if (response.statusCode == 500) {
      throw HttpError.serverError;
    } else if (response.statusCode == 401) {
      throw HttpError.unauthorized;
    } else if (response.statusCode == 403) {
      throw HttpError.forbidden;
    } else if (response.statusCode == 404) {
      throw HttpError.notFound;
    } else if (response.statusCode == 204) {
      return {};
    } else {
      throw HttpError.serverError;
    }
  }
}
