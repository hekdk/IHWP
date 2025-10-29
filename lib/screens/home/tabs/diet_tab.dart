import 'package:flutter/material.dart';
import 'package:ihwp/providers/prakruti_provider.dart';
import 'package:ihwp/utils/app_theme.dart';
import 'package:ihwp/utils/static_data.dart';
import 'package:provider/provider.dart';


class DietTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prakrutiProvider = Provider.of<PrakrutiProvider>(context);
    final result = prakrutiProvider.result;

    if (result == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Please complete the questionnaire on the Home tab to see your diet plan.',
            style: AppTheme.bodyText,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final diet = getDietForPrakruti(result.dominantPrakruti);

    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Text(
          'Satvik Diet for ${result.dominantPrakruti}',
          style: AppTheme.heading2,
        ),
        SizedBox(height: 8),
        Text(
          diet['description']!,
          style: AppTheme.bodyText,
        ),
        SizedBox(height: 24),
        _buildFoodList(
          'Foods to Favor (Satvik)',
          diet['favor'] as List<String>,
          AppTheme.primaryColor,
        ),
        SizedBox(height: 24),
        _buildFoodList(
          'Foods to Reduce',
          diet['reduce'] as List<String>,
          AppTheme.accentColor,
        ),
      ],
    );
  }

  Widget _buildFoodList(String title, List<String> items, Color iconColor) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTheme.heading3.copyWith(color: iconColor),
            ),
            SizedBox(height: 12),
            ...items.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle_outline,
                          size: 20, color: iconColor),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(item, style: AppTheme.bodyText),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
