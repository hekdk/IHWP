import 'package:flutter/material.dart';
import 'package:ihwp/providers/auth_provider.dart';
import 'package:ihwp/providers/prakruti_provider.dart';
import 'package:ihwp/screens/questionnaire/questionnaire_screen.dart';
import 'package:ihwp/utils/app_theme.dart';
import 'package:ihwp/utils/static_data.dart';
import 'package:ihwp/widgets/prakruti_pie_chart.dart';
import 'package:provider/provider.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;

    return Consumer<PrakrutiProvider>(
      builder: (context, prakrutiProvider, child) {
        if (prakrutiProvider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (prakrutiProvider.result == null) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome, ${user?.username ?? ''}!',
                    style: AppTheme.heading2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "You haven't determined your Prakruti yet.",
                    style: AppTheme.bodyText,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    child: Text('Find Your Prakruti'),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => QuestionnaireScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }

        // --- User has a result ---
        final result = prakrutiProvider.result!;
        final description = getPrakrutiDescription(result.dominantPrakruti);

        return SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back, ${user?.username ?? ''}!',
                style: AppTheme.heading2.copyWith(color: AppTheme.primaryColor),
              ),
              SizedBox(height: 8),
              Text(
                'Your Dominant Prakruti is',
                style: AppTheme.bodyText,
              ),
              Text(
                result.dominantPrakruti,
                style: AppTheme.heading1.copyWith(fontSize: 36),
              ),
              SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Your Prakruti Balance',
                        style: AppTheme.heading3,
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 200,
                        child: PrakrutiPieChart(result: result),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About ${result.dominantPrakruti}',
                        style: AppTheme.heading3,
                      ),
                      SizedBox(height: 12),
                      Text(
                        description,
                        style: AppTheme.bodyText,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
