import 'package:flutter/material.dart';
import 'package:flutter_app_pa/navigation/navigation_service.dart';
import 'package:flutter_app_pa/pages/outer_pages.dart';
import 'package:flutter_app_pa/pages/page.dart';

class UnknownPage extends MyPage {
  final String arg;
  static const String pageName = "/ooops_page_not_found";

  UnknownPage([this.arg = ""]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Oooops! - 404"),),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Something goes wrong - unknown route: $arg"),
          ElevatedButton(onPressed: () {
            NavigationService.instance.proceedEvent(NavigateToAndRemoveEvent(routeName: HomeOuterPage.pageName));
          }, child: Text("Back to home page"))
        ],
      )),
    );
  }
}
