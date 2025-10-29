import 'package:flutter/foundation.dart';
import 'package:ihwp/providers/auth_provider.dart';
import 'package:ihwp/services/database_service.dart';
import 'package:intl/intl.dart';

class ExerciseProvider with ChangeNotifier {
  final DatabaseService _dbService;
  final AuthProvider _authProvider;

  Set<String> _completedToday = {};
  bool _isLoading = false;

  Set<String> get completedToday => _completedToday;
  bool get isLoading => _isLoading;

  ExerciseProvider(this._dbService, this._authProvider) {
    _authProvider.addListener(_onAuthChanged);
    _onAuthChanged(); // Initial load
  }

  void _onAuthChanged() {
    if (_authProvider.currentUser == null) {
      _completedToday.clear();
      notifyListeners();
    } else {
      loadCompletedExercises();
    }
  }

  @override
  void dispose() {
    _authProvider.removeListener(_onAuthChanged);
    super.dispose();
  }

  String _getTodayDate() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  Future<void> loadCompletedExercises() async {
    final userId = _authProvider.currentUser?.id;
    if (userId == null) return;

    _isLoading = true;
    notifyListeners();

    final date = _getTodayDate();
    final completed = await _dbService.getCompletedExercises(userId, date);
    _completedToday = completed.toSet();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> toggleExerciseCompleted(String exerciseId, bool completed) async {
    final userId = _authProvider.currentUser?.id;
    if (userId == null) return;

    final date = _getTodayDate();
    await _dbService.logExercise(userId, exerciseId, date, completed);

    if (completed) {
      _completedToday.add(exerciseId);
    } else {
      _completedToday.remove(exerciseId);
    }
    notifyListeners();
  }

  bool isExerciseCompleted(String exerciseId) {
    return _completedToday.contains(exerciseId);
  }
}
