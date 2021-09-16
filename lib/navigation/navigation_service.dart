import 'package:flutter/material.dart';
import 'package:flutter_app_pa/mock_auth_service.dart';
import 'package:flutter_app_pa/navigation/navigation_event.dart';
import 'package:flutter_app_pa/pages/not_authenticated_page.dart';

export 'package:flutter_app_pa/navigation/navigation_event.dart';

class NavigationService {
  ///   This static stuff below is only for demo-app purposes.
  ///   In real app we should use some DI system instead.
  static NavigationService? _instance;

  static NavigationService get instance {
    assert(_instance != null);
    return _instance as NavigationService;
  }

  static initSingleton(GlobalKey<NavigatorState> navigatorKey, MyAuthService myAuthService) {
    _instance = NavigationService(navigatorKey: navigatorKey, myAuthService: myAuthService);
  }

  ///   All static above should be removed in real app.

  final GlobalKey<NavigatorState> navigatorKey;
  final MyAuthService myAuthService;

  NavigationService({required this.myAuthService, required this.navigatorKey}) {
    myAuthService.addListener(_authListener);
  }

  void _authListener() {
    _proceedCheckForAuthentication();
  }

  bool _proceedCheckForAuthentication() {
    if (!myAuthService.isAuthenticated) {
      navigatorKey.currentState?.pushNamedAndRemoveUntil(NotAuthenticatedPage.pageName, (r) => false);
      return false;
    }
    return true;
  }

  void proceedEvent(NavigationEvent event, {bool ignoreAuth = false}) {
    assert(navigatorKey.currentState != null);

    if (!_proceedCheckForAuthentication() && !ignoreAuth) return;

    if (event is NavigateToEvent) {
      navigatorKey.currentState?.pushNamed(event.routeName, arguments: event.argument);
    }
    if (event is NavigateToAndRemoveEvent) {
      navigatorKey.currentState?.pushNamedAndRemoveUntil(event.routeName, (_) => false);
    }
    if (event is NavigateToAndPopEvent) {
      navigatorKey.currentState?.popAndPushNamed(event.routeName);
    }
    if (event is PopUntilEvent) {
      navigatorKey.currentState?.popUntil(ModalRoute.withName(event.routeName));
    }
    if (event is PopEvent) {
      navigatorKey.currentState?.pop();
    }
    if (event is PushAndPopUntilEvent) {
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil(event.pushRoute, ModalRoute.withName(event.popRoute), arguments: event.argument);
    }
  }
}
