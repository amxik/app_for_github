import 'dart:convert';

import 'package:app_for_github/models/repo_entity.dart';
import 'package:http/http.dart' as http;
import 'package:app_for_github/services/url.dart';

class RepoEntityRepository{

  Future<List<RepoEntity>> getRepos() async {

    String url = UrlService().getReposUrl();

    http.Response response = await http.get(url);

    return List.from(json.decode(response.body)).map((item){
      return RepoEntity.fromJson(item);
    }).toList();
  }
}