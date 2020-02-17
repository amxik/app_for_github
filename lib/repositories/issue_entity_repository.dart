
import 'dart:convert';

import 'package:app_for_github/services/url.dart';
import 'package:http/http.dart' as http;
import 'package:app_for_github/models/issue_entity.dart';

class IssueEntityRepository{

  Future<List<IssueEntity>> getIssues(String repoName) async {

    String url = UrlService().getIssuesUrl(repoName);

    http.Response response = await http.get(url);

   return List.from(json.decode(response.body)).map((item){
                return IssueEntity.fromJson(item);
    }).toList();
  }
}
