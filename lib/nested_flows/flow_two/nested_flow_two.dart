import 'package:flutter/material.dart';
import 'package:flutter_app_pa/nested_flows/flow_two/flow_two_pages.dart';
import 'package:flutter_app_pa/nested_flows/nested_flow.dart';
import 'package:flutter_app_pa/pages/page.dart';

class NestedFlowTwo extends NestedFlow {
  static const String flowRoute = "/nested_two";

  @override
  MyPage get homePage => FirstNestedPageFlowTwo();

  @override
  String get homePageUrl => FirstNestedPageFlowTwo.pageName;

  @override
  Map<String, WidgetBuilder> get nestedRoutes => {
        FirstNestedPageFlowTwo.pageName: (context) => FirstNestedPageFlowTwo(),
        SecondNestedPageFlowTwo.pageName: (context) => SecondNestedPageFlowTwo(),
      };
}
