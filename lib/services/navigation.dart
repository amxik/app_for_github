import 'package:flutter/material.dart';

class NavigationRoutes {
  static final String repos = "/repos";
  static final String issues = "/issues";
  static final String addIssue = "/addIssue";
}

class IssuesPageArguments {
  final String repoName;

  const IssuesPageArguments(this.repoName);
}

class NavigationService {
  const NavigationService();

  openReposPage(BuildContext context) {
    Navigator.pushNamed(context, NavigationRoutes.repos);
  }

  openIssuesPage(BuildContext context, String repoName) {
    final args = IssuesPageArguments(repoName);
    Navigator.pushNamed(context, NavigationRoutes.issues, arguments: args);
  }

  openAddIssuesPage(BuildContext context, String repoName) {
    final args = IssuesPageArguments(repoName);
    Navigator.pushNamed(context, NavigationRoutes.addIssue, arguments: args);
  }
}
