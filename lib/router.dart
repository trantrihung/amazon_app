import 'package:amazon_app/features/auth/screens/signin_screen.dart';
import 'package:amazon_app/features/auth/screens/signup_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignIn.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignIn(),
      );

    case SignUp.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUp(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Screen do not exits"),
          ),
        ),
      );
  }
}
