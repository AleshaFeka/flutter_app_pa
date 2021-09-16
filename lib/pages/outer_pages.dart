import 'package:flutter/material.dart';
import 'package:flutter_app_pa/navigation/navigation_service.dart';
import 'package:flutter_app_pa/nested_flows/flow_one/nested_flow_one.dart';
import 'package:flutter_app_pa/nested_flows/flow_two/nested_flow_two.dart';
import 'package:flutter_app_pa/pages/page.dart';
import 'package:flutter_app_pa/pages/page_template.dart';

class HomeOuterPage extends MyPage {
  static const String pageName = "/home_outer";

  @override
  Widget build(BuildContext context) {
    return EmptyScreenWithButton(
      name: "Home Page",
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              NavigationService.instance.proceedEvent(NavigateToEvent(routeName: SecondOuterPage.pageName));
            },
            child: Text("Go to next outer page"),
          ),
        ],
      ),
    );
  }
}

class SecondOuterPage extends MyPage {
  static const String pageName = "/second_outer";

  @override
  Widget build(BuildContext context) {
    return EmptyScreenWithButton(
      name: "Second Outer Page",
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              /// Pay attention that we navigate not to some concrete page but to 'flow'
              NavigationService.instance.proceedEvent(NavigateToEvent(routeName: NestedFlowOne.flowRoute));
            },
            child: Text("Go to nested flow one"),
          ),
          ElevatedButton(
            onPressed: () {
              NavigationService.instance.proceedEvent(NavigateToEvent(routeName: NestedFlowTwo.flowRoute));
            },
            child: Text("Go to nested flow two"),
          )
        ],
      ),
    );
  }
}
