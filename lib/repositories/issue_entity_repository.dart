import 'dart:convert';

import 'package:app_for_github/services/url.dart';
import 'package:http/http.dart' as http;
import 'package:app_for_github/models/issue_entity.dart';

class IssueEntityRepository {
  final UrlService _urlService = UrlService();

  Future<List<IssueEntity>> getIssues(String repoName) async {
    String url = _urlService.getIssuesUrl(repoName);

    http.Response response = await http.get(url);

    return List.from(json.decode(response.body)).map((item) {
      return IssueEntity.fromJson(item);
    }).toList();
  }

  Future<int> addIssue(IssueEntity issueEntity, String repoName) async {
    http.Response response = await http.post(_urlService.getIssuesUrl(repoName),
        body: json.encode({
          "title": issueEntity.title ?? "New Issue",
          "body": issueEntity.body ?? "",
          "assignees": issueEntity.assignees ?? [],
          "labels": issueEntity.labels ?? []
        }));

    return response.statusCode;
  }
}
