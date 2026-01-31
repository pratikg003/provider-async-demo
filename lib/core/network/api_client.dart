import 'package:http/http.dart' as http;

class ApiClient {
  String? _token;

  void updateToken(String? token){
    _token = token;
  }

  Future<http.Response> get(String url, {Map<String, String>? headers}) {
    return http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'Application/json',
        'Content-type': 'Application/json',
        if(_token != null) 'Authorization' : 'Bearer $_token',
      },
    );
  }
}
