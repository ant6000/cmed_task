import 'package:http/http.dart' as http;

class FetchCharacter {
  static Future<http.Response> fetchCharacters() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://hp-api.onrender.com/api/characters'),
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json-patch+json',
        },
      );
      return response;
    } catch (e) {
      print('Error fetching trades: $e');
      return http.Response(e.toString(), 500);
    }
  }
}
