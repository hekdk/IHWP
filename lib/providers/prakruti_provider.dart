import 'package:flutter/foundation.dart';
import 'package:ihwp/models/prakruti_result_model.dart';
import 'package:ihwp/providers/auth_provider.dart';
import 'package:ihwp/services/database_service.dart';

class PrakrutiProvider with ChangeNotifier {
  final DatabaseService _dbService;
  final AuthProvider _authProvider;

  PrakrutiResult? _result;
  bool _isLoading = false;

  PrakrutiResult? get result => _result;
  bool get isLoading => _isLoading;

  PrakrutiProvider(this._dbService, this._authProvider) {
    // Listen to auth changes
    _authProvider.addListener(_onAuthChanged);
    // Initial load if user is already logged in
    _onAuthChanged();
  }
  
  void _onAuthChanged() {
    if (_authProvider.currentUser == null) {
      _result = null; // Clear data on logout
      notifyListeners();
    } else {
      loadPrakrutiResult(); // Load data on login
    }
  }

  @override
  void dispose() {
    _authProvider.removeListener(_onAuthChanged);
    super.dispose();
  }

  Future<void> loadPrakrutiResult() async {
    final userId = _authProvider.currentUser?.id;
    if (userId == null) return;

    _isLoading = true;
    notifyListeners();

    _result = await _dbService.getPrakrutiResult(userId);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> calculateAndSavePrakruti(Map<int, String> answers) async {
    final userId = _authProvider.currentUser?.id;
    if (userId == null) return;

    _isLoading = true;
    notifyListeners();

    int vataScore = 0;
    int pittaScore = 0;
    int kaphaScore = 0;

    answers.forEach((key, value) {
      if (value == 'Vata') vataScore++;
      if (value == 'Pitta') pittaScore++;
      if (value == 'Kapha') kaphaScore++;
    });

    String dominantPrakruti = 'Vata';
    if (pittaScore > vataScore && pittaScore > kaphaScore) {
      dominantPrakruti = 'Pitta';
    } else if (kaphaScore > vataScore && kaphaScore > pittaScore) {
      dominantPrakruti = 'Kapha';
    }
    
    final newResult = PrakrutiResult(
      userId: userId,
      vataScore: vataScore,
      pittaScore: pittaScore,
      kaphaScore: kaphaScore,
      dominantPrakruti: dominantPrakruti,
    );

    await _dbService.savePrakrutiResult(newResult);
    _result = newResult;

    _isLoading = false;
    notifyListeners();
  }
}
