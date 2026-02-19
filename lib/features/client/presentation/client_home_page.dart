import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../projects/presentation/projects_list.dart';

class ClientHomePage extends ConsumerWidget {
  const ClientHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Client Workspace', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
              SizedBox(height: 16),
              Expanded(child: ProjectsList(roleMode: 'client')),
            ],
          ),
        ),
      ),
    );
  }
}
