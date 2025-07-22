import 'package:flutter/foundation.dart';
import '../services/auth_service.dart';
import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService;
  UserModel? _user;
  bool _isLoading = true;

  AuthProvider(this._authService) {
    _initializeAuth();
  }

  UserModel? get user => _user;
  bool get isLoading => _isLoading;

  void _initializeAuth() {
    _authService.authStateChanges.listen((firebaseUser) {
      if (firebaseUser != null) {
        _user = UserModel.fromFirebaseUser(firebaseUser);
      } else {
        _user = null;
      }
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> signInWithGoogle() async {
    try {
      _isLoading = true;
      notifyListeners();

      final user = await _authService.signInWithGoogle();
      _user = user;
    } catch (e) {
      debugPrint('Google sign in error: $e');
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    try {
      await _authService.signOut();
      _user = null;
      notifyListeners();
    } catch (e) {
      debugPrint('Sign out error: $e');
      rethrow;
    }
  }
}
