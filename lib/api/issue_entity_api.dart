import 'dart:convert';

import 'package:app_for_github/services/url.dart';
import 'package:http/http.dart' as http;
import 'package:app_for_github/models/issue_entity.dart';

class IssueEntityApi {
  final UrlService _urlService = UrlService();

  Future<List<IssueEntity>> getIssues(String repoName) async {
    String url = _urlService.getIssuesUrl(repoName);

    http.Response response = await http.get(url);

    List<Map<String, dynamic>> jsonItems =
        List.from(json.decode(response.body));

    List<IssueEntity> issues =
        jsonItems.map((item) => IssueEntity.fromJson(item)).toList();
    return issues ?? [];
  }

  Future<IssueEntity> addIssue(IssueEntity issueEntity, String repoName) async {
    String url = _urlService.getIssuesUrl(repoName);
    http.Response response =
        await http.post(url, body: IssueEntity.toJson(issueEntity));

    Map<String, dynamic> issueMap = json.decode(response.body);

    return IssueEntity.fromJson(issueMap);
  }
}
