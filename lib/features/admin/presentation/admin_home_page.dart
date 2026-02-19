import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Admin Console', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              const Text('Users / roles / projects / staff assignment analytics'),
              const SizedBox(height: 20),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: BarChart(
                      BarChartData(
                        barGroups: [
                          BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 11)]),
                          BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 7)]),
                          BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 4)]),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
