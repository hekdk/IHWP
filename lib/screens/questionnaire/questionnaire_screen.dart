import 'package:flutter/material.dart';
import 'package:ihwp/models/question_model.dart';
import 'package:ihwp/providers/exercise_provider.dart';
import 'package:ihwp/providers/prakruti_provider.dart';
import 'package:ihwp/screens/home/home_screen.dart';
import 'package:ihwp/utils/app_theme.dart';
import 'package:ihwp/utils/static_data.dart';
import 'package:provider/provider.dart';


class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({super.key});

  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  final PageController _pageController = PageController();
  Map<int, String> _answers = {};
  int _currentPage = 0;
  final List<Question> _questions = StaticData.getQuestions();

  void _onAnswerSelected(int questionIndex, String prakruti) {
    setState(() {
      _answers[questionIndex] = prakruti;
    });
  }

  void _nextPage() {
    if (_currentPage < _questions.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // Last page, submit
      _submitAnswers();
    }
  }

  void _submitAnswers() async {
    final prakrutiProvider = Provider.of<PrakrutiProvider>(context, listen: false);
    await prakrutiProvider.calculateAndSavePrakruti(_answers);
    
    // Also preload exercise data for the new user
    final exerciseProvider = Provider.of<ExerciseProvider>(context, listen: false);
    await exerciseProvider.loadCompletedExercises();

    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => HomeScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Your Prakruti'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Question ${_currentPage + 1} of ${_questions.length}',
              style: AppTheme.heading3,
            ),
          ),
          LinearProgressIndicator(
            value: (_currentPage + 1) / _questions.length,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _questions.length,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return _buildQuestionPage(_questions[index], index);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text(
                _currentPage == _questions.length - 1 ? 'Submit' : 'Next',
              ),
              onPressed: _answers[_currentPage] != null ? _nextPage : null,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionPage(Question question, int questionIndex) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.text,
            style: AppTheme.heading2,
          ),
          SizedBox(height: 24),
          ...question.options.map((option) {
            bool isSelected = _answers[questionIndex] == option.prakruti;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Card(
                elevation: isSelected ? 4 : 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: isSelected ? AppTheme.primaryColor : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: RadioListTile<String>(
                  title: Text(option.text, style: AppTheme.bodyText),
                  value: option.prakruti,
                  groupValue: _answers[questionIndex],
                  onChanged: (value) {
                    if (value != null) {
                      _onAnswerSelected(questionIndex, value);
                    }
                  },
                  activeColor: AppTheme.primaryColor,
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
