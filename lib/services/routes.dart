import 'package:app_for_github/pages/add_issue_page.dart';
import 'package:app_for_github/pages/issues_page.dart';
import 'package:app_for_github/pages/repos_page.dart';
import 'package:app_for_github/api/issue_entity_api.dart';
import 'package:app_for_github/api/repo_entity_api.dart';
import 'package:app_for_github/services/dialog_service.dart';
import 'package:app_for_github/services/navigation.dart';
import 'package:flutter/material.dart';

class Routes {
  static final NavigationService _service = NavigationService();
  static final RepoEntityApi _repoEntityRepository = RepoEntityApi();
  static final IssueEntityApi _issueEntityRepository = IssueEntityApi();
  static final DialogService _dialogService = DialogService();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationRoutes.repos:
        return MaterialPageRoute(
            builder: (context) => ReposPage(_repoEntityRepository));
      case NavigationRoutes.issues:
        return MaterialPageRoute(
            builder: (context) => IssuesPage(
                settings.arguments, _service, _issueEntityRepository));
      case NavigationRoutes.addIssue:
        return MaterialPageRoute(
            builder: (context) => AddIssuePage(
                settings.arguments, _issueEntityRepository, _dialogService));
      default:
        return MaterialPageRoute(
            builder: (context) => ReposPage(_repoEntityRepository));
    }
  }
}
