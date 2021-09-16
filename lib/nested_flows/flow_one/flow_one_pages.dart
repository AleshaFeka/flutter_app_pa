import 'package:flutter/material.dart';
import 'package:flutter_app_pa/mock_auth_service.dart';
import 'package:flutter_app_pa/navigation/navigation_service.dart';
import 'package:flutter_app_pa/nested_flows/flow_one/nested_flow_one.dart';
import 'package:flutter_app_pa/pages/page.dart';
import 'package:flutter_app_pa/pages/page_template.dart';

class FirstNestedPageFlowOne extends MyPage {
  static const String pageName = NestedFlowOne.flowRoute + "/page_one";

  @override
  Widget build(BuildContext context) {
    return EmptyScreenWithButton(
      name: "Flow One First Nested Page",
      child: ElevatedButton(
        onPressed: () {
          NavigationService.instance.proceedEvent(NavigateToEvent(routeName: SecondNestedPageFlowOne.pageName));
        },
        child: Text("Go To Flow One Second Nested Page"),
      ),
    );
  }
}

class SecondNestedPageFlowOne extends MyPage {
  static const String pageName = NestedFlowOne.flowRoute + "/page_two";

  @override
  Widget build(BuildContext context) {
    return EmptyScreenWithButton(
      name: "Flow One Second Nested Page",
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              MyAuthService.instance.changeAuthState = false;
            },
            child: Text("Logout"),
          ),
          ElevatedButton(
            onPressed: () {
              NavigationService.instance.proceedEvent(NavigateToEvent(routeName: "/blah-blah_no_such_page..."));
            },
            child: Text("Go to 404"),
          ),
        ],
      ),
    );
  }
}
