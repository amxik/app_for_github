import 'package:app_for_github/pages/add_issue_page.dart';
import 'package:app_for_github/pages/issues_page.dart';
import 'package:app_for_github/pages/repos_page.dart';
import 'package:app_for_github/api/issue_entity_api.dart';
import 'package:app_for_github/api/repo_entity_api.dart';
import 'package:app_for_github/services/navigation.dart';
import 'package:flutter/material.dart';

class Routes {
  static final NavigationService _navigationService = NavigationService();
  static final RepoEntityApi _repoEntityApi = RepoEntityApi();
  static final IssueEntityApi _issueEntityApi = IssueEntityApi();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationRoutes.repos:
        return MaterialPageRoute(
            builder: (context) => ReposPage(_repoEntityApi));
      case NavigationRoutes.issues:
        return MaterialPageRoute(
            builder: (context) => IssuesPage(
                settings.arguments, _navigationService, _issueEntityApi));
      case NavigationRoutes.addIssue:
        return MaterialPageRoute(
            builder: (context) => AddIssuePage(
                settings.arguments, _issueEntityApi));
      default:
        return throw "Routes error default";
    }
  }
}
