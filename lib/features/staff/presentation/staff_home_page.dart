import 'package:flutter/material.dart';

import '../../../tasks/presentation/tasks_list.dart';

class StaffHomePage extends StatelessWidget {
  const StaffHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Staff Workspace', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
              SizedBox(height: 16),
              Expanded(child: TasksList()),
            ],
          ),
        ),
      ),
    );
  }
}
