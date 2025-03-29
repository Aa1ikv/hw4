import 'package:hive/hive.dart';

part 'akatsuki_member.g.dart';

@HiveType(typeId: 0)
class AkatsukiMember {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final List<String> images;

  AkatsukiMember({required this.name, required this.images});

  factory AkatsukiMember.fromJson(Map<String, dynamic> json) {
    return AkatsukiMember(
      name: json['name'],
      images: List<String>.from(json['images']),
    );
  }
}