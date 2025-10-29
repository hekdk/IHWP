import 'package:flutter/material.dart';
import 'package:ihwp/models/exercise_model.dart';
import 'package:ihwp/providers/exercise_provider.dart';
import 'package:ihwp/providers/prakruti_provider.dart';
import 'package:ihwp/utils/app_theme.dart';
import 'package:ihwp/utils/static_data.dart';
import 'package:provider/provider.dart';


class ExerciseTab extends StatelessWidget {
  const ExerciseTab({super.key});

  @override
  Widget build(BuildContext context) {
    final prakrutiProvider = Provider.of<PrakrutiProvider>(context);
    final result = prakrutiProvider.result;

    if (result == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Please complete the questionnaire on the Home tab to see your exercise plan.',
            style: AppTheme.bodyText,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final exercises = getExercisesForPrakruti(result.dominantPrakruti);

    return Consumer<ExerciseProvider>(
      builder: (context, exerciseProvider, child) {
        return ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Text(
              'Yoga & Exercise for ${result.dominantPrakruti}',
              style: AppTheme.heading2,
            ),
            SizedBox(height: 8),
            Text(
              'Mark your completed activities for today.',
              style: AppTheme.bodyText,
            ),
            SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Yoga Asanas',
                      style: AppTheme.heading3.copyWith(color: AppTheme.primaryColor),
                    ),
                    SizedBox(height: 8),
                    ...exercises['yoga']!.map(
                      (exercise) => _buildExerciseTile(
                        context,
                        exercise,
                        exerciseProvider,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
             Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Exercises & Activities',
                      style: AppTheme.heading3.copyWith(color: AppTheme.accentColor),
                    ),
                    SizedBox(height: 8),
                    ...exercises['exercise']!.map(
                      (exercise) => _buildExerciseTile(
                        context,
                        exercise,
                        exerciseProvider,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildExerciseTile(
    BuildContext context,
    Exercise exercise,
    ExerciseProvider provider,
  ) {
    bool isCompleted = provider.isExerciseCompleted(exercise.id);

    return CheckboxListTile(
      title: Text(exercise.name, style: AppTheme.bodyText),
      subtitle: Text(exercise.description),
      value: isCompleted,
      onChanged: (bool? value) {
        if (value != null) {
          provider.toggleExerciseCompleted(exercise.id, value);
        }
      },
      activeColor: AppTheme.primaryColor,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
