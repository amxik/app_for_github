import 'package:app_for_github/pages/add_issue_page.dart';
import 'package:app_for_github/pages/issues_page.dart';
import 'package:app_for_github/pages/repos_page.dart';
import 'package:app_for_github/services/navigation.dart';
import 'package:flutter/material.dart';

Route<dynamic> _generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case NavigationRoutes.repos:
      return MaterialPageRoute(builder: (context) => ReposPage());
    case NavigationRoutes.issues:
      return MaterialPageRoute(
          builder: (context) => IssuesPage(settings.arguments));
    case NavigationRoutes.addIssue:
      return MaterialPageRoute(
          builder: (context) => AddIssuePage(settings.arguments));
    default:
      return MaterialPageRoute(builder: (context) => ReposPage());
  }
}

void main() => runApp(MaterialApp(
      onGenerateRoute: _generateRoute,
    ));
