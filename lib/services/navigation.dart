import 'package:flutter/material.dart';

class NavigationRoutes {
  static const String repos = "/repos";
  static const String issues = "/issues";
  static const String addIssue = "/addIssue";
}

class NavigationService {
  const NavigationService();

  openReposPage(BuildContext context) {
    Navigator.pushNamed(context, NavigationRoutes.repos);
  }

  openIssuesPage(BuildContext context, String repoName) {
    Navigator.pushNamed(context, NavigationRoutes.issues, arguments: repoName);
  }

  openAddIssuesPage(BuildContext context, String repoName) {
    Navigator.pushNamed(context, NavigationRoutes.addIssue, arguments: repoName);
  }



}
