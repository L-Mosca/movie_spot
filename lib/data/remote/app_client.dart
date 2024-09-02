import 'dart:convert';

import 'package:movie_spot/data/remote/base_client.dart';

class AppClient extends BaseClient {
  @override
  Future<String> get(String url, {Map<String, String>? headers}) async {
    final uri = Uri.parse(url);
    final request = await client.getUrl(uri);

    headers?.forEach((name, value) {
      request.headers.set(name, value);
    });

    final response = await request.close();
    return handleResponse(response, uri);
  }

  @override
  Future<String> post(String url,
      {Map<String, String>? headers, dynamic body}) async {
    final uri = Uri.parse(url);
    final request = await client.postUrl(uri);

    headers?.forEach((name, value) {
      request.headers.set(name, value);
    });

    if (body != null) request.write(jsonEncode(body));
    final response = await request.close();
    return handleResponse(response, uri);
  }

  @override
  Future<String> put(String url,
      {Map<String, String>? headers, dynamic body}) async {
    final uri = Uri.parse(url);
    final request = await client.putUrl(uri);

    headers?.forEach((name, value) {
      request.headers.set(name, value);
    });

    if (body != null) request.write(jsonEncode(body));
    final response = await request.close();
    return handleResponse(response, uri);
  }

  @override
  Future<String> delete(String url, {Map<String, String>? headers}) async {
    final uri = Uri.parse(url);
    final request = await client.deleteUrl(uri);

    headers?.forEach((name, value) {
      request.headers.set(name, value);
    });

    final response = await request.close();
    return handleResponse(response, uri);
  }
}
