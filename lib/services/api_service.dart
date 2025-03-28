import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<List<dynamic>> fetchAkatsukiMembers() async {
    final response = await http.get(
      Uri.parse('https://dattebayo-api.onrender.com/akatsuki'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Ошибка загрузки данных');
    }
  }
}