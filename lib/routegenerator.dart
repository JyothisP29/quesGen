import 'package:enumresponsive/model/routeargument.dart';
import 'package:enumresponsive/ui/views/edit.dart';
import 'package:enumresponsive/ui/views/generated_question.dart';
import 'package:enumresponsive/ui/views/home_view.dart';
import 'package:enumresponsive/ui/views/manual.dart';
import 'package:flutter/material.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    // Getting arguments passed in while calling Navigator.pushNamed
    switch (settings.name) {
      case '/homeView':
        return MaterialPageRoute(builder: (_) => const HomeView());
      case '/manual':
        return MaterialPageRoute(builder: (_) =>  Manual(   routeArgument: args as RouteArgument?,));
      case '/Edit':
        return MaterialPageRoute(builder: (_) =>  Edit(   routeArgument: args as RouteArgument?,));
      case '/generatedQuestion':
        return MaterialPageRoute(
            builder: (_) =>  GeneratedQuestions(
              routeArgument: args as RouteArgument?,
                ));

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(body: SizedBox(height: 0)));
    }
  }
}
