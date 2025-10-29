class Question {
  final String text;
  final List<QuestionOption> options;

  Question({required this.text, required this.options});
}

class QuestionOption {
  final String text;
  final String prakruti; 
  
  QuestionOption({required this.text, required this.prakruti});
}
