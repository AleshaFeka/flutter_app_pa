import 'package:flutter/material.dart';
import 'package:flutter_app_pa/nested_flows/flow_one/flow_one_pages.dart';
import 'package:flutter_app_pa/nested_flows/nested_flow.dart';
import 'package:flutter_app_pa/pages/page.dart';

class NestedFlowOne extends NestedFlow{
  static const String flowRoute = "/nested_one";

  @override
  MyPage get homePage => FirstNestedPageFlowOne();

  @override
  String get homePageUrl => FirstNestedPageFlowOne.pageName;

  @override
  Map<String, WidgetBuilder> get nestedRoutes => {
    FirstNestedPageFlowOne.pageName: (context) => FirstNestedPageFlowOne(),
    SecondNestedPageFlowOne.pageName: (context) => SecondNestedPageFlowOne(),
  };
}
