import 'package:flutter/material.dart';
import 'package:flutter_app_pa/pages/page.dart';


abstract class NestedFlow{
  /// All nested routes, which this flow includes
  Map<String, WidgetBuilder> get nestedRoutes;

  /// Url we should get in browser when navigate not to concrete page but to some "flow'
  String get homePageUrl;

  /// Page we should be redirected when navigate not to concrete page but to some "flow'
  MyPage get homePage;
}
