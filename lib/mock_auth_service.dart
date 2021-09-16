import 'package:flutter/foundation.dart';

class MyAuthService with ChangeNotifier{
  static final instance = MyAuthService();

  bool _isAuth = true;

  get isAuthenticated => _isAuth;

  set changeAuthState(bool newState) {
    _isAuth = newState;
    notifyListeners();
  }
}