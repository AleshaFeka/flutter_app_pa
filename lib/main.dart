import 'package:flutter/material.dart';
import 'package:flutter_app_pa/mock_auth_service.dart';
import 'package:flutter_app_pa/navigation/navigation_service.dart';
import 'package:flutter_app_pa/nested_flows/flow_one/nested_flow_one.dart';
import 'package:flutter_app_pa/nested_flows/flow_two/nested_flow_two.dart';
import 'package:flutter_app_pa/nested_flows/nested_flow.dart';
import 'package:flutter_app_pa/pages/not_authenticated_page.dart';
import 'package:flutter_app_pa/pages/outer_pages.dart';
import 'package:flutter_app_pa/pages/page_not_found_page.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy(); /// Use this stuff from third-part library only for removing '#' symbol from url.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MyAuthService _myAuthService = MyAuthService.instance; /// Singleton used only for demo purposes.

  final _navigatorKey = GlobalKey<NavigatorState>();

  final NestedFlow _nestedFlowOne = NestedFlowOne();
  final NestedFlow _nestedFlowTwo = NestedFlowTwo();

  ///Here we store only high-level routes
  final Map<String, WidgetBuilder> _myOuterRoutes = {
    UnknownPage.pageName: (context) => UnknownPage(),
    HomeOuterPage.pageName: (context) => HomeOuterPage(),
    SecondOuterPage.pageName: (context) => SecondOuterPage(),
    NotAuthenticatedPage.pageName: (context) => NotAuthenticatedPage(),
  };

  MyApp() : super() {
    _doSomeInitNavigation();
  }

  ///Here we add all nested flow routes to our high-level routes
  _doSomeInitNavigation() {
    _myOuterRoutes.addAll(_nestedFlowOne.nestedRoutes);
    _myOuterRoutes.addAll(_nestedFlowTwo.nestedRoutes);
  }

  @override
  Widget build(BuildContext context) {
    NavigationService.initSingleton(_navigatorKey, _myAuthService); /// Singleton used only for demo purposes.

    return MaterialApp(
      navigatorKey: _navigatorKey,
      routes: _myOuterRoutes,
      initialRoute: HomeOuterPage.pageName,
      onUnknownRoute: _build404, /// Only for 404
      onGenerateRoute: _handleNestedFlow, /// Only for nested flows
    );
  }

  /// All nested flows should be here as well.
  Route<dynamic>? _handleNestedFlow(RouteSettings settings) {
    switch (settings.name) {
    /// Here we rebuild route name to correctly update the browser state. And 'do redirect' on flow's home page.
    /// We have to do it because of we did not navigate to concrete screen but to 'flow' in general.
    /// See outer_pages.dart, line 36
      case NestedFlowOne.flowRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: _nestedFlowOne.homePageUrl),
          builder: (BuildContext context) => _nestedFlowOne.homePage,
        );
      case NestedFlowTwo.flowRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: _nestedFlowTwo.homePageUrl),
          builder: (BuildContext context) => _nestedFlowTwo.homePage,
        );
    }
    return null;
  }

  Route _build404(RouteSettings settings) {
    return MaterialPageRoute(
      settings: RouteSettings(name: UnknownPage.pageName),
      builder: (context) => UnknownPage(settings.name!),
    );
  }
}
