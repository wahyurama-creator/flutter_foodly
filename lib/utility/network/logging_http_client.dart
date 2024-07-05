import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoggingHttpClient extends http.BaseClient {
  final http.Client _inner;

  LoggingHttpClient(this._inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // Log request details
    debugPrint('Request: ${request.method} ${request.url}');
    debugPrint('Headers: ${request.headers}');
    if (request is http.Request) {
      debugPrint('Body: ${request.body}');
    }

    final response = await _inner.send(request);

    // Convert the response stream to bytes and then to a string
    final responseBody = await response.stream.toBytes();
    final bodyString = String.fromCharCodes(responseBody);

    // Log response details
    debugPrint('Response: ${response.statusCode}');
    debugPrint('Headers: ${response.headers}');
    debugPrint('Body: $bodyString');

    // Create a new StreamedResponse with the same headers and status code but with a single-subscription stream
    return http.StreamedResponse(
      Stream.value(responseBody),
      response.statusCode,
      headers: response.headers,
      persistentConnection: response.persistentConnection,
      isRedirect: response.isRedirect,
      reasonPhrase: response.reasonPhrase,
    );
  }
}