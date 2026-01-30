import 'package:http/http.dart' as http;

class ApiClient {
  Future<http.Response> get(String url, {Map<String, String>? headers}) {
    return http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'Application/json',
        'Content-type': 'Application/json',
        ...?headers,
      },
    );
  }
}
