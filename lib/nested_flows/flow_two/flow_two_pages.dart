import 'package:flutter/material.dart';
import 'package:flutter_app_pa/navigation/navigation_service.dart';
import 'package:flutter_app_pa/nested_flows/flow_two/nested_flow_two.dart';
import 'package:flutter_app_pa/pages/page.dart';
import 'package:flutter_app_pa/pages/page_template.dart';

class FirstNestedPageFlowTwo extends MyPage {
  static const String pageName = NestedFlowTwo.flowRoute + "/page_one";

  @override
  Widget build(BuildContext context) {
    return EmptyScreenWithButton(
      name: "Flow Two First Nested Page",
      child: ElevatedButton(
        onPressed: () {
          NavigationService.instance.proceedEvent(NavigateToEvent(
            routeName: SecondNestedPageFlowTwo.pageName,
            argument: "Arg from First Nested Page :)",
          ));
        },
        child: Text("Go To Flow Two Second Nested Page"),
      ),
    );
  }
}

class SecondNestedPageFlowTwo extends MyPage {
  static const String pageName = NestedFlowTwo.flowRoute + "/page_two";

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as String?;

    return EmptyScreenWithButton(
      name: "Flow Two Second Nested Page, arg = $arg",
      child: ElevatedButton(
        onPressed: () {
          NavigationService.instance.proceedEvent(NavigateToEvent(routeName: "/blah-blah_no_such_page..."));
        },
        child: Text("Go to 404"),
      ),
    );
  }
}
