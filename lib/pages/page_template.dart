import 'package:flutter/material.dart';
import 'package:flutter_app_pa/navigation/navigation_service.dart';

class EmptyScreenWithButton extends StatelessWidget {
  final Widget child;
  final String name;

  const EmptyScreenWithButton({Key? key, required this.name, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name),
          child,
          if (name != "Home Page")
            ElevatedButton(
              onPressed: () {
                NavigationService.instance.proceedEvent(PopEvent());
              },
              child: Text("Back"),
            ),
        ],
      )),
    );
  }
}
