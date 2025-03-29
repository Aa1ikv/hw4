import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/member_card.dart';
import '../models/akatsuki_member.dart';

class AkatsukiScreen extends StatefulWidget {
  const AkatsukiScreen({super.key});

  @override
  State<AkatsukiScreen> createState() => _AkatsukiScreenState();
}

class _AkatsukiScreenState extends State<AkatsukiScreen> {
  final ApiService apiService = ApiService();
  late Future<List<AkatsukiMember>> membersFuture;

  @override
  void initState() {
    super.initState();
    membersFuture = apiService.fetchAkatsukiMembers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Члены Акацуки (Hive)')),
      body: FutureBuilder<List<AkatsukiMember>>(
        future: membersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else {
            final members = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: members.length,
              itemBuilder: (context, index) => MemberCard(
                name: members[index].name,
                imageUrl: members[index].images[0],
              ),
            );
          }
        },
      ),
    );
  }
}