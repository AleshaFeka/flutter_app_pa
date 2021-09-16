import 'package:flutter/material.dart';
import 'package:flutter_app_pa/navigation/navigation_service.dart';
import 'package:flutter_app_pa/pages/outer_pages.dart';
import 'package:flutter_app_pa/pages/page.dart';

class NotAuthenticatedPage extends MyPage {
  static const String pageName = "/not_authenticated_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Not Authenticated"),),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Something goes wrong - your authentication failed"),
          ElevatedButton(onPressed: () {
            NavigationService.instance.proceedEvent(NavigateToAndRemoveEvent(routeName: HomeOuterPage.pageName), ignoreAuth: true);
          }, child: Text("Back to home page"))
        ],
      )),
    );
  }
}
