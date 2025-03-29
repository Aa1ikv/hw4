import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hive/hive.dart';
import '../models/akatsuki_member.dart';

class ApiService {
  Future<List<AkatsukiMember>> fetchAkatsukiMembers() async {
    try {
      final response = await http.get(
        Uri.parse('https://dattebayo-api.onrender.com/akatsuki'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final members = data.map((e) => AkatsukiMember.fromJson(e)).toList();

        // Сохраняем в Hive
        final box = Hive.box<AkatsukiMember>('akatsuki_members');
        await box.clear();
        for (var member in members) {
          await box.add(member);
        }

        return members;
      } else {
        return _getCachedData();
      }
    } catch (e) {
      return _getCachedData();
    }
  }

  Future<List<AkatsukiMember>> _getCachedData() async {
    final box = Hive.box<AkatsukiMember>('akatsuki_members');
    if (box.isNotEmpty) {
      return box.values.toList();
    } else {
      throw Exception('Нет кэшированных данных');
    }
  }
}