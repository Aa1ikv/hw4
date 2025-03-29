import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/akatsuki_member.dart'; // Импорт модели

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(AkatsukiMemberAdapter()); // Теперь адаптер доступен

  await Hive.openBox<AkatsukiMember>('akatsuki_members');

  runApp(const MyApp());
}