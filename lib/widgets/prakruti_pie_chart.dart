import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ihwp/models/prakruti_result_model.dart';
import 'package:ihwp/utils/app_theme.dart';

class PrakrutiPieChart extends StatelessWidget {
  final PrakrutiResult result;

  const PrakrutiPieChart({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double total = (result.vataScore + result.pittaScore + result.kaphaScore).toDouble();
    
    // Handle division by zero if total is 0
    if (total == 0) {
      return Center(child: Text("No scores recorded.", style: AppTheme.bodyText));
    }

    return PieChart(
      PieChartData(
        sections: [
          _buildSection(
            (result.vataScore / total) * 100,
            'Vata',
            Color(0xFF4FC3F7), // Light Blue
          ),
          _buildSection(
            (result.pittaScore / total) * 100,
            'Pitta',
            Color(0xFFFFA726), // Orange
          ),
          _buildSection(
            (result.kaphaScore / total) * 100,
            'Kapha',
            Color(0xFF81C784), // Green
          ),
        ],
        centerSpaceRadius: 40,
        sectionsSpace: 2,
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            // Can add touch interactions here
          },
        ),
      ),
    );
  }

  PieChartSectionData _buildSection(double value, String title, Color color) {
    final isTouched = false; // Placeholder for touch interaction
    final fontSize = isTouched ? 16.0 : 14.0;
    final radius = isTouched ? 60.0 : 50.0;

    return PieChartSectionData(
      color: color,
      value: value,
      title: '${value.toStringAsFixed(1)}%\n$title',
      radius: radius,
      titleStyle: AppTheme.bodyText.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: AppTheme.textColor,
        shadows: [Shadow(color: Colors.black, blurRadius: 2)],
      ),
      titlePositionPercentageOffset: 0.55,
    );
  }
}
