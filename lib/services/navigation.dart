import 'package:flutter/material.dart';

class NavigationRoutes {
  static const String repos = "/";
  static const String issues = "/issues";
  static const String addIssue = "/addIssue";
}

class NavigationService {
  Future<void> openReposPage(BuildContext context) =>
      Navigator.pushNamed(context, NavigationRoutes.repos);

  Future<void> openIssuesPage(BuildContext context, String repoName) =>
      Navigator.pushNamed(context, NavigationRoutes.issues,
          arguments: repoName);

  Future<void> openAddIssuesPage(BuildContext context, String repoName) =>
      Navigator.pushNamed(context, NavigationRoutes.addIssue,
          arguments: repoName);
}
