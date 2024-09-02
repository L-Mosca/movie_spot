import 'dart:convert';

import 'package:movie_spot/data/remote/base_client.dart';
import 'package:movie_spot/utils/constants/api_constants.dart';

class AppClient extends BaseClient {
  late final String _apiKey;
  late final String _apiToken;

  AppClient._(this._apiKey, this._apiToken);

  static Future<AppClient> create() async {
    final keysLoader = KeysLoader();
    final keys = await keysLoader.load();
    return AppClient._(keys.apiKey, keys.apiToken);
  }

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
