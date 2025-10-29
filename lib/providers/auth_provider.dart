import 'package:flutter/foundation.dart';
import 'package:ihwp/models/user_model.dart';
import 'package:ihwp/services/database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final DatabaseService _dbService;
  User? _currentUser;
  bool _isLoading = false;
  String? _errorMessage;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  AuthProvider(this._dbService);

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String? message) {
    _errorMessage = message;
  }

  Future<void> _saveUserSession(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userId', userId);
  }

  Future<void> loadUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');
    if (userId != null) {
      _currentUser = await _dbService.getUserById(userId);
      notifyListeners();
    }
  }

  Future<bool> login(String username, String password) async {
    _setLoading(true);
    _setError(null);
    try {
      final user = await _dbService.getUserByUsername(username, password);
      if (user != null) {
        _currentUser = user;
        await _saveUserSession(user.id);
        notifyListeners();
        return true;
      } else {
        _setError('Invalid username or password.');
        return false;
      }
    } catch (e) {
      _setError('An error occurred: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> signup(String username, String email, String password) async {
    _setLoading(true);
    _setError(null);
    try {
      final user = await _dbService.createUser(username, email, password);
      if (user != null) {
        _currentUser = user;
        await _saveUserSession(user.id);
        notifyListeners();
        return true;
      } else {
        _setError('Username or email may already be taken.');
        return false;
      }
    } catch (e) {
      _setError('An error occurred: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    _currentUser = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
    notifyListeners();
  }
}
