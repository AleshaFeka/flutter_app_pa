abstract class NavigationEvent {
  const NavigationEvent();
}

class NavigateToEvent extends NavigationEvent {
  final String routeName;
  final dynamic argument;

  const NavigateToEvent({required this.routeName, this.argument});
}

class NavigateToAndRemoveEvent extends NavigationEvent {
  final String routeName;
  final dynamic argument;

  const NavigateToAndRemoveEvent({required this.routeName, this.argument});
}

class PopEvent extends NavigationEvent {
  const PopEvent();
}

class NavigateToAndPopEvent extends NavigationEvent {
  final String routeName;

  const NavigateToAndPopEvent({required this.routeName});
}

class PopUntilEvent extends NavigationEvent {
  final String routeName;

  const PopUntilEvent({required this.routeName});
}

class PushAndPopUntilEvent extends NavigationEvent {
  final String pushRoute;
  final String popRoute;
  final dynamic argument;

  const PushAndPopUntilEvent({required this.pushRoute, required this.popRoute, this.argument});
}

class NavigatePopAndPush extends NavigationEvent {
  final String routeName;

  const NavigatePopAndPush({required this.routeName});
}
