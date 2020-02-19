import 'dart:convert';

import 'package:app_for_github/models/repo_entity.dart';
import 'package:http/http.dart' as http;
import 'package:app_for_github/services/url.dart';

class RepoEntityApi {
  final UrlService _urlService = UrlService();

  Future<List<RepoEntity>> getRepos() async {
    String url = _urlService.getReposUrl();

    http.Response response = await http.get(url);

    List<Map<String, dynamic>> jsonItems =
        List.from(json.decode(response.body));

    List<RepoEntity> repos =
        jsonItems.map((item) => RepoEntity.fromJson(item)).toList();

    return repos ?? [];
  }
}
