import 'package:http/http.dart' as http;

class Internetchecker{
  Future<bool> isInternetConnected() async {
  try {
    final response = await http.get(Uri.parse('https://www.google.com'));
    return response.statusCode == 200;
  } catch (e) {
    return false; // Error occurred or internet is not connected
  }
}
}