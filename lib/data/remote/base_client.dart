import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

abstract class BaseClient extends GetxController {
  final HttpClient client = HttpClient();

  Future<String> get(String url, {Map<String, String>? headers});
  Future<String> post(String url, {Map<String, String>? headers, dynamic body});
  Future<String> put(String url, {Map<String, String>? headers, dynamic body});
  Future<String> delete(String url, {Map<String, String>? headers});

  Future<String> handleResponse(HttpClientResponse response, Uri uri) async {
    final statusCode = response.statusCode;
    final responseBody = await response.transform(utf8.decoder).join();

    if (statusCode < 200 || statusCode >= 300) {
      throw HttpException(
        'Failed request: $statusCode ${response.reasonPhrase}',
        uri: uri,
      );
    }
    return responseBody;
  }

  void close() {
    client.close(force: true);
  }
}
